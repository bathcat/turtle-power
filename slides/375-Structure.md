# Structure

---

### Goals
1. Lorem
1. Ipsum
1. Sic dolor

---

## Collections

---

### Overview
* Arrays are
  - Built-in
  - Immutable
  - Heterogeneous
* Alternatives:
  - [ArrayList](https://docs.microsoft.com/en-us/dotnet/api/system.collections.arraylist)

---

### Syntax
```powershell
$ws = 1,2,3
$xs = 'danish','strudle',3.14
$ys = @(1)
$zs = ,'chicken'
```

---

### Gotcha: Automatic Enumeration
```powershell
function Get-Self{
  Param(
    [array]$Self = @()
  )
  return $Self
}
(Get-Self @('x','y','z')).GetType()
(Get-Self @('x')).GetType()

```

--- 

### Fixed
```powershell
function Get-Self{
  Param(
    [array]$Self = @()
  )
  Write-Output $Self -NoEnumerate
}
(Get-Self @('x','y','z')).GetType()
(Get-Self @('x')).GetType()
```

---

## Dictionaries

---

### Overview
* Aka
  - Map
  - Associative array
* Ipsum
* Sic dolor

---

### Syntax
```powershell
$employees = @{
    11='park'
    12='jones'
    13='medina'
}
```

```powershell
$info=@{name='bloggs';id=8281}
$info.department = 'sales'
```

---

