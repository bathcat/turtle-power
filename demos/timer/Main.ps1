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


Invoke-Timer -ScriptBlock {Write-Host 'xyz'} -InformationAction Continue
