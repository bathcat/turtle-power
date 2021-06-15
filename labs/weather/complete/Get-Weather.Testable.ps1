Set-StrictMode -Version Latest

class Point {
    [int]$latitude
    [int]$longitude
}

class GridLocation {
    [int] $x
    [int] $y
    [string] $office
}

function Get-CurrentLocation {
    [OutputType([Point])]
    Param()

    $uri = 'http://www.geoplugin.net/json.gp'
    $json = Invoke-RestMethod $uri
    return [Point]@{
        latitude  = $json.geoplugin_latitude;
        longitude = $json.geoplugin_longitude;
    }
}

function Get-GridLocationUri {
    [OutputType([string])]
    Param(
        [Parameter(ValueFromPipeline = $true)]
        [Point]$point
    )
    process {
        return "https://api.weather.gov/points/$($point.latitude),$($point.longitude)"
    }
}


function Get-GridLocation {
    [OutputType([GridLocation])]
    Param(
        [Parameter(ValueFromPipeline = $true)]
        [Point]$point
    )
    process{
        $json = Invoke-RestMethod -Uri (Get-GridLocationUri $point)
        return [GridLocation]@{
            x      = $json.properties.gridX;
            y      = $json.properties.gridY;
            office = $json.properties.cwa;
        }
    }
}

function Get-ForecastUri {
    [OutputType([string])]
    Param(
        [Parameter(ValueFromPipeline = $true)]
        [GridLocation]$location
    )
    process {
        return "https://api.weather.gov/gridpoints/$($location.office)/$($location.x),$($location.y)/forecast"
    }
}
  

function Get-Forecast {
    [OutputType([string])]
    Param(
        [Parameter(ValueFromPipeline = $true)]
        [GridLocation]$location
    )
    process {
        [uri]$uri = Get-ForecastUri $location
        $json = Invoke-RestMethod -Uri $uri 
        return $json.properties.periods[0].shortForecast
    }
}

function Get-Weather {
    return Get-CurrentLocation |
            Get-GridLocation |
            Get-Forecast
}

Get-Weather