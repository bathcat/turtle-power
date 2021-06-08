Import-Module $PSScriptRoot/Build-Report.ps1 -Force

function Write-Report{
  Param(
      [Parameter(Mandatory=$true)]
      $logFile,
      [Parameter()]
      $reportFolder = 'dist'
  )

  $file = Join-Path $reportFolder 'report.html'

  if(-not (Test-Path $reportFolder)){
    New-Item -Path $reportFolder -ItemType Directory | Out-Null
  }

  Write-Verbose "Going through log file."

  Build-Report $logFile | Out-File -FilePath $file

  Write-Verbose "Opening browser"
  try{
    Invoke-Item $file
  }
  catch [System.ComponentModel.Win32Exception]{
    Write-Verbose "Unable to open web browser-- this happens with the docker thing."
    Write-Verbose "But your report is still there: $file"
  }

}