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
  - Though it's customizable
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
* Passed by position
```powershell
Get-Command 'Get-Help'
```
* Passed by name
```powershell
Get-Command -Name 'Get-Help' 
```
* Mix
```powershell
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

| Pwsh            | Shorthand | Cmd.exe | Bash         |
|-----------------|-----------|---------|--------------|
| `Get-ChildItem` | `gci`     | `dir`   | `ls`         |
| `Set-Location`  | `sl`      | `chdir` | `cd`         |
| `Write-Output`  | `write`   | `echo`  | `echo`       |
| `New-Item`      | `ni`      | `md`    | `mkdir`      |        
| `Remove-Item`   | `ri`      | `del`   | `rm`,`rmdir` |

---

### Against Aliases
* Problems
  - Consistency
  - Readability
  - Semantic differences
    * e.g. *Nix `rm` and Pwsh `rm -> Remove-Item`
  - Syntax-completion minimizes typing anyway
* Consider
  - Removing them altogether
  - Picking a consistent set

---

### Script: Unalias
```powershell
Get-Alias | 
  ?{$_.Name -notin '%','?'} | 
  Remove-Alias -Force
```

---

### Combining
* Statements run sequentially
```powershell
Write-Output "Hello"; Write-Output "World"
```

* Conditional on **success**
```powershell
Set-ExecutionPolicy RemoteSigned && Write-Output "Success!"
```

* Conditional on **failure**
```powershell
Write-Output $xyz || Write-Output 'Variable "$xyz" not found'
```

---

### More
* Gets stuff one page at a time
* Mostly the same on:
  - Windows: [`more.com`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/more)
  - *Nix: [`/usr/bin/more`](https://en.wikipedia.org/wiki/More_(command))
* Example:
```powershell
# Classic
Get-Command | more

# Alternative
Get-Command | Out-Host -Paging
```
