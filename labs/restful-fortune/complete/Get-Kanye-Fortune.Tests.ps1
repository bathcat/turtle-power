BeforeAll {
   Import-Module -Force $PSCommandPath.Replace('.Tests.ps1', '.ps1')

}
Describe 'Get-Fortune' {

   It 'Should parse json properly' {
      # Arrange
      [string]$expected = 'All the musicians will be free'
      Mock Invoke-RestMethod {
         return ConvertFrom-Json "{'quote':'$expected'}"
      }

      #Act
      $actual = Get-Fortune

      #Assert
      $actual | Should -Be $expected
   }

   It 'Should throw on bogus result' {
      Mock Invoke-RestMethod {
         return ConvertFrom-Json '{"property":12}'
      }

      { Get-Fortune } | Should -Throw -ExceptionType ([System.Management.Automation.PropertyNotFoundException])
   }

}
