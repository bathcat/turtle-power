class User{
    [int]$id
    [string]$login
}

function Build-User{
    [OutputType([User])]
    Param(
        [int]$ID,
        [string]$Login
    )
    return [User]@{
        id = $ID;
        login = $Login;
    }
}