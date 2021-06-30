
<#
.SYNOPSIS
   Logs a suspicious file
.DESCRIPTION
   Loooooooogs a suspicious file
.EXAMPLE
   Lorem ipsum sic dolor
#>
function Write-SuspicionLog{
   [CmdletBinding()]
   [OutputType([void])]
   param(
      [Parameter(Mandatory)]
      [ValidateScript({Test-Path $_})]
      [string]$Path,

      [Parameter(Mandatory)]
      [ValidateLength(5, 100)]
      [string]$Message, 

      [Parameter(Mandatory)]
      [ValidateRange(1,10)]
      [int]$Severity,
      
      [Parameter(Mandatory)]
      [ValidateSet("Bad Smell", "Funny Look")]
      $Category
   )

   Write-Host "Suspicious File! | $Message | $Category | $Severity | $Path"
}

Write-SuspicionLog -Path C:\Users `
   -Message 'Lorem ipsum sic dolor'`
   -Severity 2 `
   -Category 'Bad Smell'

