
<#
.SYNOPSIS
   Builds a new list using only
   unique members of the original
.INPUTS
   Items (list): List, possibly containing duplicate values
.OUTPUTS
   list: Subset, in the same order, with no duplicates.
#>
function Select-Unique($Items) {
   Write-Output $Self
}



<#
.SYNOPSIS
   Builds a new list with its
   contents identical to the specified
   value.
.INPUTS
   items (list): Some list
.OUTPUTS
  list: New list with identical contents
#>
function Get-Clone($Items) {
   Write-Output $Self -NoEnumerate
}



<#
.SYNOPSIS
   Divides the specified list into partitions
.INPUTS
   Arbitrary list
.OUTPUTS
  list: List of partitions (which are lists)
#>
function Select-Partitoned($Items, $PartitionSize = 2) {
   Write-Output $Self
}


<#
.SYNOPSIS
   Creates a new, single-dimensional
   containing all the non-list members
   of the specified list.
.INPUTS
   List, possibly either
      multi-dimensional or containing
      nested lists.
.OUTPUTS
    1 list, same contents, same order,
      no nesting
#>
function Select-Flattened($Items) {
   Write-Output $Self
}
