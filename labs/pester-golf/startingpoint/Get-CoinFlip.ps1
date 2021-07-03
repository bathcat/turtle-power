enum CoinFace {
   Tails
   Heads
}

<#
.SYNOPSIS
   Flips a virtual coin, returning [CoinFace]::Heads
   or [CoinFace]::Tails with roughly equal frequency
#>
function Get-CoinFlip {
   [CmdletBinding()]
   [OutputType([CoinFace])]
   param()
   $faces = [CoinFace]::Heads, [CoinFace]::Tails
   return $faces | Get-Random
}
