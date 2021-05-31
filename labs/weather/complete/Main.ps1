. $PSCommandPath.Replace('Main.ps1','Get-Forecast.ps1')

Get-CurrentLocation |
Get-GridLocation |
Get-Forecast
