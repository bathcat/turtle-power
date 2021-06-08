Import-Module $PSCommandPath.Replace('Main.ps1','Write-Report.ps1')

$path = $PSCommandPath |
  Split-Path |
  Split-Path |
  Join-Path -ChildPath '_assets/prod221.log'

Write-Report $path
