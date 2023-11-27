

# The computername we will be testing
Set-DbcConfig -Name app.computername -Value Raysvm2
# The Instances we want to test
Set-DbcConfig -Name app.sqlinstance -Value RaysVM2
# The database owner we expect
Set-DbcConfig -Name policy.validdbowner.name -Value 'sa'
# the database owner we do NOT expect
Set-DbcConfig -Name policy.invaliddbowner.name -Value 'rgaither'
# Should backups be compressed by default?
Set-DbcConfig -Name policy.backup.defaultbackupcompression -Value $true
# Do we allow DAC connections?
Set-DbcConfig -Name policy.dacallowed -Value $true
# What recovery model should we have?
Set-DbcConfig -Name policy.recoverymodel.type -value FULL
# What should ourt database growth type be?
Set-DbcConfig -Name policy.database.filegrowthtype -Value kb
# What authentication scheme are we expecting?
Set-DbcConfig -Name policy.connection.authscheme -Value 'KERBEROS'
# Which Agent Operator should be defined?
Set-DbcConfig -Name agent.dbaoperatorname -Value 'The DBA Team'
# Which Agent Operator email should be defined?
Set-DbcConfig -Name agent.dbaoperatoremail -Value 'rgaither@mailctp.com'
# Which failsafe operator shoudl be defined?
Set-DbcConfig -Name agent.failsafeoperator -Value 'The DBA Team'
## Set the database mail profile name
Set-DbcConfig -Name agent.databasemailprofile -Value 'DbaTeam'
# Where is the whoisactive stored procedure?
Set-DbcConfig -Name policy.whoisactive.database -Value master
# What is the maximum time since I took a Full backup?
Set-DbcConfig -Name policy.backup.fullmaxdays -Value 7
# What is the maximum time since I took a DIFF backup (in hours) ?
Set-DbcConfig -Name policy.backup.diffmaxhours -Value 26
# What is the maximum time since I took a log backup (in minutes)?
Set-DbcConfig -Name policy.backup.logmaxminutes -Value 30
# What is my domain name?
Set-DbcConfig -Name domain.name -Value 'RaysDomainForrest.io'
# Where is my Ola database?
Set-DbcConfig -Name policy.ola.database -Value master
# Which database should not be checked for recovery model
Set-DbcConfig -Name policy.recoverymodel.excludedb -Value 'master','msdb','tempdb'
# Should I skip the check for temp files on c?
Set-DbcConfig -Name skip.tempdbfilesonc -Value $true
# Should I skip the check for temp files count?
Set-DbcConfig -Name skip.tempdbfilecount -Value $true
# Which Checks should be excluded?
Set-DbcConfig -Name command.invokedbccheck.excludecheck -Value LogShipping,ExtendedEvent, PseudoSimple,SPN, TestLastBackupVerifyOnly,IdentityUsage,SaRenamed
# How many months before a build is unsupported do I want to fail the test?
Set-DbcConfig -Name policy.build.warningwindow -Value 6

Set-DbcConfig -Name skip.backup.secondaries -Value $true
Set-DbcConfig -Name skip.hadr.listener.tcpport -Value $true
Set-DbcConfig -Name skip.hadr.replica.tcpport -Value $true



# take a peek at the config 
# get-DbcConfig | Out-GridView

# export to json
Export-DbcConfig -Force -Path G:\repos\PSScripts\dbaChecks\Production.Json

Import-DbcConfig -Path G:\repos\PSScripts\dbaChecks\Production.Json
Invoke-DbcCheck -Show Summary -ExcludeCheck policy.cluster.hostrecordttl -PassThru | Update-DbcPowerBiDataSource

-Show Summary -path G:\PowerBI\ -PassThru | Update-DbcPowerBiDataSource

Invoke-DbcCheck -SqlInstance sql2017 -Checks SuspectPage, LastBackup -Show Summary -PassThru | Update-DbcPowerBiDataSource

