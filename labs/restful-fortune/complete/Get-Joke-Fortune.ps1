Set-StrictMode -Version Latest

function Get-Fortune{
    [OutputType([string])]
    Param(
        [uri]
        $endpoint = 'https://official-joke-api.appspot.com/random_joke'
    )

    $json = Invoke-RestMethod $endpoint
    return $json.setup + "`n" + $json.punchline
}

