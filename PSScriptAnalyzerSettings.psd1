# Use the PowerShell extension setting `powershell.scriptAnalysis.settingsPath` to get the current workspace
# to use this PSScriptAnalyzerSettings.psd1 file to configure code analysis in Visual Studio Code.
# This setting is configured in the workspace's `.vscode\settings.json`.
#
# For more information on PSScriptAnalyzer settings see:
# https://github.com/PowerShell/PSScriptAnalyzer/blob/master/README.md#settings-support-in-scriptanalyzer
#
# You can see the predefined PSScriptAnalyzer settings here:
# https://github.com/PowerShell/PSScriptAnalyzer/tree/master/Engine/Settings
@{
    ExcludeRules = @('PSAvoidUsingWriteHost')

    # You can use rule configuration to configure rules that support it:
    Rules = @{
       PSAvoidUsingCmdletAliases = @{
           Whitelist = @("%","?")
       }
       PSUseCorrectCasing = @{
           Enable = $true
       }
       PSUseConsistentIndentation = @{
           Enable = $true
       }
    }
}
