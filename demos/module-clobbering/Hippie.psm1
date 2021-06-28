$greeting = 'Peace'
function Get-Greeting{
    [OutputType([string])]
    Param(
        [string]$Name = 'man'
    )
    return "$greeting, $Name"
}

Export-ModuleMember Get-Greeting
