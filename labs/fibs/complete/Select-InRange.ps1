Set-StrictMode -Version Latest

<#
.SYNOPSIS
  Filters nubers with a specified range.
#>
filter Select-InRange([int]$limit = 4000000) {
  if ($_ -le $limit) {
    return $_
  }
}
