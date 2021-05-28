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

filter Get-Evens{
  if($_%2 -eq 0){
    return $_
  }
}


filter Get-InRange{
  if($_ -le $limit){
    return $_
  }
}


"Here is your answer: "

Get-Fibs 60 | 
Get-InRange | 
Get-Evens | 
Get-Sum

