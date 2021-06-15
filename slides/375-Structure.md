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
$xs = 1,2,3
$ys = 'danish','strudle',3.14
$zs = @(1)
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

#### Fail
```powershell
$admin = [User]@{
  id=0
  name='administrator'
  handle='jerry'
}
```



