$path = Split-Path $PSCommandPath |
    Split-Path |
    Join-Path -ChildPath '_assets/fortunes.txt'

function Get-Fortune(){
  return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a placerat sapien.'
}



