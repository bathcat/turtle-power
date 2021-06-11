Set-StrictMode -Version Latest
function Get-Fortune{
    [OutputType([string])]
    Param(
        [uri]
        $endpoint = 'http://api.kanye.rest'
    )

    $json = Invoke-RestMethod $endpoint
    return $json.quote
}

