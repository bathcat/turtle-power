class Color{
   [ValidateRange(0, 255)]
   [int]$red

   [ValidateRange(0, 255)]
   [int]$green

   [ValidateRange(0, 255)]
   [int]$blue

   [string]ToString(){
      return "$($this.red), $($this.red), $($this.blue)"
   }
}

<#
.SYNOPSIS
   Makes a new color object
.EXAMPLE
   $grey = Build-Color 128 128 128
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Color instance
#>
function Build-Color {
   [CmdletBinding()]
   [OutputType([Color])]
   Param (
      [Parameter()]
      [ValidateRange(0, 255)]
      [int]$Red = 0,

      [Parameter()]
      [ValidateRange(0, 255)]
      [int]$Green = 0,

      [Parameter()]
      [ValidateRange(0, 255)]
      [int]$Blue = 0
   )
   return [Color]@{
      red = $Red
      green = $Green
      blue = $blue
   }
}
