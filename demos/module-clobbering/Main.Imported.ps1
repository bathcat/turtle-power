Import-Module $PSScriptRoot/Spanish.psm1 -Force -Prefix Spanish
Import-Module $PSScriptRoot/Hippie.psm1 -Force -Prefix Hippie

Write-Host "`nIn hippie:"
Get-HippieGreeting

Write-Host "`nIn Spanish:"
Get-SpanishGreeting
