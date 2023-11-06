# The computername we will be testing
Set-DbcConfig -Name app.computername -Value $sql0,$SQl1
# The Instances we want to test
Set-DbcConfig -Name app.sqlinstance -Value $sql0,$SQl1
# The database owner we expect
Set-DbcConfig -Name policy.validdbowner.name -Value 'THEBEARD\\EnterpriseAdmin'
# the database owner we do NOT expect
Set-DbcConfig -Name policy.invaliddbowner.name -Value 'sa'
# Should backups be compressed by default?
Set-DbcConfig -Name policy.backup.defaultbackupcompression -Value $true
# Do we allow DAC connections?
Set-DbcConfig -Name policy.dacallowed -Value $true
# What recovery model should we have?
Set-DbcConfig -Name policy.recoverymodel.type -value FULL
# What should ourt database growth type be?
Set-DbcConfig -Name policy.database.filegrowthtype -Value kb
