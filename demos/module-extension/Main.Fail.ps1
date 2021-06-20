using module './Build-User.ps1'

[User]$admin = Build-User -ID 12 -Login 'JBloggs'

$admin
