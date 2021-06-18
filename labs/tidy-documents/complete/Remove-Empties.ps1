function Remove-Empties {
    [CmdletBinding(
        SupportsShouldProcess,
        ConfirmImpact = 'High'
    )]
    param (
        [Parameter(Mandatory)]
        [string]$path
    )

    $reason = [System.Management.Automation.ShouldProcessReason]::None
    $shouldProcess = $PSCmdlet.ShouldProcess('MESSAGE', 'TARGET', 'OPERATION', [ref]$reason)

    if ((-not $shouldProcess) -and ($reason -eq 'None' )) {
        return;
    }

    $empties = Get-ChildItem -Path $path -Recurse |
        ? { $_ -is [System.IO.DirectoryInfo] } |
        ? { $_.GetFileSystemInfos().Count -eq 0 }

    Remove-Item $empties -WhatIf:$WhatIfPreference
}