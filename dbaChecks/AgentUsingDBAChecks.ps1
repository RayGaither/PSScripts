$server = Connect-DbaInstance `
    -SqlInstance 'raysvm2' `
    -Database 'AdventureWorks2022' `
    -TrustServerCertificate `
    -SqlCredential 'RAYSDOMAINFORRE\RaysDomainUser';

clear-host


Find-Command | Out-GridView

Find-Command -tag Agent

Get-DbcCheck | Out-GridView


Get-Help Get-DbaSpConfigure -Examples
Get-Help Get-DbaSpConfigure - Full
Get-Help New-DbaDbMailAccount -Examples

$SQLInstance = $server.Name

Set-DbcConfig -name app.sqlinstance -value $SQLInstance
Get-DbcConfig | Out-GridView   

$MailServer = "mailctp-com.mail.protection.outlook.com"
$MailAccount = "DBMail"
$MailProfile = "DBMail"
$EmailAdress = "NoReply@gmail.com"
$OperatorName = "DBA"
$AlertEmail = "rgaither@mailCTP.com"


Set-DbcConfig -Name agent.DatabaseMailProfile -Value $MailProfile
Set-DbcConfig -Name agent.dbaoperatoremail -Value $AlertEmail
Set-DbcConfig -Name agent.dbaoperatorname -Value $OperatorName
Set-DbcConfig -Name agent.failsafeoperator -Value $OperatorName


Get-DbcConfig | Out-GridView   
$server = Connect-DbaInstance `
    -SqlInstance 'raysvm2' `
    -Database 'AdventureWorks2022' `
    -TrustServerCertificate;



# Enable database mail
if( (Get-DbaSpConfigure -SqlInstance $SQLInstance -Name 'Database Mail XPs').RunValue -eq 0) {
    Set-DbaSpConfigure -SqlInstance $SQLInstance -Name 'Database Mail XPs'.RunValue 1
}

# create mail account definde above
if ((Get-DbaDbMailAccount -SqlInstance $SQLInstance -Account $Account).count -ne 1) {
    New-DbaDbMailAccount -SqlInstance $SQLInstance -Name $MailAccount -EmailAddress $EmailAdress -MailServer $MailServer # -MailProfile $MailProfile


$server.JobServer.AgentMailType = 'DatabaseMail'
$server.JobServer.DatabaseMailProfile = $MailProfile
$server.JobServer.Alter()

}

# Get-Help New-DbaAgentOperator -Examples
# create operator
If ((Get-DbaAgentOperator -SqlInstance $SQLInstance -Operator $OperatorName).count -ne 1) {
    New-DbaAgentOperator -SqlInstance $SQLInstance -Operator $MailProfile    #-Name $OperatorName -EmailAddress $AlertEmail -Enabled $true
}

# create failsafe operator
$AgentServer = Set-DbaAgentServer -SqlInstance $SQLInstance -AgentMailType "DatabaseMail" -DatabaseMailProfile $MailProfile 
$AgentServer.alertsystem.failsafeoperator = $Operator
$AgentServer.alertsystem.notificationmethod = "NotifyEmail"
$AgentServer.alertsystem.alter()

# create alert


# from github.com/dataplat/dbachecks
Invoke-DbcCheck -Checks SuspectPage, LastBackup

Invoke-DbcCheck -Check Backup -SqlInstance raysvm2
Invoke-DbcCheck -Check RecoveryModel -SqlInstance raysvm2

$sqlinstance = Get-DbaRegisteredServer -SqlInstance raysvm2 -Group Express
Invoke-DbcCheck -Check Backup -SqlInstance $sqlinstance

Invoke-DbcCheck -Check Storage -ComputerName raysvm2 #, server2



Invoke-DbcCheck -Check Database -ExcludeCheck Backup -SqlInstance sql2016 -SqlCredential (Get-Credential sqladmin)




Invoke-DbcCheck -SqlInstance raysvm2 
# -Checks SuspectPage, LastBackup -Show Summary -path G:\PowerBI\ -PassThru | Update-DbcPowerBiDataSource 

# Launch Power BI then hit refresh
Start-DbcPowerBi