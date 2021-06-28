
$greeting = 'Hola'

function Get-Greeting{
    [OutputType([string])]
    Param(
        [string]$Name = 'Amigo'
    )
    return "$greeting, $Name"
}

Export-ModuleMember Get-Greeting
