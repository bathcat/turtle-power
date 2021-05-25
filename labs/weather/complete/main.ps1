class Point{
    [int]$latitude
    [int]$longitude

    Point($latitude,$longitude){
        $this.latitude = $latitude
        $this.longitude = $longitude
    }
}

function Get-CurrentLocation(){
    $uri = 'http://www.geoplugin.net/json.gp'
    $json =  Invoke-RestMethod $uri
    return [Point]::new(
        $json.geoplugin_latitude,
        $json.geoplugin_longitude
    )
}

class GridLocation{
    [int] $x
    [int] $y
    [string] $office

    GridLocation($x,$y,$office){
        $this.x = $x
        $this.y = $y
        $this.office=$office
    }
}

function Get-GridLocation([Point]$point){
    $uri = "https://api.weather.gov/points/$($point.latitude),$($point.longitude)"
    $json = Invoke-RestMethod $uri
    return [GridLocation]::new(
        $json.properties.gridX,
        $json.properties.gridY,
        $json.properties.cwa
    )
}

function Get-Forecast([GridLocation]$location){
  $uri = "https://api.weather.gov/gridpoints/$($location.office)/$($location.x),$($location.y)/forecast"
  $json =  Invoke-RestMethod $uri
  return $json.properties.periods[0].shortForecast
}

$here = Get-CurrentLocation
$hereOnGrid = Get-GridLocation $here
Get-Forecast $hereOnGrid
