Set-StrictMode -Version Latest

<#
.SYNOPSIS
  Filter that allows even numbers through.
.INPUTS
  Sequence of integers
#>
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
