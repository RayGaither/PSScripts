
# Install-Module -Name dbachecks
# Install-Module Pester -SkipPublisherCheck -Force -RequiredVersion 4.10.0
# Install-Module -Name PSFramework
# Import-Module Pester -Force -RequiredVersion 4.10.0


Get-DbcConfig

Invoke-DbcCheck bambam

Invoke-DbcCheck -SqlInstance sqlprod01 -Checks SuspectPage, LastBackup

####################### try it ##############################################

# Set the servers you'll be working with
Set-DbcConfig -Name app.sqlinstance -Value sql2016, sql2017, sql2008, sql2008\express
Set-DbcConfig -Name app.computername -Value sql2016, sql2017, sql2008

# Look at the current configs
Get-DbcConfig

# Invoke a few tests
Invoke-DbcCheck -Checks SuspectPage, LastBackup