. $PSCommandPath.Replace('Write-Report.ps1','Build-Report.ps1')




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

  $htmlProps = @{
    PreContent='<style>th{color:green;}</style>';
    Title = 'Log Report'
  }

  Write-Verbose "Going through log file."

  Build-Report $logFile |
    ConvertTo-Html @htmlProps |
    Out-File -FilePath $file

  Write-Verbose "Opening browser"
  try{
    Invoke-Item $file
  }
  catch [System.ComponentModel.Win32Exception]{
    Write-Verbose "Unable to open web browser-- this happens with the docker thing."
    Write-Verbose "But your report is still there: $file"
  }

}