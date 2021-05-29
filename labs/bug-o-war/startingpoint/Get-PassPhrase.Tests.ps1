BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1','.ps1')
}

Describe 'Get-PassPhrase' {
    
    It 'Should get a max of 3 words' {        
        $passphrase = Get-PassPhrase
        $passphrase.Length | Should -BeLessOrEqual 3
    }
}

