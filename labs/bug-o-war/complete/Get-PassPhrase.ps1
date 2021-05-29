$words = 'chicken', 'galavant', 'desk', 'Timothy', 'seven'
$minWords = 1
$maxWords = 3


function Get-PassPhrase{
      [OutputType([string])]

  param(
    [int]$seed = 1
  )

  $count = Get-Random -Minimum $minWords -Maximum $maxWords -SetSeed $seed
  return $words | Get-Random -Count $count -SetSeed $seed
}
