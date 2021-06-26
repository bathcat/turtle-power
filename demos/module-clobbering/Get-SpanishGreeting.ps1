
$greeting = 'Hola'

function Get-SpanishGreeting{
    [OutputType([string])]
    Param(
        [string]$Name = 'Amigo'
    )
    return "$greeting, $Name"
}
