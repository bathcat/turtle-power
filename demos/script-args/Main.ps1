#./Get-Self.ps1 'xyz'

function Start-Enfarculation{
    Write-Host 'Commencing Enfarculation Procedure'
    . ./Get-Greeting.ps1 | Out-Null
    Get-Greeting
    Write-Host 'Initialization Complete...'
}

Start-Enfarculation

