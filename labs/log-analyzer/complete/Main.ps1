Import-Module $PSScriptRoot/Write-Report.ps1 -Force

$path = $PSCommandPath |
  Split-Path |
  Split-Path |
  Join-Path -ChildPath '_assets/prod221.log'

Write-Report $path
