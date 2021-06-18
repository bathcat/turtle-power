Set-StrictMode -Version Latest

class Entry {
    [datetime]$timestamp
    [string]$severity
    [string]$operation
    [string]$message
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

function Read-Severity {
    [OutputType([string])]
    Param(
        [Parameter(ValueFromPipeline = $true)]
        [string]$logEntry
    )
    process {
        return $logEntry.Substring(15, 7).Trim()
    }
}

function Read-Operation {
    [OutputType([string])]
    Param(
        [Parameter(ValueFromPipeline = $true)]
        [string]$logEntry
    )
    process {
        return $logEntry.Substring(23).Replace(".", "").Split(":")[0];
    }
}

function Read-Message {
    [OutputType([string])]
    Param(
        [Parameter(ValueFromPipeline = $true)]
        [string]$logEntry
    )
    process {
        return $logEntry.Substring(23).Replace(".", "").Split(":")[1].Trim();
    }
}

function Read-Entry {
    [OutputType([Entry])]
    Param(
        [Parameter(ValueFromPipeline = $true)]
        [string]$logEntry
    )

    process { return [Entry]@{
            timestamp = Read-Timestamp $logEntry;
            severity = Read-Severity $logEntry;
            operation = Read-Operation $logEntry;
            message = Read-Message $logEntry;
        } }
}
