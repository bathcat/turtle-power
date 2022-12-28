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
   1..$max | %{ $xs += "Value: $_" }
   return $xs
}

function New-BigArrayList($max = 10000){   

   [System.Collections.ArrayList]$xs = [System.Collections.ArrayList]::new()
   1..$max | %{ $xs.Add("Value: $_") }
   #1..$max | %{$xs += "Value: $_"}
   return [System.Collections.ArrayList]$xs
}
$al = New-BigArrayList
$al.GetType()

