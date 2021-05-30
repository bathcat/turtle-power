. $PSCommandPath.Replace('Main.ps1','Read-Entry.ps1')

$path = './labs/log-analyzer/_assets/prod221.log'

function Build-Report{
  $folder = 'dist'
  $file = Join-Path $folder 'report.html'

  if(-not (Test-Path $folder)){
    New-Item -Path $folder -ItemType Directory | Out-Null
  }

  $htmlProps = @{
    PreContent='<style>th{color:green;}</style>';
    Title = 'Log Report'
  }

  Get-Content $path | 
    Read-Entry | 
    Group-Object -Property "severity" -NoElement |
    Select-Object -Property Name, Count |
    ConvertTo-Html @htmlProps  |
    Out-File -FilePath $file

  try{
    Invoke-Item $file
  }
  catch [System.ComponentModel.Win32Exception]{
    Write-Verbose "Unable to open web browser-- this happens with the docker thing."
    Write-Verbose "But your report is still there: report.html"
  }

}

Build-Report
