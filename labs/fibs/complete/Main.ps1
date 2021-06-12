using module './Get-Fibs.ps1'

"Here is your answer: "

Get-Fibs 60 |
Select-InRange |
Select-Evens |
Get-Sum

