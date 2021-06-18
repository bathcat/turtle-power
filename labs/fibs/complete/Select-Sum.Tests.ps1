BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}
Describe 'Select-Sum' {

   It 'Should be 0 for @()' {
      @() | Select-Sum | Should -Be 0
   }

   It 'Should be 5 for @(5)' {
      @(5) | Select-Sum | Should -Be 5
   }

   It 'Should be 55 for 1..10' {
      1..10 | Select-Sum | Should -Be 55
   }

}
