. $PSCommandPath.Replace('Main.ps1','Build-Report.ps1')

$VerbosePreference = "Continue"
Build-Report './labs/log-analyzer/_assets/prod221.log'
