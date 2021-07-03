enum CoinFace {
   Tails
   Heads
}

<#
.SYNOPSIS
   Flips a virtual coin, returning [CoinFace]::Heads
   or [CoinFace]::Tails with roughly equal frequency
.DESCRIPTION
   Long description
.EXAMPLE
   PS C:\> <example usage>
   Explanation of what the example does
.INPUTS
   Inputs (if any)
.OUTPUTS
   Output (if any)
.NOTES
   General notes
#>
function Get-CoinFlip {
   [CmdletBinding()]
   [OutputType([CoinFace])]
   param(
      [Parameter()]
      [ValidateRange(0, 1)]
      [float]$Seed = (Get-Random -Minimum 0.0 -Maximum 1.0)
   )
   return $Seed -gt .5 ? [CoinFace]::Heads : [CoinFace]::Tails
}
