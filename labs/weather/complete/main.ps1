function Get-CurrentLocation(){
    $uri = 'http://www.geoplugin.net/json.gp'
    $json =  Invoke-RestMethod $uri
    return @{
        latitude=$json.geoplugin_latitude
        longitude=$json.geoplugin_longitude
    }
}

function Get-GridLocation($latitude,$longitude){
    $uri = "https://api.weather.gov/points/$latitude,$longitude"
    $json = Invoke-RestMethod $uri
    return @{
        office= $json.properties.cwa
        x=$json.properties.gridX
        y=$json.properties.gridY
    }
}

function Get-Forecast($office,$x,$y){
  $uri = "https://api.weather.gov/gridpoints/$office/$x,$y/forecast"
  $json =  Invoke-RestMethod $uri
  return $json.properties.periods[0].shortForecast
}

$here = Get-CurrentLocation
$hereOnGrid = Get-GridLocation $here.latitude $here.longitude

Get-Forecast $hereOnGrid.office $hereOnGrid.x $hereOnGrid.y

