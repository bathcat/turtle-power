# To clobber your old profile, run this from a terminal:
#     Get-Content Microsoft.PowerShell_profile.ps1 > $PROFILE
Set-StrictMode -Version Latest
Set-Item -Path Env:DOTNET_CLI_TELEMETRY_OPTOUT -Value 1 -Force
Set-PoshPrompt -Theme ys

#---

function New-Blankfile {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string]$path
    )
    if ($PSCmdlet.ShouldProcess($file.Name)) {
        Out-File -InputObject '' -FilePath $path -WhatIf:$WhatIfPreference
    }

}

New-Alias -Name 'touch' -Value New-Blankfile

#---

function Get-CommandPath {
    param(
        [Parameter(Mandatory = $true)]
        [string]$command
    )

    return (Get-Command $command).Path
}

New-Alias -Name 'which' -Value Get-CommandPath

#---

function Get-DriveSpace {
    param()

    return Get-CimInstance Win32_LogicalDisk |
        Format-Table -Property DeviceID, VolumeName, Size, FreeSpace, @{Label = 'Use%'; Expression = { (1 - $_.FreeSpace / $_.Size).ToString("P") } }
}

New-Alias -Name 'df' -Value Get-DriveSpace

#---



