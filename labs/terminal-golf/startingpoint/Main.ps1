Write-Host "`nHere are the goals:`n" -ForegroundColor Green
Write-Host "================================================="

Get-Content "$(Split-Path $PSScriptRoot)/README.MD"

Write-Host "================================================="
Write-Host "`n(You don't really need a script for this one.)`n" -ForegroundColor DarkGreen
