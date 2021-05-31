. $PSCommandPath.Replace('Build-Report.ps1','Read-Entry.ps1')

function Build-Report{
  Param(
      [Parameter(Mandatory=$true)]
      $logFile
  )

  return Get-Content $logFile |
    Read-Entry |
    Group-Object -Property "severity" -NoElement |
    Select-Object -Property Name, Count

}
