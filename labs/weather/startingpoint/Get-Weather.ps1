function Get-CurrentLocation() {
    return @{
        latitude = 0
        longitude = 0
    }
}

function Get-GridLocation($latitude, $longitude) {
    return @{
        office = 'XYZ'
        x = 0
        y = 0
    }
}

function Get-Forecast($office, $x, $y) {
    return "`nLorem ipsum sic dolor.`n"
}

function Get-Weather {
    $here = Get-CurrentLocation
    $hereOnGrid = Get-GridLocation $here.latitude $here.longitude
    return Get-Forecast $hereOnGrid.office $hereOnGrid.x $hereOnGrid.y
}

