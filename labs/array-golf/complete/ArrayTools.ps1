
<#
.SYNOPSIS
   Builds a new list using only
   unique members of the original
.INPUTS
   Items (list): List, possibly containing duplicate values
.OUTPUTS
   list: Subset, in the same order, with no duplicates.
#>
function Select-UniqueElements($Items) {
   return $Items | Select-Object -Unique
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
   return $Items
}



<#
.SYNOPSIS
   Divides the specified list into partitions
.INPUTS
   Arbitrary list
.OUTPUTS
  list: List of partitions (which are lists)
#>
function Select-Partitons {
   param(
      $Items,
      $PartitionSize = 2
  )
  [array]$Rest = $Items
  while($Rest.Length -gt $PartitionSize){
      $Partition = $Rest[0..($PartitionSize-1)]
      $Rest = $Rest[ $PartitionSize..($Rest.Length-1)]
      Write-Output $Partition -NoEnumerate
  }
  Write-Output $Rest -NoEnumerate
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
   return $Items
}
