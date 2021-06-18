<#
.SYNOPSIS
  Gets the FizzBuzz message associated with a number.
.INPUTS
  Any integer.
.OUTPUTS
  The string message for the number.
#>
function Get-Message($i) {
    return [string]$i;
}

Get-Message 1
Get-Message 2
Get-Message 3
Get-Message 4
Get-Message 5
