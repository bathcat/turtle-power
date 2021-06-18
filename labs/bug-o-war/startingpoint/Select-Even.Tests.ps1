BeforeAll {
    Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Select-Even' {

    It 'Should let 2 through as a function' {
        Select-Even 2 | Should -Be 2
    }

    It 'Should let 2 through as a filter' {
        1, 2, 3 | Select-Even | Should -Be 2
    }

}

