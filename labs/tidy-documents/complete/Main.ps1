Set-StrictMode -Version Latest

#region demo-setup
New-Variable AssetsRoot "$(Split-Path $PSScriptRoot)/_assets" -Option Readonly, Private -Force 

Import-Module -Force $AssetsRoot/Reset-Demo.ps1

Reset-Demo $assetsRoot | Out-Null
#endregion demo-setup

Import-Module $PSScriptRoot/Remove-Empties.ps1 -Force
Import-Module $PSScriptRoot/Remove-Duplicates.ps1 -Force

#Optimize-Tidiness $AssetsRoot

Remove-Empties $AssetsRoot -WhatIf



# Find-DuplicateFiles $AssetsRoot
