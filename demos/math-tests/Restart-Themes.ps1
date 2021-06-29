Set-StrictMode -Version Latest


function Restart-Themes {
   Stop-Service 'Themes'
   Start-Service 'Themes'
}
