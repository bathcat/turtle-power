Import-Module $PSScriptRoot/Optimize-Tidiness.ps1 -Force

$path = $PSCommandPath |
  Split-Path |
  Split-Path |
  Join-Path -ChildPath '_assets'

Optimize-Tidiness $path
