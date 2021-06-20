# Objects

---

### Goals
1. Lorem
1. Ipsum
1. Sic dolor

---

## Adding Class

---

### [Overview](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes)
* Lorem
* Ipsum

Note:
* https://adamtheautomator.com/powershell-classes/
* https://github.com/Stephanevg/PSClassUtils

---

### Example
```powershell
class User{
    [int]$id
    [string]$name
}
$admin = [User]::new()
$admin.id=0
$admin.name='administrator'
```

---

### Casting
#### Works
```powershell
$admin = [User]@{
  id=0
  name='administrator'
}
```

---

#### Fail
```powershell
$admin = [User]@{
  id=0
  name='administrator'
  handle='jerry'
}
```
---

## Enumerations

---

### [Overview](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_enum)
* Newish
* Supports flags

---

### Motivation
```powershell
function Invoke-Cleanup{
  Param(
    [bool]$BeThorough=$false
  )
  Write-Output 'Cleaning up....'
}
```
---

### Refactored
```powershell
enum CleanLevel{
   Lazy
   Normal
   Compulsive
}

function Invoke-Cleanup {
   Param(
      [CleanLevel]$Thoroughness = 'Normal'
   )
   Write-Output "Cleaning up $Thoroughness-style...."
}
```

---

### [Flags](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_enum?view=powershell-7.1#flags-usage-example)
* Lorem
* Ipsum
* Sic

--- 

### Motivation
```powershell
function New-Burger{
  Param(
    [bool]$HasPickles=$false,
    [bool]$HasOnions=$false,
    [bool]$HasMustard=$false
  )
  # ...
}
```

---

### Refactored
```powershell
[Flags()] enum Fixins {
  None = 0
  Pickles = 1
  Onions = 2
  Mustard = 4
}

function New-Burger{
  Param(
    [Fixins]$Fixins='None'
  )
  return "New burger with $Fixins"
}

New-Burger 'Pickles','Onions'
```

