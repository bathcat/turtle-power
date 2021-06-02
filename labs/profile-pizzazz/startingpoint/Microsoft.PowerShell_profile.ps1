# To clobber your old profile, run this from a terminal:
#     Get-Content Microsoft.PowerShell_profile.ps1 > $PROFILE

Set-Item -Path Env:DOTNET_CLI_TELEMETRY_OPTOUT -Value 1 -Force
Set-PoshPrompt -Theme ys
