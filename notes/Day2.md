# Day 2

## Game Plan
1. Housekeeping
2. Review
3. Objects (Continued)
  - Lab: Weather
4. Quality
  - strict mode
  - unit tests
5. Modules
6. Microsoft stuff
  - ad / exchange / calendars and stuff
7. Review
8. Next steps

---

## Housekeeping
1. Survey - https://www.surveymonkey.com/r/2L2SH97
2. Updated notes

---

## Review
0. Free square: Add another question

1. How to you create an alias?
* Cmdlets:
  - Set-Alias
  - New-Alias

2. What's the difference between `Write-Host` and `Write-Output`?
* Write-host writes to terminal. 
* Write-Output writes to the stream for the next cmdlet
  - Alot like `return`
  - `return` exits doesnt.

3. What's the syntax to create a dictionary?
```powershell
$my_empty_array = @()

$my_empty_dictionary = @{}

$my_user_stuff = @{
  id = 3920
  surname = 'jbloggs'
}

Write-Host "Your surname is $($my_user_stuff.surname)"

```

4. What's the deal with 'enumeration'?
```powershell
$xs = 1..10
Write-Host $xs
$xs | Write-Host
```

6. What's a 'script block'?
* Little script
* Often passed as a parameter
* Like a function, but no name
```powershell
$xs = 1..10
$odds = $xs | Where-Object {$_ % 2 -eq 1}
```

5. What's the deal with `Get-Member`?
* Cmdlet
* Gets the members of an object
  - Properties
  - Methods

8. How do you take user input in a script?
* Read-Host
* Or just user runs cmdlets and passes arguments

11. What's a 'class'?
* Global*
* Other objects can reference it
* Custom type
* A class is a recipe or a blueprint for objects

10. What's an 'advanced function'?
* Regular function with [CmdletBinding()]
* Does these things:
  - Behaves more like a cmdlet
  - Refuses extra arguments
  - Opt in to WhatIf and ShouldProcess

7. How do you get an 'interpolated' string?
* It's the number of ticks
* Double tick substitutes variables, expressions, etc.
* Write-Host "Answer is: $answer"
* Single tick is actual literal


9. What's the difference between`foreach` and `Foreach-Object`?
* foreach is a keyword works like python or whatever
* foreach-object is cmdlet, more idiomatic
```powershell
$xs = 1..10

$xs | ForEach-Object { Write-Host $_ -ForegroundColor Blue }

foreach ($x in $xs) {
   Write-Host $x -ForegroundColor green
}
```


---

# Thoughts on Objects

## Cool things
1. Guardrails
2. Metadata
3. Expression of intent

## Cautionary Thoughts
* In pwsh it's natural to do maniplation with cmdlets
* Don't get too crazy adding behavior to objects

## Final thoughts
* Represent nouns with objects
  - e.g. Color, User, Mailbox, 
  
* Manipulate nouns with cmdlets
  - Get-Mailbox
  - Initialize-Color


---

## Next Steps

### Priorities
1. Master interacting with stuff via terminal
2. Master scripting, cmdlets, etc.
3. Get your scripts into verison control
4. Master unit testing


---

### Next Steps
* https://github.com/vexx32/PSKoans
* Project
  - ProjectEuler
  - ?
* Lunch 'n' learn teach other people

---

# Review Questions
0. Free square: Add another question

5. What is `-WhatIf`
* Test a command
* State-change like new-item, remove-item, new-mailfolderpermission
* Doesn't actually do anything
* _Might_ give you some kind of message that's useful

1. What is string interpolation?
* Placeholder in a string with a variable in a string
* This gets expanded: "My profile is here: $PROFILE"
* This doesn't: 'My profile is here: $PROFILE'

4. Why are unit tests important?
* Improve the design of software
* Catch bugs
* Refactor with confidence
* Living documentation

2. What is enumeration? How is it different from an enum?
* Enumeration means 
```
write-host 1..10 # Not enumerated
1..10 | write-host #Yes enumerated
```
* Happens in
  - collections passed through pipeline
  - return from a function
* Opt out with 'Write-Output -noenumeration'
* Enum is a custom datatype
* Alias for integer type
```
enum EmploymentStatus{
  Stranger
  Applicant
  HiredButNotStarted
  Working
  WorkingButLeaving
  GoneButEligibleForRehire
  DeadToUs
}
```
13. How do you make a hashtable?
* @ + curlies
```
$empty = @{}
$user_info = @{
  id=123
  surname = 'bloggs'
  status = [EmploymentStatus]'Working'
}
```

9. What's the deal with strong typing?
* Lots of times, Pwsh just picks the type for you.
```
$name = 'jbloggs'
```
* With strong typing, you can insist on a type
```
[string]$name = 'jbloggs'
```
* Benefits
  - Guardrails
  - Clarity of intention
  


3. What is a script block?
* Collection of commands enclosed in curly brackets
* Useful for pipeline
```
get-process | ? {$_.WorkingSet -gt 50000} 
```
* Useful for passing code as a parameter

11. How do you create a new alias?
* Profile is a good spot for them.
* Scripts are not a good spot.
```
New-Alias -Target Get-ChildItem -Name gs
```

6. What is a 'member'?
* 'Get-Member'
* Retrieves properties and methods of an object
* A member is anything you can get at via the . operator
* e.g.
```
$n = 4
$n.ToString()
```


7. What are the 2 most important commands?
* Get-Help -Examples 
* Get-Command

8. What's a cmdlet? What's a command?
10. What's an advanced function?
* A command is anything you can run
  - An exe
  - A function
* A cmdlet is a special kind of function
* Decorated with [CmdletBinding] 
* Aka Advanced function

12. What are 3 kinds of loops?
* for($i =0; $i -lt 10; $i++){write-host $i}
* while($true){return;}
* foreach, do..while, foreach-object

16. What's an object?
* Everything-- numbers, lists, custom types
* You can create 'em 
   - class keyword
* Thing on the left of the dot.
```
$n = 4
$n.ToString()
```

15. What's the deal with 'destructuring'?
* A way of getting parts of an array out
```
$xs = 1..10
$first, $everything_else = $xs
```

14. What are 3 ways to make an array?
* $my_array = 1,2,3
* $my_array = @(1,2,3)
* $my_array = 1..10
* $my_array = ,1

19. What's the difference between 'write-host' and 'write-output' and return?

* Write-host prints something on the terminal
* Write-Output writes to the pipeline
* return writes to the pipeline and exits

20. What's up with this:
```powershell
Get-ChildItem > $null
Get-ChildItem | Out-Null
```
* Used for throwing away the result of something
* Usually you're invoking something for side effects and don't want the output

18. What's strict mode?
* Failsafe so you don't meet criteria
* Set-StrictMode -version 7.3
* E.g. 
  - No uninitialized variables
  - No out-of-bounds array access
  - No bogus object properties

17. What's `-like`?
* Operator for finding a similar string
* Enables wildcards

21. What's the deal with the powershell profile?
* Good for storing aliases
* Path stored in $PROFILE
* Script that runs for every new pwsh session

