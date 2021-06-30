function Get-Update{
    [OutputType([string])]
    [CmdletBinding()]
    param(
      [Parameter(Mandatory)]
      [ValidateLength(10, 100)]
      [string] $Message,
  
      [Parameter(Mandatory)]
      [ValidateSet('Low', 'Medium', 'High')]
      [string] $Severity,
  
       [Parameter(Mandatory)]
       [ValidateScript( { Test-Path $_ } )]
      [string] $Path
    )
    return "$Severity - $Message - $Path"
}

Get-Update -Message 'There is no spoon!!!!' -Severity 'Medium' -Path 'c:/temp'

