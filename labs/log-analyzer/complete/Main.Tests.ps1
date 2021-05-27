BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1','.ps1')
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

Describe 'Read-Message' {
    
    It 'Should get text' {    
        Read-Message "02/12 11:01:06 INFO   :.....mailslot_create: creating mailslot for RSVP" |
            Should -Be "creating mailslot for RSVP"
    }

}


Describe 'Read-Operation' {
    
    It 'Should get mailslot_create' {    
        Read-Operation "02/12 11:01:06 INFO   :.....mailslot_create: creating mailslot for RSVP" |
            Should -Be "mailslot_create"
    }

}

Describe 'Read-Severity' {
    
    It 'Should get INFO' {    
        Read-Severity "02/12 11:01:06 INFO   :.....mailslot_create: creating mailslot for RSVP" |
            Should -Be "INFO"
    }

    It 'Should get WARNING' {    
        Read-Severity "02/12 11:01:06 WARNING:.....mailslot_create: setsockopt(MCAST_ADD) failed - EDC8116I Address not available." |
            Should -Be "WARNING"
    }
}

Describe 'Read-Timestamp' {
    
    It 'Should get month' {    
        [datetime]$timestamp = Read-Timestamp "02/12 11:01:06 INFO   :.....mailslot_create: creating mailslot for RSVP";
        
        $timestamp.Month | 
            Should -Be 12
    }

    It 'Should get day' {    
        [datetime]$timestamp = Read-Timestamp "02/12 11:01:06 INFO   :.....mailslot_create: creating mailslot for RSVP";
        
        $timestamp.Day | 
            Should -Be 02
    }

    It 'Should get hour' {    
        [datetime]$timestamp = Read-Timestamp "02/12 11:01:06 INFO   :.....mailslot_create: creating mailslot for RSVP";
        
        $timestamp.Hour | 
            Should -Be 11
    }

    It 'Should get minute' {    
        [datetime]$timestamp = Read-Timestamp "02/12 11:01:06 INFO   :.....mailslot_create: creating mailslot for RSVP";
        
        $timestamp.Minute | 
            Should -Be 01
    }

    It 'Should get second' {    
        [datetime]$timestamp = Read-Timestamp "02/12 11:01:06 INFO   :.....mailslot_create: creating mailslot for RSVP";
        
        $timestamp.Second | 
            Should -Be 06
    }

}
