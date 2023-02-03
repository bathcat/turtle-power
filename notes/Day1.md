# Day 1

## Game Plan
1. Housekeeping
2. Review
3. Collections
  - Trickiest Enumeration
  - Lab, lab
6. Functions
  - Lab
7. Objects

## Housekeeping
1. Schedule
  - 11 - 6
  - Lunch at 130
2. ~Updated material~
3. Parking lot items
4. Pep talk
    * Kudos
	* Day 1 is the hardest

## Review
0. Bonus square-- Make up a question.

1. What's the deal with `$PROFILE` ?
* Variable
* Path to profile script
* Which is the thing that every time you fire up a new powershell session

2. What does this thing do-- |  ?
* Hooks up multiple commands in one line
* Called a 'pipe'
* Takes output from first command, calls second command with that input

3. What's an alias?
* One example: % for foreach-object
* Alternative name for some command
* Important cmdlets:
  - `new-alias`


4. What are the rules for variable names?
* Has to have a dollar sign
* Contains letters, numbers, underscore
* NO spaces and special characters

7. How do you find the cmdlet you're looking for?
* Use tab completion
* Ctrl + space
* Cmdlets
  - `get-command`
  - `get-help`

6. What's the deal with `$_` ?
* Good for doing pipes
* Represents the current thing in the pipeline

5. What makes PowerShell unique?
* Automate lots of stuff
* Open, close(start, stop) exes. 
* Batteries included
* Noun-verb
* Power of the .NET framework.

8. What's the difference between `.` and `..`?
* Dot is the current directory
* Dot dot is the parent directory.

9. What does this do:
```powershell
Get-ChildItem -Recurse -Directory | 
	Where-Object {$_.GetFileSystemInfos().Length -eq 0} |
	Remove-Item -WhatIf
```
* Removes empty directories


---

# Important Cmdlets
* Get-Member


---

# Array Recipes
* Creation
  - Comma operator `1,2,3`
  - Unary comma `,`
  - Array operator `@(1,2,3)`
  - Range operator `1..15`
* Mutation
  - Combine with +
  - 'Append' with +=
  - Set value with '[]'
* Slicing 
  `$xs[1..10]`
* Destructuring
  `$head, $tail = $xs`

---

# Enumeration
```
$numbers = 1..5
write-host "This is enumerated:"
$numbers | write-host

write-host "This is NOT enumerated:"
write-host $numbers

```