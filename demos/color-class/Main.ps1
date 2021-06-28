Import-Module $PSScriptRoot/Build-Color.ps1 -Force

[Color]$grey = Build-Color 128 128 128

[string]$color = $grey
$color
