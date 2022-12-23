
<#
.SYNOPSIS
   Builds a hash table with the number of occurrences
   of each item in the input
.INPUTS
   Items (list): List, possibly containing duplicate values
.OUTPUTS
   Table: e.g. @{planet=12;moon=33}
#>
function Select-Counted($Items) {
   $counts = @{}

   foreach ($item in $Items) {
      if (!$counts.Contains($item)) {
         $counts[$item] = 0
      }
      $counts[$item]++
   }

   return $counts
}
