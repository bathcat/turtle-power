New-Variable `
    -Name words `
    -Value 'chicken', 'galavant', 'desk', 'Timothy', 'seven' `
    -Option Private, Constant

function Get-PassPhrase {
    [OutputType([string])]

    param(
        [int]$minWords,
        [int]$maxWords,
        [int]$seed = 1
    )

    $count = Get-Random -Minimum $minWords -Maximum $maxWords -SetSeed $seed
    return $words | Get-Random -Count $count -SetSeed $seed
}
