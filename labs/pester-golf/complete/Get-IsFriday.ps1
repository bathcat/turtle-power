
<#
.SYNOPSIS
   Returns a boolean indicating whether
   it's Friday right now at this location.
.OUTPUTS
   $true means it's Friday, otherwise $false.
#>
function Get-IsFriday {
   [CmdletBinding()]
   [OutputType([bool])]
   param()
   return (Get-Date).DayOfWeek -eq 'Friday'
}
