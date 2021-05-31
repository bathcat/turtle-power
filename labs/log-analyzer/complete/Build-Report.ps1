. $PSCommandPath.Replace('Build-Report.ps1','Read-Entry.ps1')

function Build-Report{
  Param(
      [Parameter(Mandatory=$true)]
      $logFile
  )

  $entries = Get-Content $logFile | Read-Entry

  return $entries |
    Group-Object -Property "severity" -NoElement |
    Select-Object -Property Name, Count |
    Sort-Object -Property Count -Descending

}
