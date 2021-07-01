# Wednesday Review

2. List 3 different comparison operators

equal        - -eq  
greater than - -gt
less than    - -lt
<=           - -le
>=             -ge

5. Why do I have to use a verb from the list?
ex. Set, Get, 
* It's exectations - Semantics 
* More readable
* Because I said so

4. How can I make a variable constant? And why?
`Set-Variable` 
`New-Variable -Option Constant`

Can't get clobbered.

1. Why would you put a type on a variable? And how?
(Get-Variable PROFILE).GetType()
```
[float]$interestRate = 3.14
$interestRate = 'apple' ## Bonk! 
```
7. What are the 3 ways to return data from a function?
  1. `Write-Output`
  2. `return`
  3. Implicit return

function Get-Lyrics{
	return 'Yeah', 'Yeah', 'Yeah'
	write-output 'Yeah', 'Yeah', 'Yeah'
	'yeah'
	'yeah'
	'yeah'
	Get-Process
}

$result = Get-Lyrics


6. How can I provide some decent help content for my custom function?
Specifically formatted text in a block comment

ex: 
```
<#
.SYNOPSIS
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   PS C:\> <example usage>
   Explanation of what the example does
.INPUTS
   Inputs (if any)
.OUTPUTS
   Output (if any)
.NOTES
   General notes
#>
```



3. What's string interpolation?

```
$name = 'bloggs'
$title = 'Esq'
Write-Host "My name is $name"
Write-Host "My name is " + $name.ToUpper() +", " + $title.ToUpper() + "."

#Alternative
Write-Host "My name is $($name.ToUpper()), $($title.ToUpper())."

Get-Process | Select-Object -Properties Name, WS, $(Where-Object {$_.Name -eq 'code'}}_.Weird"

```

