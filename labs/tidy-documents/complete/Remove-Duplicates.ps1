using namespace System.Management.Automation
 
# Good writeup here:
#  https://powershell.one/tricks/filesystem/finding-duplicate-files

class FileSet{
  [System.IO.FileInfo[]]$files
}

function Find-DuplicateFiles {
  [CmdletBinding()]
  [OutputType([FileSet[]])]
  param (
      [Parameter(Mandatory)]
      [ValidateScript({Test-Path $_})]
      [string]$path
  )

  return Get-ChildItem $path -Recurse -File |
      # TODO: It's more efficient to get duplicated lengths first
      #       But it's not working somehow
      # Group-Object -Property Length |
      # ? Count -gt 1 |
      # % Group |
      Group-Object -Property @{Expression = { (Get-FileHash $_).Hash }} |
      ? Count -gt 1 |
      % {[Fileset]@{files=$_.Group}}
}

function Compress-DuplicateFiles{
  [CmdletBinding(
    SupportsShouldProcess,
    ConfirmImpact = 'High'
  )]
  param (
      [Parameter(Mandatory,ValueFromPipeline)]
      [FileSet]$set,
      [Switch]$Force
  )

  process {
    if ($Force){
      $ConfirmPreference = 'None'
    }

    $paths = $set.files | % FullName -WhatIf:$false
    $goldCopy = $paths | Select-Object -First 1
    $redundancies = $paths | Select-Object -Skip 1

    $reason = [ShouldProcessReason]::None
    $shouldProcess = $PSCmdlet.ShouldProcess('MESSAGE','TARGET','OPERATION',[ref]$reason)

    [bool]$isWhatif = $reason -eq [ShouldProcessReason]::WhatIf

    if((-not $shouldProcess) -and (-not $isWhatif )){
      return;
    }
    foreach ($path in $redundancies) {
      Remove-Item $path -WhatIf:$isWhatif
      New-Item -Path $path -ItemType SymbolicLink -Target $goldCopy -WhatIf:$isWhatif
    }
  }
}

