
class Color{
   [ValidateRange(0, 255)]
   [int]$red

   [ValidateRange(0, 255)]
   [int]$green

   [ValidateRange(0, 255)]
   [int]$blue

   [void]Darken([int] $amount){
      $this.green += $amount
      $this.red += $amount
      $this.blue += $amount
   }

   [string]ToString(){
      return "$($this.red), $($this.green), $($this.blue)"
   }

}

Write-Host "`n`nWheeeee!`n`n" -BackgroundColor Green

<#
.SYNOPSIS
   Short description
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
function Add-Darkness{
   [CmdletBinding()]
   [OutputType([Color])]
   param(
      [Color] $original,
      [int] $amount
   )
   return [Color] @{
      red = $original.red + $amount
      green = $original.green + $amount
      blue = $original.blue + $amount
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

