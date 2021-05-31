function Get-CurrentLocation(){
  $uri = 'http://www.geoplugin.net/json.gp'
  return @{
      latitude=0
      longitude=0
  }
}

function Get-GridLocation($latitude,$longitude){
  $uri = "https://api.weather.gov/points/$latitude,$longitude"
  return @{
      office= 'XYZ'
      x=0
      y=0
  }
}

function Get-Forecast($office,$x,$y){
  $uri = "https://api.weather.gov/gridpoints/$office/$x,$y/forecast"
  return '$response.properties.periods[0].shortForecast'
}
