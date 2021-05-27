@{

  Severity = @('Error','Warning')


  Rules = @{
    'PSAvoidUsingCmdletAliases' = @{
        'allowlist' = @('%', '?')
    }
  }
}
