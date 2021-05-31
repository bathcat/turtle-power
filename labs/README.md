# Running the Labs

I've been running these with Powershell 7.13. Most of the scripts should run well with previous versions, but getting
the unit tests to run took some work. 

To get my setup:

1. Install Powershell >7 via [Github](https://github.com/PowerShell/PowerShell)

2. Uninstall the old version of Pester that came with the old powershell, and install the latest via 
Powershell Gallery. Described [here](https://pester.dev/docs/introduction/installation). Here's the script:
```
$module = "C:\Program Files\WindowsPowerShell\Modules\Pester"
takeown /F $module /A /R
icacls $module /reset
icacls $module /grant "*S-1-5-32-544:F" /inheritance:d /T
Remove-Item -Path $module -Recurse -Force -Confirm:$false

Install-Module -Name Pester -Force

```

3. (Optional) Install [Windows Terminal >=1.9](https://devblogs.microsoft.com/commandline/windows-terminal-preview-1-9-release/)
  a. You can even hook up a Quake-style terminal as described [here](https://docs.microsoft.com/en-us/windows/terminal/customize-settings/actions#global-commands) 

