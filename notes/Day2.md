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
4. Alias - 'fortune'
5. Put it in $PROFILE - 

---

# Afternoon
* Objects
 - Weather lab (volunteer)
* Quality
 - Strict mode
 - Linting
 - Testing
 - Lab: Pester golf (Demo?)
* Modules and Scripts
* Course Survey

---

What's a class?
* Defines a thing
* Custom type
* Advantages:
  - Help from intellisense 
  - Validatatable
  - Guardrails

---

# Vocab
* Reference Equality


---

# Afternoon Gameplan
* Weather lab (30m)
* Nag: Survey (10m)
* Quality (10m)
* Modules (10m)
* Review (15-20m)


---

# Weather Requirements
1. Get physical location
  * class to represent physical location
    + latitude, longitude
  * cmdlet to get location from the service

2. Get grid location (based on physical location)
  * class to reprent grid location  
    + gridx, gridy, gridid
  * cmdlet to get grid location based on physical location

3. Get forecast
  * cmdlet that gets a forecast based on grid location
  * Optionally class to represent weather
  
  
--- 

# Takeaways
* Set-Strict is a good idea
* Use 'dot sourcing' to get at the contents of another script.

---

# Review
01. How do you define a variable?
```
$x = 'something'
New-Variable -Name Y -Value 25 -Option Constant
```

05. How do you set up your profile?
* Edit the contents of $PROFILE
* Tip: Put your profile in source control
* Put in stuff you want for every session
  - Get-Weather
  - fortune
  - Set up the prompt - starship. Add bling

07. What's the point of a class?
* A class is a group of related information
  - e.g. Latitude + Longitude = Point
  - e.g. givenName + surname = User
  - e.g. red + blue + green = Color
* Points: 
  - Grouping related stuff
  - Intellisense
  - Strong typing
  - Equals / ToString
  - Validation
    + ValidateRange
	

02. Create an array
```powershell
$a = 1,2,3,'chicken'
$b = 1..50
$c = @()
$d = @('burger')
$e = ,'fries'
$f = 'a'..'z'
```

16. What is pester?
* Unit testing framework
* Test programatically without breaking production configuration

08. What's the deal with pipes?
* Separates multiple commands on one line
* Pass results from 1 command to the next command
* Syntax
```powershell
Get-Date | Write-Host -ForegroundColor Green
```

12. What syntax for a dictionary?
```powershell
$color = @{
   red=128
   green=128
   blue=128
}
```

06. How do you create an alias?
```powershell
new-alias -Name getchildren -Value Get-ChildItem
```

15. What are 3 ways to return a value from a function?
```powershell
function Get-ThingA{
   return "Thing"
}
function Get-ThingB{
   write-output "Thing"
}
function Get-ThingC{
   "Thing"
}
```

04. How do you add color to output?
* `-foregroundColor Green`
* Cmdlet: `Write-Host`
* NOT `Write-Output`

09. What's the deal with types?
* Lots of 'em
  - [int]
  - [float]
  - [decimal]
  - [string]
  - [object]
  - [array]
* E.g.
```powershell
[int]$id = 12

$id = "duckworth" #Bork!

```

13. What's enumeration?
* Pipe calls a thing once for each item in a collection
* e.g.
```powershell
$xs = 1,2,3

#Gets Enumerated
$xs | Write-Host

#Not Enumerated
Write-Host $xs
```

03. Create a function
```powershell
function Get-ThingA($ThingID){
	return "Thing $ThingID"
}

function Get-ThingB{
	param(
	  [string]$ThingID = "UnknownThing"
	)
	return "Thing $ThingID"
}

function Get-Count{
	begin{$running_total = 0}
	process{$running_total += 1}
	end{return $running_total}
}

```

10. What's a cmdlet?
* e.g.
  - Get-Host
  - Get-Help
* Function
* Verb + Noun
* Thing you can run
* Lots of 'em. ~1600


14. What's interpolation?
* String thing
* Double-ticks
* Lets you put in stuff
  - variable
  - special characters
```powershell
$a = 'Everything'
$b = "I hate $a."
$c = "B says: `n$b`n"
```

11. How do you know what cmdlet to run?
* `Get-Help`
* `Get-Command`
* Google