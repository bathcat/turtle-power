class Account{
  [int]$id
  [string]$login
  [string[]]$roles
}

$users = @(
  [Account]@{id=11;login='jbloggs';roles='admin','remoteUser'},
  [Account]@{id=12;login='jdoe';roles='admin','contractor'},
  [Account]@{id=13;login='ksun';} 
)

$users


return

function Get-Self {
  Param(
    [array]$Self = @()
  )
  Write-Output $Self -NoEnumerate
}
(Get-Self @('x','y','z')).GetType()
(Get-Self @('x')).GetType()

return

function Get-Pi{
  [OutputType([float])]
  Param()
  return "Apple"
}
"Expected type: "
(Get-Command Get-Pi).OutputType.Name

"`nActual type: "
(Get-Pi).GetType().Name


return 

function Select-Sum{
  [OutputType(int)]
  Param(
    [int]$A,
    [int]$B
  )
  $result = $A + $B
  Write-Debug "Result is: $result"
  return $result
}
$sum = Select-Sum 11 ,'chicken', 44

$sum

return

[Flags()] enum Fixins {
  None = 0
  Pickles = 1
  Onions = 2
  Mustard = 4
}

function New-Burger{
  Param(
    [Fixins]$Fixins='None'
  )
  return "New burger with $Fixins"
}

New-Burger 'Pickles', 'None'


return

enum CleanLevel{
   Lazy
   Normal
   Compulsive
}

function Invoke-Cleanup {
   Param(
      [CleanLevel]$Thoroughness = 'Normal'
   )
   Write-Output "Cleaning up $Thoroughness-style...."
}

Invoke-Cleanup


return

$MyInvocation.MyCommand.Name
$($MyInvocation.MyCommand.Name.Split('.'))[0] + "-$(Get-Date -Format MMddyy_HHmmss).log"

return





$args = @{
    TypeDefinition = @"
public static class Mathy{
  public static int Add(int a, int b){
    return (a + b);
  }
}
"@
}

Add-Type @args
[Mathy]::Add(5, 19)


return

class User {
    [int]$id
    [string]$name
}
$admin = [User]@{
    id = 0
    name = 'administrator'
    handle = 'jerry'
}
$admin
