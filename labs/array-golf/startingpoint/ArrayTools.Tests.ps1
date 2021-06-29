BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Select-UniqueElements' {

   It 'Should be empty for empty' {
      Select-UniqueElements @() | Should -Be @()
   }

   It 'Should be empty for empty' {
      $expected = 1, 2, 3, 4
      Select-UniqueElements $expected | Should -Be $expected
   }

   It 'Should do a single member right' {
      Select-UniqueElements 1, 1, 1, 1 | Should -Be 1
   }

   It 'Should handle multiple duplicates' {
      Select-UniqueElements 1, 1, 1, 7, 1, 4, 7, 88, 1 |
         Should -Be 1, 7, 4, 88
   }


}


Describe 'Get-Clone' {

   It 'Should have the same things' {
      $original = 2, 11, 'Chicken', 2.12
      $clone = Get-Clone $original

      for ( $i = 0; $i -lt $original.Length; $i++ ) {
         $clone[$i] | Should -Be $original[$i]
      }

   }

   It 'Should be a different container' {
      $original = 2, 11, 'Chicken', 2.12
      $clone = Get-Clone $original

      [System.Object]::Equals($original, $clone) |
         Should -BeFalse

   }

}