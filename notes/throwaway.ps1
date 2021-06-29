
$xs = 1, 2, 3
$head, $tail = $xs
"Head: $head"
"Tail: $tail"

return 

function Get-Self{
  param(
    $Self
  )
  Write-Output $Self -NoEnumerate 
}

$a = 1, 2, 3
$b = Get-Self $a

$a[0] = 'chicken'

"`nHere is a: $a"
"`nHere is b: $b"


$a.GetType().IsByRef

return

$places = 'ocean', 'mountains', 'desert', 'jungle', 'forest', 'city'
$indexes = 0, 3, 0, 4
$places[$indexes]

return

Set-StrictMode -Version Latest
function Write-Placement([string]$product, [int]$quantity) {
  "I like $product. It's great!"
  "You should buy $quantity of them."
}

Write-Placement

return

#Set-StrictMode -Version Latest
function Get-Message{
  param(
    [string]$Path
  )
  return "Here is your path: $File"
}

Get-Message c:/temp



return

#using namespace System.IO

$changeTypes = [WatcherChangeTypes]::Created, [WatcherChangeTypes]::Deleted
$watcher = [FileSystemWatcher]::new('c:/temp/');

while($true){
  $result = $watcher.WaitForChanged($changeTypes, 5000)
  if(-not $result.TimedOut){
    "Got a change: $($result.ChangeType), $($result.Name)"
  }
}



return
function Remove-File {
  [CmdletBinding(
    SupportsShouldProcess,
    ConfirmImpact = 'High'
  )]
  param(
     [Parameter(Mandatory)]     
     [string]$path
  )
  if ($PSCmdlet.ShouldProcess($path)) {
    Remove-Item $path
  }
}

Remove-File C:\temp\notes.txt

return

function Get-Self{
  Param($Self)
  return $Self
}

Get-Help Get-Self

return
function Write-Update{
  param(
    [Parameter(Mandatory)]
    [ValidateLength(1, 100)]
    [string] $Message,

    [Parameter(Mandatory)]
    [ValidateSet('Low', 'Medium', 'High')]
    [string] $Severity,

    [Parameter(Mandatory)]
    [ValidateScript( { Test-Path $_ } )]
    [string] $Path
  )
  Write-Host "$Severity - $Message - $Path"
}

Write-Update "xyz" 'Low' C:\temp

return
function Select-Sum {
  begin { $sum = 0 }
  process { $sum += $_ }
  end {return $sum}
}

Get-Process | % WorkingSet | Select-Sum

return 
function Save-Users{
  begin { Write-Host "Opening DB connection" -ForegroundColor Yellow }

  process { Write-Host "Saving $_" }
  
  end{ Write-Host 'Closing connection' -ForegroundColor Green }
}

1..5 | Save-Users


return 
function Select-Sum([int[]]$Xs) {
  foreach($x in $Xs){
    $sum += $x
  }
  return $sum
}

## Wrong answer
$s1 = Get-Process | % WorkingSet | Select-Sum

## Slightly ugly
$sets = Get-Process | % WorkingSet
$s2 = Select-Sum $sets

return 

$x = 5
$y = 'a'
[System.Math]::Pow($x,$y)



return

$i = 0
while ($true){
  Write-Host $i
  $i++
  if($i -gt 3){
    break
  }
}
Write-Host 'Done'

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
