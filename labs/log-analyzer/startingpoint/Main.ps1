Import-Module -Force $PSCommandPath.Replace('Main.ps1','Build-Report.ps1')

$path = $PSCommandPath |
  Split-Path |
  Split-Path |
  Join-Path -ChildPath '_assets/prod221.log'

Build-Report $path
