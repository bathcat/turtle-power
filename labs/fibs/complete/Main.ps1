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

function Get-Sum{
  [OutputType([string])]
  Param(
      [Parameter(ValueFromPipeline=$true)]
      [int]$n
  )
  begin{
    $sum=0
  }

  process{
    $sum+=$n
  }

  end{
    return $sum
  }
}


"Here is your answer: "

Get-Fibs 60 | 
? { $_ -le $limit } | 
? { $_ % 2 -eq 0 } | 
Get-Sum

