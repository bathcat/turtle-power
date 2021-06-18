using module './Get-Fibs.ps1'
using module './Select-InRange.ps1'
using module './Select-Evens.ps1'
using module './Select-Sum.ps1'

"Here is your answer: "

Get-Fibs 60 |
    Select-InRange |
    Select-Evens |
    Select-Sum
