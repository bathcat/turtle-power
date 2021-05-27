BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1','.ps1')
}
Describe 'Get-Message' {
    
    It 'Should be "11" for 11' {        
        11 | Get-Message | Should -Be '11'
    }

    It 'Should be "fizz" for 6' {        
        6 | Get-Message | Should -Be 'fizz'
    }

    It 'Should be "buzz" for 10' {        
        10 | Get-Message | Should -Be 'buzz'
    }

    It 'Should be "fizzbuzz" for 15' {        
        15 | Get-Message | Should -Be 'fizzbuzz'
    }

}
