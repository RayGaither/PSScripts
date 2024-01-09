Get-ExecutionPolicy



#Trusting the PowerShell Gallery
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

#install dbatools
Install-Module dbatools


$env:PSModulePath -split ';'

<#
C:\Users\RayGaither\OneDrive - Covenant Technology Partners\Documents\PowerShell\Modules;
C:\Program Files\PowerShell\Modules;
c:\program files\powershell\7\Modules;
C:\Program Files\WindowsPowerShell\Modules;
C:\Windows\system32\WindowsPowerShell\v1.0\Modules;
c:\Users\RayGaither\.vscode\extensions\ms-vscode.powershell-2023.8.0\modules
#>

# Install dbaChecks
Install-Module Pester -SkipPublisherCheck -Force -RequiredVersion 4.10.0
Import-Module Pester -Force -RequiredVersion 4.10.0
Install-Module -Name PSFramework

Install-Module -Name dbachecks -AllowPrerelease
# 1/9/2024 version 2.0.18 installed

Start-DbcPowerBi