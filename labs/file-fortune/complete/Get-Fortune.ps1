Set-StrictMode -Version Latest

$path = Split-Path $PSCommandPath |
   Split-Path |
   Join-Path -ChildPath '_assets/fortunes.txt'

function Get-Fortune {
   [OutputType([string])]
   Param()

   return Get-Item $path |
      Get-Content |
      Sort-Object -Property @{Expression = { Get-Random } } |
      Select-Object -First 1
}

