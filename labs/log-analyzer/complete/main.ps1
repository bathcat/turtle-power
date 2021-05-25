$limit = 4000000


function Get-Fibs($count){
  $previous = 1
  $current = 2

  if($count -eq 1){
    return @($previous)
  }

  if($count -eq 2){
    return $previous, $current
  }

  $numbers = @()
  for ($i = 0; $i -lt $count; $i += 1) {
    $numbers += $previous
    $next = $current + $previous
    $previous = $current
    $current = $next
  }

  return $numbers
}


$sum = 0
Get-Fibs 60 | ?{$_ -le $limit} | ?{$_ % 2 -eq 0} | %{$sum += $_}

"Here is your answer: $sum"
