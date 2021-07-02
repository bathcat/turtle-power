Set-StrictMode -Version Latest


<#
.SYNOPSIS
   Describes a satitude/longitude pair.
.NOTES
   Ranges come from here:
      https://stackoverflow.com/questions/15965166/what-are-the-lengths-of-location-coordinates-latitude-and-longitude
#>
class Point {
   [ValidateRange(-90,90)]
   [float]$latitude

   [ValidateRange(-180,180)]
   [int]$longitude
}

<#
.SYNOPSIS
   Describes a location on the National Weather Service grid
#>
class GridLocation {
   [int] $x
   [int] $y

   [ValidateLength(3,3)]
   [string] $office
}

function Get-CurrentLocation {
   [CmdletBinding()]
   [OutputType([Point])]
   Param()

   $uri = 'http://www.geoplugin.net/json.gp'
   $json = Invoke-RestMethod $uri
   return [Point]@{
      latitude = $json.geoplugin_latitude;
      longitude = $json.geoplugin_longitude;
   }
}

function Get-GridLocation {
   [CmdletBinding()]
   [OutputType([GridLocation])]
   Param(
      [Parameter(ValueFromPipeline, Mandatory)]
      [ValidateNotNull()]
      [Point]$point
   )
   process {
      $uri = "https://api.weather.gov/points/$($point.latitude),$($point.longitude)"
      $json = Invoke-RestMethod $uri
      return [GridLocation]@{
         x = $json.properties.gridX
         y = $json.properties.gridY
         office = $json.properties.cwa
      }
   }
}

function Get-Forecast {
   [CmdletBinding()]
   [OutputType([string])]
   Param(
      [Parameter(ValueFromPipeline, Mandatory)]
      [ValidateNotNull()]
      [GridLocation]$location
   )
   process {
      $uri = "https://api.weather.gov/gridpoints/$($location.office)/$($location.x),$($location.y)/forecast"

      $json = Invoke-RestMethod $uri
      return $json.properties.periods[0].shortForecast
   }
}

function Get-Weather {
   return Get-CurrentLocation |
      Get-GridLocation |
      Get-Forecast
}