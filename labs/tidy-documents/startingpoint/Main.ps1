Set-StrictMode -Version Latest
Import-Module $PSScriptRoot/Optimize-Tidiness.ps1 -Force
Import-Module $PSScriptRoot/Reset-Demo.ps1 -Force

$target = $PSCommandPath |
  Split-Path |
  Split-Path |
  Join-Path -ChildPath '_assets'

Reset-Demo $target | Out-Null
Optimize-Tidiness $target -WhatIf
