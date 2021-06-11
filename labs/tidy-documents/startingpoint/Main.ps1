#region demo-setup
New-Variable AssetsRoot "$(Split-Path $PSScriptRoot)/_assets" -Option Readonly, Private -Force 
Import-Module -Force $AssetsRoot/Reset-Demo.ps1
Reset-Demo $assetsRoot | Out-Null
#endregion demo-setup

Import-Module $PSScriptRoot/Optimize-Tidiness.ps1 -Force
Optimize-Tidiness $assetsRoot
