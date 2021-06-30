

$gradeEnrollment=@{}
$gradeEnrollment.Add(4, 233)
$gradeEnrollment.Add(5, 232)


$gradeEnrollment


return
function Get-Self{
  param(
    $Self
  )
  return $Self 
}

$a = 1, 2, 3
$b = Get-Self $a

$a[0] = 'chicken'

"`nHere is a: $a"
"`nHere is b: $b"

return


function Get-Count($Target){
  process{
    if($Target -is [array]){
      return "Got an array with $($Target.Length) items."
    }
    return "Got 1 item."
  }
}
$items = 1,2,3

Write-Host "`nPiped things:" -ForegroundColor Green
$items | Get-Count

Write-Host "`n Param things:" -ForegroundColor Green
Get-Count $items



return
function Get-Self{
  param(
    $Item
  )
  Write-Host $Item
}

$thingArray = 'dog', 'planet', 'rag'

$thingTable = @{
  items='dog','planet','rag'
}

Write-Host "`nThings:" -ForegroundColor Green
$thingArray | Write-Output 

Write-Host "`nMore Things:" -ForegroundColor Green
$thingTable | Write-Output

