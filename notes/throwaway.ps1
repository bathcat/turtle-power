class User{
    [int]$id
    [string]$name
}
$admin = [User]@{
  id=0
  name='administrator'
  handle='jerry'
}
$admin
