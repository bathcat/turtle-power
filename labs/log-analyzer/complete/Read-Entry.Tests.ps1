BeforeAll {
    Import-Module -Force $PSCommandPath.Replace('.Tests.ps1','.ps1')
}


Describe 'Read-Entry' {

    
    It 'Should get everything' {
        $entry = Read-Entry "02/12 11:01:06 INFO   :.....mailslot_create: creating mailslot for RSVP"

        $entry.timestamp.Day | Should -Be 02
        $entry.severity | Should -Be "INFO"
        $entry.operation | Should -Be "mailslot_create"
        $entry.message | Should -Be "creating mailslot for RSVP"
    }

}
