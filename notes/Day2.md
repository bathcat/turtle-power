# Day 2

## Game Plan
1. Housekeeping
2. Review
3. Functions (Continued)
  - Lab: File fortune
4. Objects
  - Lab: Weather
5. Quality
  - strict mode
  - unit tests
6. Modules
7. Windows stuff
  - ad / exchange / calendars and stuff

## Housekeeping
1. Survey - https://www.surveymonkey.com/r/2LCZLDF




## Review

---
3. How to you create an alias?
* `New-Alias`
* Shorthand / friendlier name for a cmdlet, function, etc.

7. What's the difference between `Write-Host` and `Write-Output`?
* `Write-Output` has more things e.g. -NoEnumerate
  + More like `return` 
  + Write something out to the stream
  + Returns something to the caller / output stream
* `Write-Host` just puts something onto the terminal
  + Color things
  + Doesn't give anything back to the caller of the function

5. Why does Powershell use `-eq` and `-lt` instead of `==` and `<` like a normal thing?
* Good for comparing stuff for equations, filtering, etc.
* Symbol `>` was already taken
* e.g. 
```powershell
'' > some_file_name.txt
```

9. What's the syntax to create a dictionary?
* Sign: `@` with curly braces
* e.g.
```powershell
$user = @{
  id = 393827
  givenName = 'joe'
  surname = 'bloggs'
}
Write-Host $user['surname']
```

4. What's the deal with 'enumeration'?
* Happens in pipes
* Instead of passing the whole thing, each item in a collection gets sent down the pipe individually
```powershell
$xs = 'chicken', 'rice', 'olives', 'ice cream'
Write-Host $xs -ForegroundColor Green

$xs | Write-Host -ForegroundColor Blue
```

8. What's the deal with `Get-Member`?
* Gets the properties and methods of objects.
* For any *thing* get-member tells you what you can do with it.
* e.g.
```powershell
get-childitem | get-member
```

10. What's a 'script block'?
* Like a function:
  - Has 1 or more statements
  - Gets run
* Unlike a function 
  - Has no name
  - Often throwaway
* e.g.
```powershell
Get-Process | ForEach-Object {$_.WorkingSet}
```

1. How do you get an 'interpolated' string?
* Double-ticks
* Allows you to include variables, expressions, special characters.
* e.g.
```powershell
$name = 'jbloggs'
Write-Host "`n`tHello, $name`n"



```

6. How do you take user input in a script?
* `Read-Host`
* e.g.
```powershell
Write-Host "How old are you?"
$response = Read-Host
```


2. What's the difference between`foreach` and `Foreach-Object`?
* `foreach` is a loop like `while` and `do..while`
* `Foreach-Object` is a cmdlet that executes a script block for everything that comes down the pipeline.

---


# Samples

```powershell
function Get-BirthdayMessage {
   [OutputType([string])]
   [CmdletBinding()]
   param(
      [ValidateScript( { 
         ($_ -gt ((Get-Date).Year - 120)) -and
         ($_ -lt ((Get-Date).Year))
         } )]
      [int]$YearOfBirth
   )
   $age = (Get-Date).Year - $YearOfBirth
   return "`n🎂 Happy birthay. You are $age years old.`n"
}

Get-BirthdayMessage 2022
```


---

#Review

* Explain the advantages of strong typing
  - Fail early
  - Insist on proper data type
  - Document how a function is supposed to be used.

* Define an 'advanced' function
  - Has `CmdletBinding`
  - More stricter - No extra params, no made up params
  - (Worry about this later) Opt in to `-whatif`

* List 2 flavors of function
  - Advanced v non
  - vanilla v begin/process/end


--- 

# File Fortune Requirements

1. Text file with data
2. Function `Get-Fortune`
  - 'Advanced' function
  - Explicit output
3. Behavior: 
  - Reads file
  - Random line
  - Output bling 
4. Alias
5. Put it in $PROFILE

