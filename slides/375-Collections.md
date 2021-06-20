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

## Hash Tables

---

### [Overview](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_hash_tables)
* Associates keys with values
* Rules
  1. Keys should be immutable
  1. Values are anything
* Also known as
  - Map
  - Dictionary
  - Associative array

---

### Examples
```powershell
$words = @{
  fancy = 'plethora', 'eschew'
  plain = 'big', 'lots', 'some'
}
$user = @{id=12;name='jbloggs'}
```


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

