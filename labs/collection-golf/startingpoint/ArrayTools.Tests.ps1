BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Select-Unique' {

   It 'Should be empty for empty' {
      Select-Unique @() | Should -Be @()
   }

   It 'Should be empty for empty' {
      $expected = 1, 2, 3, 4
      Select-Unique $expected | Should -Be $expected
   }

   It 'Should do a single member right' {
      Select-Unique 1, 1, 1, 1 | Should -Be 1
   }

   It 'Should handle multiple duplicates' {
      Select-Unique 1, 1, 1, 7, 1, 4, 7, 88, 1 |
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

Describe 'Select-Partitions' {

   It 'Should work for 1 partition' {
      $original = 2, 11
      $actual = Select-Partitoned $original

      for ( $i = 0; $i -lt $original.Length; $i++ ) {
         $actual[$i] | Should -Be $original[$i]
      }
   }

}



Describe 'Select-Flattened' {

   It 'Should work on 1 dimension' {
      $expected = 2, 3, 4, 5
      $actual = Select-Flattened $expected

      for ( $i = 0; $i -lt $original.Length; $i++ ) {
         $expected[$i] | Should -Be $actual[$i]
      }
   }

   It 'Should work on multi dimension' {
      $original = @(
         1,
         @(2, 3),
         @(),
         @(
            @(4)
         )
      )
      $actual = Select-Flattened $original
      $expected = 1, 2, 3, 4

      for ( $i = 0; $i -lt $original.Length; $i++ ) {
         $expected[$i] | Should -Be $actual[$i]
      }
   }

}