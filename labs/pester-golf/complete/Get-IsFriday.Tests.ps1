BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Get-IsFriday' {

   It 'Should be true for for 2 July 2021' {

      Mock Get-Date {
         return [System.DateTime]::Parse('07-02-2021')
      }

      Get-IsFriday | Should -Be $true
   }


   It 'Should be false for for 1 July 2021' {

      Mock Get-Date {
         return [System.DateTime]::Parse('07-01-2021')
      }

      Get-IsFriday | Should -Be $false
   }

}

