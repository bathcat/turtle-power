


if(-not (Get-Package 'oh-my-posh' -ErrorAction SilentlyContinue)){
    Write-Host 'Installing oh-my-posh....'
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
    Install-Module oh-my-posh -Scope CurrentUser -Force
}

Set-PoshPrompt -Theme pure

# Opt out of telemetry
$Env:POWERSHELL_TELEMETRY_OPTOUT = $true
