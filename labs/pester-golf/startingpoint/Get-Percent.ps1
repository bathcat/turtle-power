<#
.SYNOPSIS
   Gets the percent value of a ratio
.EXAMPLE
   PS C:\> $percentPass = Get-Percent 5 25
   $percentPass is 20
.INPUTS
   Inputs $Target is the numerator
          $Total is the denominator
.OUTPUTS
   Ratio expressed as a percent
#>
function Get-Percent {
   [CmdletBinding()]
   [OutputType([Float])]
   param(
      [Parameter(Mandatory)]
      [int]$Target,
      [Parameter(Mandatory)]
      [int]$Total
   )
   return $Target / $Total * 100
}
