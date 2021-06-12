Import-Module $PSScriptRoot/Read-Entry.ps1 -Force

function Build-Report{
  Param(
      [Parameter(Mandatory=$true)]
      [ValidateNotNullOrEmpty()]
      $logFile
  )

  $entries = Get-Content $logFile | Read-Entry

  $summary = $entries |
    Group-Object -Property "severity" -NoElement |
    Select-Object -Property Name, Count |
    Sort-Object -Property Count -Descending |
    ConvertTo-Html -Fragment

  $badThings = $entries |
    ?{$_.severity -in @('WARNING','PROTERR')} |
    ConvertTo-Html -Fragment


  $body= "
    <style>th{color:green;}</style>
    <h1>Summary</h1>
    $summary
    <h1>Bad things</h1>
    $badThings
  "

  return ConvertTo-Html -Body $body -Title 'Log Report'


}
