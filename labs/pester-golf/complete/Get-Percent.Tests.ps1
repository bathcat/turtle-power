BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Get-Percent' {

   It 'Should be 50 for 1/2' {
      Get-Percent 1 2 | Should -Be 50
   }

   It 'Should be 200 for 2/1' {
      Get-Percent 2 1 | Should -Be 200
   }

   It 'Should be 33.33 for 1/3' {
      Get-Percent 1 3 |
         Should -BeGreaterThan 3.333 |
         Should -BeLessThan 3.334
   }

   It 'Should throw with 0 denominator' {
      { Get-Percent 1 0 } |
         Should -Throw
   }

}

