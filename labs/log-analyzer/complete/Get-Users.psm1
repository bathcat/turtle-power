Set-StrictMode -Version Latest

class User {
   [int]$id
   [string]$login
}

<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER Path
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Get-Users {
   [OutputType([User[]])]
   Param(
      [Parameter(Mandatory)]
      [ValidateScript( { Test-Path $_ } )]
      [string]$Path
   )
   return Get-Content $Path |
      ConvertFrom-Json |
      % { [User]$_ }

}

Export-ModuleMember Get-Users
