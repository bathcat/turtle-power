# (Invoke-RestMethod https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt)  | 
#   %{$_ -split "`n"} |
#   Select-Object -First 1

Invoke-RestMethod https://www.gutenberg.org/files/1322/1322-0.txt |
  %{$_ -split  '\W'} |
  %{$_.ToLower()} |
#  %{$_ -replace ',',''} |
  Select-Object -First 1000 |
  Select-Object -Unique |
  Sort-Object -Property @{Expression = {Get-Random}}



