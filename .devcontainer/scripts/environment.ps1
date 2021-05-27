Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module oh-my-posh -Scope AllUsers -Force
Import-Module oh-my-posh

Install-Module -Name Pester -Force -SkipPublisherCheck
Import-Module Pester -PassThru
