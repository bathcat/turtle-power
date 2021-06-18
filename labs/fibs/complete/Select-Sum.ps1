Set-StrictMode -Version Latest

<#
.SYNOPSIS
  Gets the sum of a sequence of numbers
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
function Select-Sum {
    [OutputType([string])]
    Param(
        [Parameter(ValueFromPipeline = $true)]
        [int]$n
    )
    begin {
        $sum = 0
    }

    process {
        $sum += $n
    }

    end {
        return $sum
    }
}
