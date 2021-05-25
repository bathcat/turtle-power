class Point{
    [int]$latitude
    [int]$longitude
}

function Get-CurrentLocation(){
    $uri = 'http://www.geoplugin.net/json.gp'
    $json =  Invoke-RestMethod $uri
    return [Point]@{
        latitude=$json.geoplugin_latitude;
        longitude=$json.geoplugin_longitude;
    }
}

class GridLocation{
    [int] $x
    [int] $y
    [string] $office
}

function Get-GridLocation([Point]$point){
    $uri = "https://api.weather.gov/points/$($point.latitude),$($point.longitude)"
    $json = Invoke-RestMethod $uri
    return [GridLocation]@{
        x=$json.properties.gridX;
        y=$json.properties.gridY;
        office=$json.properties.cwa;
    }
}

function Get-Forecast([GridLocation]$location){
  $uri = "https://api.weather.gov/gridpoints/$($location.office)/$($location.x),$($location.y)/forecast"
  $json =  Invoke-RestMethod $uri
  return $json.properties.periods[0].shortForecast
}

$here = Get-CurrentLocation
$hereOnGrid=Get-GridLocation $here
Get-Forecast $hereOnGrid