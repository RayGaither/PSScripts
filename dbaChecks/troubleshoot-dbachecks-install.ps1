Get-Module PowerShellGet, PackageManagement -ListAvailable


Install-Module PowerShellGet -Force -AllowClobber

Get-PSRepository
Unable to find module repositories.

#then try
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 
Install-Module PowerShellGet -RequiredVersion 2.2.4 -SkipPublisherCheck

Register-PSRepository -Default #worked
Get-PSRepository #worked but untrusted

#try
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted #says it failed but it is now trusted

Get-DbaFeature -ComputerName EXPSQL25 # works

#try to get dbachecks working now

# is it there already
Find-Module -Name dbccheck
 Find-Module -Name Pester #failed says to Get-PSRepository to see what is avaliable

Get-PSRepository #only powershell is there

#try to install pester
Install-Module Pester -SkipPublisherCheck -Force -RequiredVersion 4.10.1 # worked
Find-Module -Name Pester # it is there

#Try framework
Install-Module PSFramework -RequiredVersion 1.1.59  #worked

#try to install dbachecks
Install-Module dbachecks #worked
# try to update
Update-Module dbachecks #failed with - Get-PSGalleryApiAvailability : PowerShell Gallery is currently unavailable.
# ms says that it depends on security protocol and to run following
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Update-Module dbachecks #still broken



#which security protocal am i using
[Net.ServicePointManager]::SecurityProtocol #results = Tls12

#skiping update
Find-Module -Name dbachecks # results = version 2.0.18

#can we update dbatools?
Update-Module dbatools #nope gallery unavaliable, but wait, it is installing now -WTF???

Find-Module -Name dbatools #took long and i killed it

find-dbacommand