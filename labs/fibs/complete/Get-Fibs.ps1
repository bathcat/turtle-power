﻿Set-StrictMode -Version Latest

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
