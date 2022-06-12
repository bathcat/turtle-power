function fix-slidebreaks($path){
    (Get-Content $path -Raw) -replace '(?ms)\s^(?=#{1,3}\s)', "---`n`n" | Out-File $path
}

