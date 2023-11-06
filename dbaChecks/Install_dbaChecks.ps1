Install-Module Pester -SkipPublisherCheck -Force -RequiredVersion 4.10.0

Import-Module Pester -Force -RequiredVersion 4.10.0

Install-Module -Name dbachecks -RequiredVersion 2.0.18



To run from cmd line
Invoke-DbcCheck -SqlInstance sqlprod01 -Checks SuspectPage, LastBackup

Invoke-DbcCheck -SqlInstance sqlprod01 -Checks SuspectPage, LastBackup
