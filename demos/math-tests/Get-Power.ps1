Set-StrictMode -Version Latest


function Get-Power {
   [OutputType([int])]
   Param(
      [int]$Base,
      [int]$Exponent
   )
   return [System.Math]::Pow($base, $Exponent)
}
