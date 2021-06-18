filter Select-Even {
    if ($_ -eq $null) {
        throw "Unsupported. This is a filter."
    }

    if ($_ % 2 -eq 0) {
        return $_
    }
}
