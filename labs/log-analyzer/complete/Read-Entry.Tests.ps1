BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Read-Entry' {

   It 'Should get everything' {
      $entry = Read-Entry '02/12 11:01:06 | INFO | 829913 | mailslot_create | creating mailslot for timer |  9.67.116.98'

      $entry.timestamp.Day | Should -Be 02
      $entry.userID | Should -Be 829913
      $entry.severity | Should -Be "INFO"
      $entry.operation | Should -Be "mailslot_create"
      $entry.message | Should -Be "creating mailslot for timer"
      $entry.details | Should -Be "9.67.116.98"
   }

   It 'Should work with 0 details' {
      $entry = Read-Entry '02/12 11:01:06 | INFO | 829913 | mailslot_create | creating mailslot for timer'

      $entry.timestamp.Day | Should -Be 02
      $entry.userID | Should -Be 829913
      $entry.severity | Should -Be "INFO"
      $entry.operation | Should -Be "mailslot_create"
      $entry.message | Should -Be "creating mailslot for timer"
      $entry.details | Should -Be ""
   }

}
