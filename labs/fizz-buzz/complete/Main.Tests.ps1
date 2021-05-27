Import-Module Pester -PassThru

Describe 'Main' {
    It 'Should think that true is true' {        
        $true | Should -Be $true
    }
}

