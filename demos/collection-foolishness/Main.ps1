function Get-ArrayEqualityBroken {
   [CmdletBinding()]
   [OutputType([bool])]
   param(
      [Parameter(Mandatory)]
      [array]$Left,
      [Parameter(Mandatory)]
      [array]$Right
   )
   # Array equality behavior is kind of weird. From a [discussion on StackOverflow](https://stackoverflow.com/questions/9598173/comparing-array-variables-in-powershell): 

   # > When the -eq operator is used between two array variables ... powerShell will, in fact, enumerate only the array
   # > on the left side and compare each item to the array on the right side as a whole. The result will be an array of
   # > matching items or nothing at all when there are no matches.

   return [bool]($Left -eq $Right)
}

function Get-ArrayReferenceEquality {
   [CmdletBinding()]
   [OutputType([bool])]
   param(
      [Parameter(Mandatory)]
      [array]$Left,
      [Parameter(Mandatory)]
      [array]$Right
   )

   return [System.Object]::ReferenceEquals($Left, $Right)
}

$as = 1, 2, 3
$bs = 1, 2, 3

$result = Get-ArrayReferenceEquality $as $bs

Write-Host "Result is: $result"

