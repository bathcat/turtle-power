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
      [string]$path
  )

  return Get-ChildItem $path -Recurse -File |
      # TODO: It's more effecient to get duplicated lengths first
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
      [FileSet]$set
  )

  process {
    $paths = $set.files | % FullName

    $PSCmdlet.ShouldProcess($paths)
    $PSCmdlet.


    $goldCopy = $paths | Select-Object -First 1
    $redundancies = $paths | Select-Object -Skip 1

    foreach ($path in $redundancies) {
        Remove-Item $path -WhatIf:$WhatIfPreference
        New-Item -Path $path -ItemType SymbolicLink -Target $goldCopy -WhatIf:$WhatIfPreference
    }
  }
}

