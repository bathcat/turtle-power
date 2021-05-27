@{
  IncludeRules=@(
    'PSAvoidUsingPlainTextForPassword',
    'PSAvoidUsingConvertToSecureStringWithPlainText'
  )
  'Rules' = @{
    'PSAvoidUsingCmdletAliases' = @{
        'allowlist' = @('%', '?')
    }
  }
}
