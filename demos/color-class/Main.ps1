Import-Module $PSScriptRoot/Build-Color.ps1 -Force

[Color]$grey = Build-Color 128 128 128

$grey.ToString()

$grey.GetType()