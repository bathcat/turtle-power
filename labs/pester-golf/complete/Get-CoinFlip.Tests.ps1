BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Get-CoinFlip' {

   It 'Should be consistent with controlled randomness' {
      # Arrange
      $samples = 100
      $seed = Get-Random -Maximum 1.0 -Minimum 0.0

      # Act
      $first, $rest = 1..$samples |
         % { Get-Coinflip -Seed $seed }

      # Assert
      $rest | % { $_ | Should -Be $first }
   }

   It 'Should be roughly 50/50 with actual randomness' {
      # Arrange
      $samples = 500
      $window = .2
      $minimumHeads = $samples * .5 * (1 - $window)
      $maximumHeads = $samples * .5 * (1 + $window)

      # Act
      $heads = 1..$samples |
                  % { Get-Coinflip } |
                  ? { $_ -eq [CoinFace]::Heads }

      Write-Host "`n`nHeadCount: $($heads.Length)`n`n" -ForegroundColor Green

      # Assert
      $heads.Length |
         Should -BeGreaterThan $minimumHeads |
         Should -BeLessThan $maximumHeads
   }



}




