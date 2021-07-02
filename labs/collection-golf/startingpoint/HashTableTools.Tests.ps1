BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Select-Counts' {

   It 'Should be empty for empty' {
      [hashtable]$actual = Select-Counts @()
      $actual.Count | Should -Be 0
   }

   It 'Should add properly' {
      [hashtable]$actual = Select-Counts 'moon', 1, 3.14, 1, 'moon', 'moon', 13, 13, 13, 13
      $actual[1] | Should -Be 2
      $actual[3.14] | Should -Be 1
      $actual['moon'] | Should -Be 3
      $actual[13] | Should -Be 4
   }



}
