class Point{
    [int]$latitude
    [int]$longitude
}

class GridLocation{
    [int] $x
    [int] $y
    [string] $office
}

function Get-CurrentLocation{
    [OutputType([Point])]
    Param()

    $uri = 'http://www.geoplugin.net/json.gp'
    $json =  Invoke-RestMethod $uri
    return [Point]@{
        latitude=$json.geoplugin_latitude;
        longitude=$json.geoplugin_longitude;
    }
}

function Get-GridLocation{
    [OutputType([GridLocation])]
    Param([Point]$point)

    $uri = "https://api.weather.gov/points/$($point.latitude),$($point.longitude)"
    $json = Invoke-RestMethod $uri
    return [GridLocation]@{
        x=$json.properties.gridX;
        y=$json.properties.gridY;
        office=$json.properties.cwa;
    }
}

function Get-Forecast{
  [OutputType([string])]
  Param([GridLocation]$location)

  $uri = "https://api.weather.gov/gridpoints/$($location.office)/$($location.x),$($location.y)/forecast"
  $json =  Invoke-RestMethod $uri
  return $json.properties.periods[0].shortForecast
}

$here = Get-CurrentLocation
$hereOnGrid=Get-GridLocation $here
Get-Forecast $hereOnGrid
