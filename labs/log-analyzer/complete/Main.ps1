$path = './labs/log-analyzer/_assets/prod221.log'

class Entry{
  [string]$timestamp
  [string]$severity
  [string]$operation
  [string]$message
}

function Get-Report(){
  return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a placerat sapien.'
}

Get-Item $path | Get-Content | ? {$_ -like '*WARN*'} | Write-Host -

