. $PSCommandPath.Replace('Main.ps1','Get-Forecast.ps1')

$here = Get-CurrentLocation
$hereOnGrid = Get-GridLocation $here.latitude $here.longitude

Get-Forecast $hereOnGrid.office $hereOnGrid.x $hereOnGrid.y

