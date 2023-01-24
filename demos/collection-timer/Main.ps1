function Invoke-Timer {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory)]
      [scriptblock]$ScriptBlock
   )
   $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
   $result = & $ScriptBlock

   $elapsedMs = $stopwatch.ElapsedMilliseconds
   Write-Host "Time: $elapsedMs (ms)"

   return $result
}

function Get-BigArray($max = 10000) {
   $xs = @()
   1..$max | % { $xs += "Value: $_" }
   return $xs
}

function Get-BigArrayList($max = 10000) {
   [System.Collections.ArrayList]$xs = [System.Collections.ArrayList]::new()
   1..$max | % { $xs.Add("Value: $_") }
   return [System.Collections.ArrayList]$xs
}

Write-Host "Get-BigArray"
Invoke-Timer { Get-BigArray > $null }

Write-Host "Get-BigArrayList"
Invoke-Timer { Get-BigArrayList > $null }