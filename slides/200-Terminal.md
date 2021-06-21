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

### The Magic of [`Get-Command`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-command)
* Lorem 
* Ipsum
```powershell
Get-Command
Get-Command -Noun 'Process'
Get-Command -Verb 'Start'
```

---

### Tab-Completion
* Type `Get-Com` + tab 
* Double-tab to see options
* Works for parameters too

Note:
* Get all shortcuts with this:
```powershell
Get-PSReadLineKeyHandler | more
```

---

### History
* Up arrow

---

### [about_Parameters](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parameters)
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

### The Magic of [`Get-Help'](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-help)
#### Commands
```powershell
Get-Help Get-ChildItem
```

#### Wildcards
```powershell
Get-Help Remove-*
Get-Help about*
```

#### Useful parameters
```powershell
Get-Help Get-Random -Detailed 
Get-Help Get-Date -Full
Get-Help Invoke-RestMethod -Online
```

Note:
* https://adamtheautomator.com/powershell-get-help/

---

### Flag: Whatif
* Lorem
* Ipsum
* Sic dolor

---

### [Common Parameters](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters)
* Lorem
* Ipsum

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

Notes:
* https://4sysops.com/archives/displaying-text-one-page-at-a-time-in-powershell-more-less-head-tail/
