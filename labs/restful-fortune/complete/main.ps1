$endpoint = 'http://api.kanye.rest'
function Get-Fortune(){
    $json = Invoke-RestMethod $endpoint
    $json.quote
}

Get-Fortune
