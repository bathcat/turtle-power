function Remove-Empties {
  [CmdletBinding(
    SupportsShouldProcess,
    ConfirmImpact = 'High'
  )]
  param (
      [Parameter(Mandatory)]
      [string]$path
  )
  $empties = Get-ChildItem -Path $path -Recurse |
                ?{$_ -is [System.IO.DirectoryInfo]} |
                ?{$_.GetFileSystemInfos().Count -eq 0}

  if (-not $PSCmdlet.ShouldProcess($path)) {
    foreach($empty in $empties){
      Write-Host "`t" -NoNewline
      Remove-Item $empty -WhatIf
    }
    return
  }

  Remove-Item $empties
}