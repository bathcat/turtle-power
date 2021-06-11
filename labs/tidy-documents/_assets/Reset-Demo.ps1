function Reset-Demo{
  [cmdletbinding(SupportsShouldProcess)]
  param (
    [Parameter(Mandatory)]
    [string]$root
  )
  $paths = "$root/Documents/Videos", "$root/Downloads/Pensky"

  if (-not $PSCmdlet.ShouldProcess($root)) {
    foreach($path in $paths){
      Write-Host "`t" -NoNewline
      New-Item -Path $path -ItemType Directory -Force -WhatIf
    }
    return
  }

  New-Item -Path $paths -ItemType Directory -Force
}
