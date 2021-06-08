Import-Module $PSScriptRoot/Get-Fibs.ps1 -Force

"Here is your answer: "

Get-Fibs 60 |
Select-InRange |
Select-Evens |
Get-Sum

