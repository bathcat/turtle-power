Import-Module -Force $PSCommandPath.Replace('Main.ps1','Optimize-Tidiness.ps1')

$path = $PSCommandPath |
  Split-Path |
  Split-Path |
  Join-Path -ChildPath '_assets'

Optimize-Tidiness $path
