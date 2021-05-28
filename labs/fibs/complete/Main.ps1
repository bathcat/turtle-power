$limit = 4000000


function Get-Fibs($count) {
  $previous = 1
  $current = 2

  for ($i = 0; $i -lt $count; $i += 1) {
    Write-Output $previous
    $numbers += $previous
    $next = $current + $previous
    $previous = $current
    $current = $next
  }
}


$sum = 0
Get-Fibs 60 | 
? { $_ -le $limit } | 
? { $_ % 2 -eq 0 } | 
% { $sum += $_ }

"Here is your answer: $sum"
