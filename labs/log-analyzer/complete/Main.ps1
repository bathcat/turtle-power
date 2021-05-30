$path = './labs/log-analyzer/_assets/prod221.log'

class Entry{
  [string]$timestamp
  [string]$severity
  [string]$operation
  [string]$message
}


function Read-Timestamp{
  [OutputType([datetime])]
  Param(
    [Parameter(ValueFromPipeline=$true)]
    [string]$logEntry
  )

  process{

    $params = @{
      Day = $logEntry.Substring(0,2);
      Month = $logEntry.Substring(3,2);
      Hour = $logEntry.Substring(6,2);
      Minute = $logEntry.Substring(9,2);
      Second = $logEntry.Substring(12,2);
    }

    return Get-Date @params
  }
}

function Read-Severity{
  [OutputType([string])]
  Param(
    [Parameter(ValueFromPipeline=$true)]
    [string]$logEntry
  )
  process{
    return $logEntry.Substring(15,7).Trim()
  }
}

function Read-Operation{
  [OutputType([string])]
  Param(
    [Parameter(ValueFromPipeline=$true)]
    [string]$logEntry
  )
  process{
    return $logEntry.Substring(23).Replace(".","").Split(":")[0];
  }        
}

function Read-Message{
  [OutputType([string])]
  Param(
    [Parameter(ValueFromPipeline=$true)]
    [string]$logEntry
  )
  process{
    return $logEntry.Substring(23).Replace(".","").Split(":")[1].Trim();
  }              
}

function Read-Entry{
  [OutputType([Entry])]
  Param(
    [Parameter(ValueFromPipeline=$true)]
    [string]$logEntry
  )
  # TODO: Shouldn't I cast this to the class explicitly? I want to, but it borks up the tests...
  process {return @{
    timestamp = Read-Timestamp $logEntry;
    severity = Read-Severity $logEntry;
    operation = Read-Operation $logEntry;
    message = Read-Message $logEntry;
  }}
}

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
