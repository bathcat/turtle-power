$words = 'chicken', 'galavant', 'desk', 'Timothy', 'seven'

function Get-PassPhrase {
   param(
      [int]$minWords,
      [int]$maxWords,
      [int]$seed = 1
   )

   $count = Get-Random -Minimum $minWords -Maximum $maxWords -SetSeed $seed
   return $words | Get-Random -Count $count -SetSeed $seed
}
