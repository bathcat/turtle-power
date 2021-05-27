function Get-Fortune{
    [OutputType([string])]
    Param()

    Get-Item './labs/file-fortune/_assets/fortunes.txt' |
    Get-Content |
        Sort-Object -Property @{Expression = {Get-Random}} |
        Select-Object -First 1
}

Get-Fortune
