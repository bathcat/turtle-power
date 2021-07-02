
<#
.SYNOPSIS
   Logs a suspicious file
.DESCRIPTION
   Loooooooogs a suspicious file
.EXAMPLE
   Lorem ipsum sic dolor
.EXAMPLE
   xyz
#>
function Write-SuspicionLog {
   [CmdletBinding()]
   [OutputType([void])]
   param(
      [Parameter(Mandatory)]
      [ValidateScript( { Test-Path $_ })]
      [string]$Path,

      [Parameter(Mandatory)]
      [ValidateLength(5, 100)]
      [string]$Message,

      [Parameter(Mandatory)]
      [ValidateRange(1, 10)]
      [int]$Severity,

      [Parameter(Mandatory)]
      [ValidateSet("Bad Smell", "Funny Look")]
      $Category
   )

   $delimiter = ' | '
   
   Write-Host "Suspicious File!" -BackgroundColor DarkGray -NoNewline -ForegroundColor DarkRed
   Write-Host $delimiter -NoNewline

   Write-Host $Message -NoNewline
   Write-Host $delimiter -NoNewline
   
   Write-Host $Category -NoNewline -ForegroundColor Red
   Write-Host $delimiter -NoNewline 
   
   Write-Host $Severity -NoNewline
   Write-Host $delimiter -NoNewline
   
   Write-Host $Path
}

Write-SuspicionLog -Path C:\Users `
   -Message 'Lorem ipsum sic dolor'`
   -Severity 2 `
   -Category 'Bad Smell'

