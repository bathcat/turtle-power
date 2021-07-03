BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Get-IsFriday' {

   It 'Should be true for for 2 July 2021' {
      $isActuallyFriday = Get-Date -Date '07-02-2021'
      $false | Should -BeTrue
   }

   It 'Should be false for for 1 July 2021' {
      $notActuallyFriday = Get-Date -Date '07-01-2021'
      $false | Should -BeTrue
   }

}

