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
