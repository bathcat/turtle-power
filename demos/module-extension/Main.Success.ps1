using module './Build-User.psm1'

[User]$admin = Build-User -ID 12 -Login 'JBloggs'

$admin
