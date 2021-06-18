
function Get-Square {
    [OutputType([int])]
    Param(
        [Parameter(ValueFromPipeline = $true)]
        [int]$x
    )
    return $x * $x

}