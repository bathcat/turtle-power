Set-StrictMode -Version Latest

class Entry {
   [datetime]$timestamp
   [int]$userID
   [string]$severity
   [string]$operation
   [string]$message
   [string]$details
}

function Read-Timestamp {
   [OutputType([datetime])]
   Param(
      [Parameter(ValueFromPipeline = $true)]
      [string]$logEntry
   )

   process {

      $params = @{
         Day = $logEntry.Substring(0, 2);
         Month = $logEntry.Substring(3, 2);
         Hour = $logEntry.Substring(6, 2);
         Minute = $logEntry.Substring(9, 2);
         Second = $logEntry.Substring(12, 2);
      }

      return Get-Date @params
   }
}


function Read-Entry {
   [OutputType([Entry])]
   Param(
      [Parameter(ValueFromPipeline = $true)]
      [string]$logEntry
   )

   process {
      $fields = $logEntry -split '[|]'

      return [Entry]@{
         timestamp = Read-Timestamp $fields[0]
         severity = $fields[1].Trim()
         userID = $fields[2].Trim()
         operation = $fields[3].Trim()
         message = $fields[4].Trim()
         details = $fields.Length -eq 6 ? $fields[5].Trim() : ''
      }
   }
}
