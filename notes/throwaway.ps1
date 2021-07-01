[Flags()]enum Fixins{
  None =0
  Onion = 1
  Mustard = 2
  Pickles = 4
  Tomato = 8

}
function New-Burger{
  Param(
    [Fixins]$Fixins=15
  )
  "New burger with $Fixins!"
}

[Fixins]$asEnumValue = 'Onion', 'Tomato'
[int]$asIntMask = $asEnumValue
[string]$asString = $asEnumValue

foreach($f in $asStrings){
  Write-Host "Fixin: $f"
}