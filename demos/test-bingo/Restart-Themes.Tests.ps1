BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}
Describe 'Restart-Themes' {
   It 'Should call Stop-Service and Start-Service' {
      Mock Stop-Service {} -Verifiable
      Mock Start-Service {} -Verifiable

      Restart-Themes
      Should -InvokeVerifiable
   }
}
