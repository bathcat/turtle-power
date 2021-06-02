. $PSCommandPath.Replace('Main.ps1','Write-Report.ps1')

$VerbosePreference = "Continue"
Write-Report './labs/log-analyzer/_assets/prod221.log'
