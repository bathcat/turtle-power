BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1','.ps1')
}

Describe 'Get-Square' {
    
    It 'Should work as a function' {        
        Get-Square 2 | Should -Be 4
    }

    It 'Should work piped' {        
        2 | Get-Square | Should -Be 4
    }

}

