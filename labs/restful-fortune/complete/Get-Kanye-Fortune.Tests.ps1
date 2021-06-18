BeforeAll {
    Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}
Describe 'Get-Fortune' {

    It 'Should parse json properly' {
        [string]$expected = 'All the musicians will be free'
        Mock Invoke-RestMethod {
            return ConvertFrom-Json "{'quote':'$expected'}"
        }

        Get-Fortune | Should -Be $expected
    }

}
