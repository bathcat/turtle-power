Set-StrictMode -Version Latest


function Get-Quotient {
   [OutputType([float])]
   Param(
      [int]$Numerator,
      [int]$Denominator
   )
   return $Numerator / $Denominator
}
