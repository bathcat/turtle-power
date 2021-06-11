BeforeAll {
    Import-Module -Force $PSCommandPath.Replace('.Tests.ps1','.ps1')
}

Describe 'Get-PassPhrase' {

    It 'Should get a max of 3 words' {
        [array]$passphrase = Get-PassPhrase -minWords 1 -maxWords 3
        $passphrase.Length | Should -BeLessOrEqual 3
    }

}
