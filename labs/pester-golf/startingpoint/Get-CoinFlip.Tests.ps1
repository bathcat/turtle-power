BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Get-CoinFlip' {

   It 'Should give consistent results with controlled randomness' {
      $false | Should -BeTrue
   }

   It 'Should be roughly 50/50 with actual randomness' {
      $false | Should -BeTrue
   }

}




