BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}
Describe 'Get-Quotient' {

   It 'Should be 1 for 2/2' {
      Get-Quotient 2 2 | Should -Be 1
   }

   It 'Should throw on 1/0' {
      { Get-Quotient 1 0 } | Should -Throw
   }

}
