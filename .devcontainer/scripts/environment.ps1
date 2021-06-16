Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module oh-my-posh -Scope AllUsers -Force
Import-Module oh-my-posh

Install-Module -Name Pester -Force -SkipPublisherCheck
Import-Module Pester -PassThru

Install-Module PSake -Force -SkipPublisherCheck
Import-Module PSake -PassThru

Install-Module -Name PSScriptAnalyzer -Force -SkipPublisherCheck
Import-Module PSScriptAnalyzer -PassThru
