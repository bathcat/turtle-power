Import-Module $PSScriptRoot/Get-SpanishGreeting.psm1 -Force
Import-Module $PSScriptRoot/Get-HippieGreeting.psm1 -Force

Write-Host "`nIn hippie:"
Get-HippieGreeting

Write-Host "`nIn Spanish:"
Get-SpanishGreeting
