$path = './labs/log-analyzer/_assets/prod221.log'

function Get-Report(){
  return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a placerat sapien.'
}

Get-Item $path | Get-Content
