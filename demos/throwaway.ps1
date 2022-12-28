[Flags()] enum Fixins {
   None = 0
   Pickles = 1
   Onions = 2
   AnimalStyle = 3
   Mustard = 4
   Everything = 7
}

[Fixins]$fixins = 'AnimalStyle'

Write-Host $fixins
