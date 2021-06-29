BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}
Describe 'Get-Power' {

   It 'Should be 4 for 2**2' {
      Get-Power 2 2 | Should -Be 4
   }

   It 'Should be 0 for 0**0' {
      Get-Power 0 0 | Should -Be 0
   }

}
