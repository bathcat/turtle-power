# Thursday AM Review
---------------
9. What's the deal with `-WhatIf`
  * Set the flag. 
  * Like a test mode. 
  * Show what it would do.
  * Helpful for when you might break stuff.
  * Remove-Item New-Item 

2. What's the deal with 'advanced function'?
* Steroid function
* Validation on parameters
* [Cmdletbinding()] 
* Whatif, Confirm, Information, Debug, parameter help.

6. What's the deal with parameter validation?
* Types on parameters
```powershell
  Param(
  	[ValidateSet('Low', 'Medium', 'Family Size')]
  	[ValidateScript({Test-Path $_})] # Scriptblock
  	[string]$Path
  )
```
```powershell
try{
$result = Get-Thing -Path 'c:/toomp'
}
catch{
	$result = 'Some default.'
}

```

1. What's the deal with keyword `enum`?
* Data type
* Limits the value of a variable to a pre-defined list
* Wraps integer
* Label
```powershell
enum DayOfWeek{
	Sunday = 0
	Monday = 1
	Tuesday = 2
	# ...
}
```
```powershell
[Flags()]enum FileProperty{
	None = 0
	Hidden = 1
	Encrypted = 2
	ReadOnly = 4
	Archived = 8
	# ...
}
```

8. What's the deal with `[System.Collections.ArrayList]`?
* .NET class
* Linked list
* Insertion time: O(k)
  - Possible alternative if Powershell array gets slow
* More built-in functions
  - Accessed vi $myArrayList.Add(13) 



5. What's the deal with these functions?
```powershell
function Get-User($SID){
	#....
}
function Get-User{
	param($SID)
	#....
}
```
* #1 looks familiar
* #2 is for grown-ups
  - compatible with 'advanced functions'

7. What's the deal with hash tables?
* Object with Keys and values
* Get value associated with a key 
* Keys can be:
  - strings
  - integers
  - Anything that's immutable
* `.GetHashCode()`

4. What's the deal with this?
```powershell
   [CmdletBinding(
      SupportsShouldProcess,
      ConfirmImpact = 'High'
   )]
```
* Advanced function
* Relates to 
  - Whatif
  - Confirmation


3. What's the deal with keyword `enum` and the `--NoEnumeration` flag? What's their relationship?
* Relationship: None

```powershell
function Get-Numbers{
   [array]$eggs=1,2,3
   Write-Output $eggs --NoEnumeration
}
```