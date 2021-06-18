$limit = 4e6

function Get-Fibs() {
   return 1, 2, 3, 5, 8, 13, 21, 34, 55, 89
}

function Get-Euler02Solution() {
   $sum = 0
   Get-fibs | % { $sum += $_ }
   return $sum
}

$solution = Get-Euler02Solution
"Here is your answer: $solution"
