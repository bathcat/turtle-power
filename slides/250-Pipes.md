# Pipes

---

### Goals
1. Lorem
1. Ipsum
1. Sic dolor

---

## Overview

---

### [Overview](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines)
* Lorem
* Ipsum
* Sic dolor

```powershell
Get-Process notepad | Stop-Process
```

---

### Multiline
```powershell
Get-Process notepad | 
  Stop-Process
```

---

### Filtering
```powershell
Get-Command | 
  Where-Object {$_.Name -like '*job*'}
```

---

### Sorting
```powershell
Get-Verb | 
  Sort-Object -Property Verb
```

---

### Transforming
```powershell
Get-Service | 
  Foreach-Object {$_.Name + " is " + $_.Status}
```

---

### Stacking
```powershell
Get-Process | 
  Where-Object {$_.ProcessName -ne 'explorer'} | 
  Sort-Object -Property WorkingSet -Descending | 
  Select-Object -First 5
```

---

## Stream Flavors

---

### Overview
1. Success
1. Error
1. Warning
1. Verbose
1. Debug
1. Information


---

### [Redirection](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_redirection)
* Lorem
* Ipsum

---

