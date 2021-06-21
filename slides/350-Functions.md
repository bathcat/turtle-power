# Functions

---

### Goals
1. Lorem
1. Ipsum
1. Sic dolor

---

## Syntax

---

### [Overview](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions)
* Lorem
* Ipsum

Note:
* https://adamtheautomator.com/powershell-functions/

---

### Parameters
* Lorem
* Ipsum
* Sic dolor

Note:
* https://adamtheautomator.com/powershell-parameter/

---

### Return Values
* Explicit via
  - Keyword [`return`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_return)
  - Cmdlet [`Write-Output`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output)
* Implicit via... anything else

---

### Example
#### What's the output?
```powershell
function Select-Sum($A, $B){
  $result = $A + $B
  "Result is: $result"
  return $result
}
$sum = Select-Sum 11 5
$sum.GetType()
```

---

### Refactored
```powershell
function Select-Sum($A, $B){
  $result = $A + $B
  Write-Debug "Result is: $result"
  return $result
}
$sum = Select-Sum 11 5
$sum.GetType()
```

---

## Adding Types

---

### Motivation
```powershell
function Select-Sum($A,$B){
  $result = $A + $B
  Write-Debug "Result is: $result"
  return $result
}
$sum = Select-Sum 11 ,'chicken', 44
```

---

### Refactored
```powershell
function Select-Sum{
  [OutputType(int)]
  Param(
    [int]$A,
    [int]$B
  )
  $result = $A + $B
  Write-Debug "Result is: $result"
  return $result
}
```

---

### About [`OutputType`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_outputtypeattribute)
* Metadata only
* Not enforced
* **BUT** still a good idea

---

### Example
```powershell
function Get-Pi{
  [OutputType([float])]
  Param()
  return "Apple"
}
"Expected type: "
(Get-Command Get-Pi).OutputType.Name

"`nActual type: "
(Get-Pi).GetType().Name
```

Note:
* There's a script analyzer rule that's supposed to check: PSUseOutputTypeCorrectly

---

## 'Advanced' Functions

---

### Validation
* Lorem
* Ipsum

Note:
* https://adamtheautomator.com/powershell-validateset/
* https://adamtheautomator.com/powershell-validatescript/


