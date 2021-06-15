Set-StrictMode -Version Latest

<#
.SYNOPSIS
  Gets terms of the fibonacci sequence
.EXAMPLE
  PS C:\> Get-Fibs 50
  Gets the first 50 terms
#>
function Get-Fibs($count) {   
  $previous = 1
  $current = 2

  for ($i = 0; $i -lt $count; $i += 1) {
    Write-Output $previous
    $next = $current + $previous
    $previous = $current
    $current = $next
  }
}

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
function Get-Sum {
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

filter Select-Evens {
  if ($_ % 2 -eq 0) {
    return $_
  }
}


filter Select-InRange([int]$limit = 4000000) {
  if ($_ -le $limit) {
    return $_
  }
}
