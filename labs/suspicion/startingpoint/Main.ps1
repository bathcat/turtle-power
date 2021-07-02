

function Write-SuspicionLog($Path, $Message, $Severity, $Category) {
   Write-Host "Suspicious File! | $Message | $Category | $Severity | $Path"
}