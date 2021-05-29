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
    [int]$day = $logEntry.Substring(0,2);
    [int]$month = $logEntry.Substring(3,2);
    [int]$hour = $logEntry.Substring(6,2);
    [int]$minute = $logEntry.Substring(9,2);
    [int]$second = $logEntry.Substring(12,2);

    return Get-Date -Month $month -Day $day -Hour $hour -Minute $minute -Second $second
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

$styleElement = '<style>th{color:green;}</style>'
function Build-Report{

  Get-Content $path | 
  Read-Entry | 
  Group-Object -Property "severity" -NoElement |
  Select-Object -Property Name, Count |
  ConvertTo-Html -Title 'Log Report' -PreContent $styleElement  |
  Out-File -FilePath './report.html' 

  try{
    invoke-item 'report.html'
  }
  catch [System.ComponentModel.Win32Exception]{
    Write-Host "Unable to open web browser-- this happens with the docker thing."
    Write-Host "But your report is still there: report.html"
  }

}


Build-Report
