Get-ExecutionPolicy

Get-PSRepository
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Find-Module dbatools
Install-Module dbatools
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



Install-Module Pester -SkipPublisherCheck -Force -RequiredVersion 4.10.1

Find-Module PSFramework

Install-Module PSFramework -RequiredVersion 1.1.59

Install-Module -Name dbachecks -RequiredVersion 2.0.18

Update-Module dbachecks
Update-Module dbatools


Find-DbaCommand | Out-GridView


