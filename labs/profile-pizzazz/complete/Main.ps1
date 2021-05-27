# This goes in my $profile
function New-Blankfile($path){
    Write-Output '' >> $path
}
  
New-Alias -Name 'touch' -Value New-Blankfile


#---

function Get-CommandPath($command){
    return (Get-Command $command).Path
}

New-Alias -Name 'which' -Value Get-CommandPath

#---

function Get-StaticProperties(){
    $class = [System.Environment]
    return $class | 
        Get-Member -Static -MemberType Property | 
        Select-Object -expand Name | 
        % { "$_ = $($class::$_)" }

}
Get-StaticProperties