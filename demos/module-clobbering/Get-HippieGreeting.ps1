$greeting = 'Peace'
function Get-HippieGreeting{
    [OutputType([string])]
    Param(
        [string]$Name = 'man'
    )
    return "$greeting, $Name"
}
