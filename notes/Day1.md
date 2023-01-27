# Day 1

## Game Plan
1. Housekeeping
2. Review
3. Expressions (continued)
4. Lab: FizzBuzz
5. Collections
  - Lab, lab
6. Functions
  - Lab

## Housekeeping
1. Schedule
  - 9 - 4 
  - Lunch at noon
  
2. Updated material

3. Parking lot items--
	* Update-help content

	* Powershell summoning
	  'global summon'
	  
	* Install git
	  https://git-scm.com/downloads
	
3. Pep talk
    * Kudos
	* Day 1 is the hardest



## Review


6. What's the deal with `$_` ?
* Variable
* Good in pipes
* Represents whatever the current item is


2. What does this thing do-- |  ?
* Called a Pipe
* Separates commands
* Takes output from one command turns in into input for the next one.

4. What are the rules for variable names?
* Prefix with `$`
* No initial number
* Only underscore, numbers, letters

7. How do you find the cmdlet you're looking for?
* Get-Command
* Get-Help

8. What's the difference between `.` and `..`?
* Current directory: .
* Parent directory: ..

3. What's an alias?
* Shortcut/abbreviation of a command
* e.g. Get-ChildItem
  - aliases: gci, dir, ls
* Make things shorter or friendlier

1. What's the deal with `$PROFILE` ?
* Variable for the user's profile script
* Profile is the script that runs for every powershell session

5. What makes PowerShell unique?
* Batteries included
* Does automation of boring repetitive stuff
* Develop *anything*
* Similar to
  - Python - (Object-based)
  - Cmd.exe - (that's Text based)
* Very orthogonal
  - Noun + verb
    + Get-ChildItem v ls
  - Very regular, patterns are easy to figure out


9. What does this do:
```powershell
Get-ChildItem -Recurse -Directory | 
	Where-Object {$_.GetFileSystemInfos().Length -eq 0} |
	Remove-Item -WhatIf
```
* Gets all directories in the tree
* Finds empty ones
* Deletes 'em

# Cmdlets
* `Get-Date`
* `Get-Random`
* `Read-Host` - Takes user input
* `Get-Member` - Tells you what you can do with an object

# Loops
* Consider just piping stuff
  - Select-Object
* If you want a loop:
  - foreach is good for walking through a collectino
  - While is good if you don't know how many times to do a thing.


# Array Recipes
* Range: `1..10`
* Commas: `1,2,3,4`
* Unary comma: `,1`
* Ampersand: `@()` `@(14)`  `@(1,2,3,4)` 


# Arrays Gotchas
* Appending can be slow if it's a lot of appends
* Automatic enumeration via pipline operator
  - Becomes an issue if you want to do something with a whole array

# About Enumeration
* Things get passed individually down the pipeline

---

# Afternoon Schedule
* Demo: Collection Golf
* Lab: Restful Fortune
* Slides: Functions
* Lab: File Fortune

---


# Array Review

* How to slice
```powershell
$xs = 1,2,3,4
$ys = $xs[0..1]
```

* Enumeration
```powershell
$xs = 1,2,3,4
Write-Host $xs # Not enumerated (called once)
$xs | Write-Host # Auto-enumerated (called once per item)
```

* Dictionary PROs and Cons
```powershell
$user = @{
  id = 4
  login = 'jbloggs'
  givenName = 'joe'
}
Write-Host "Hello, " + $user['givnName']
```
- Good part: 
* Use as a record

- Hard part:
* Easy to screw up


---

# McMullen TODOs
* Fix the param{} slide
* Get ampersand execution working

---

# Restful Fortune
0. Nominate driver
  - Switching is an option
1. Get something from an online service
  - cat facts  https://official-joke-api.appspot.com/random_joke
  - joke: https://official-joke-api.appspot.com/random_joke
2. Inside of a function called 'Get-Fortune'
3. Format response
4. Keep retrying until we get a decent result
  - `while` loop or `do while`
5. Alias 'fortune'
6. Add it to $PROFILE


---

# Morning Plan
* Review
* Finish Functions
  - Lab: File fortune
* Etc...


