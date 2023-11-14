Get-ExecutionPolicy

 Find-Module -Name dbccheck
 Find-Module -Name Pester

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true};

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 
Install-Module PowerShellGet -RequiredVersion 2.2.4 -SkipPublisherCheck

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
Register-PSRepository -Default -Verbose
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

Register-PSRepository -Name PSGalleryPreview -SourceLocation https://www.Preview.PowerShellGallery.Com/api/v2 
Find-Module DSC* -Repository PSGalleryPreview
Install-Module DSCTestModule -Repository PSGalleryPreview -Verbose


register-psrepository -Default
get-psrepository

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted



Install-Module Pester -SkipPublisherCheck -Force -RequiredVersion 4.10.0

Import-Module Pester -Force -RequiredVersion 4.10.0

Install-Module -Name dbachecks -RequiredVersion 2.0.18



# To run from cmd line
$instance = 'EXPSQL25'
Invoke-DbcCheck -SqlInstance $instance -Checks SuspectPage, LastBackup

Invoke-DbcCheck -SqlInstance $instance -Checks SuspectPage, LastBackup
