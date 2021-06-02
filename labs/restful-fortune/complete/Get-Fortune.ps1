$endpoint = 'http://api.kanye.rest'
function Get-Fortune{
    [OutputType([string])]
    Param()

    $json = Invoke-RestMethod $endpoint
    $json.quote
}

