# Terminal

---

### Goals
1. Lorem
1. Ipsum
1. Sic dolor

---

## Lorem

---

### Ipsum
* Lorem
* Ipsum
* Sic dolor

---

## Misc


---


### Verb-Noun
* Verbs are on the approved list
  - It's customizable
* Nouns are whatever
  - But consistent across related operations

---

### Tab-Completion
* Type `Get-` + tab
* Works for parameters too

---

### History
* Up arrow

---

### Parameters
* Passed by name
```
Get-Command 'Get-Help'
```
* Name
```
Get-Command -Name 'Get-Help' 
```
* Mix
```
Get-Command 'Get-Help' -OnLine
```
---

### Flags
* Presence opts you in
```
Get-Help Get-ChildItem -Examples
```

---

### Flag: Whatif
* Lorem
* Ipsum
* Sic dolor

---

### Aliases
* Alternative version of command to
  - Save keystrokes (alegedly)
  - Be familiar
* Examples
Get-ChildItem gci dir ls
Set-Location cd chdir
Write-Output echo
mkdir
 rmdir

---

### Against Aliases
* Problems
  - Consistency
  - Readability
  - Syntax-completion minimizes typing anyway
* Consider
  - Removing them altogether
  - Picking a consistent set

### Script: Unalias


