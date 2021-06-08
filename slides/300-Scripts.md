# Functions

---

### Goals
1. Lorem
1. Ipsum
1. Sic dolor

---

## Pwsh Batches 

---

### Ipsum
* Lorem
* Ipsum
* Sic dolor

---

## Variables

---

### Overview
* Prefixed with `$`
* Ipsum
* Sic dolor

---

### [`New-Variable`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/new-variable)
```powershell
New-Variable -Name PI -Value 3.14 -Option Constant
Write-Host $PI
```

---

## Strings

---

### [Flavors](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules)
* Literal
* Interpolated
* 'Here'

---

### Literal
```powershell
$animal = 'bunnies'
Write-Host 'I love $animal.'
```

---

### Interpolated
```powershell
$animal = 'bunnies'
Write-Host "I love $animal."
```

---

### Here
* Lorem
* Ipsum

---

### [Special Characters](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_special_characters)
* Use the [*grave accent* `](https://en.wikipedia.org/wiki/Grave_accent)
* Newline
```powershell
Write-Host "Processing...`n`nDone!"
```
* Tabs
```powershell
Write-Host "Here are things:"
Write-Host "`tNinja"
Write-Host "`tGoat"
Write-Host "`tNeedle"
```