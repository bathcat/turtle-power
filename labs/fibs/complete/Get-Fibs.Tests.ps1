BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}
Describe 'Get-Fibs' {

   It 'Should be 1 for 1' {
      Get-Fibs 1 | Should -Be 1
   }

   It 'Should be [1,2] for 2' {
      Get-Fibs 2 | Should -Be 1, 2
   }

   It 'Should get the first 10 terms right' {
      Get-Fibs 10 | Should -Be 1, 2, 3, 5, 8, 13, 21, 34, 55, 89
   }

}
