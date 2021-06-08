BeforeAll {
    Import-Module -Force $PSCommandPath.Replace('.Tests.ps1','.ps1')
}

Describe 'Get-GridLocationUri' {
    
    It 'Should format properly' {    
        $location = @{
            latitude=25;
            longitude=33;
        }
        
        Get-GridLocationUri $location | 
            Should -Be "https://api.weather.gov/points/25,33"
    }

}


Describe 'Get-ForecastUri' {
    
    It 'Should format properly' {    
        $location = @{
            office='xyz';
            x=25;
            y=33;
        }
        
        Get-ForecastUri $location | 
            Should -Be "https://api.weather.gov/gridpoints/xyz/25,33/forecast"
    }

}

