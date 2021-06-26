function Invoke-Timer {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory)]
      [scriptblock]$ScriptBlock
   )
   $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
   $result = & $ScriptBlock

   $elapsedMs = $stopwatch.ElapsedMilliseconds
   Write-Information "Time: $elapsedMs (ms)"

   return $result
}

function New-BigArray($max = 10000){
   $xs = @()
   1..$max | %{$xs += "Value: $_"}
   return $xs
}

function New-BigArrayList($max = 10000){
   $xs = [System.Collections.ArrayList]::new()
   1..$max | %{$xs.Add("Value: $_")}
   return $xs
}

"`n`nHere's the array:"
Invoke-Timer -ScriptBlock {New-BigArray > $null} -InformationAction Continue

"`n`nHere's the array-list:"
Invoke-Timer -ScriptBlock {New-BigArrayList > $null} -InformationAction Continue
