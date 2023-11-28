<#

As dbatools suggested, set DbaToolsConfig to use the old settings

#>




Get-DbatoolsConfig -FullName sql.connection.trustcert
Get-DbatoolsConfig -FullName sql.connection.encrypt


Set-DbatoolsConfig -FullName sql.connection.trustcert -Value $true -Register
Set-DbatoolsConfig -FullName sql.connection.encrypt -Value $false -Register 

Get-DbcConfig | Out-GridView 

Set-DbcConfig -Name skip.cluster.netclusterinterface -Value $true

Get-Help Get-DbaSpConfigure -Examples
Get-Help Get-DbaSpConfigure - Full
Get-Help Invoke-DbcCheck -Examples
Get-Help  Invoke-DbcCheck -Full

Get-Invoke-DbcCheck 

# export to json
Export-DbcConfig -force -Path \\RaysVM2\G$\repos\PSScripts\dbaChecks\Prod.Json

Invoke-DbcCheck -SqlInstance raysvm2 -ConfigFile \\RaysVM2\G$\repos\PSScripts\dbaChecks\Prod.Json


Invoke-DbcCheck -SqlInstance raysvm2 -AllChecks -ConfigFile \\RaysVM2\G$\repos\PSScripts\dbaChecks\Prod.Json
Update-DbcPowerBiDataSource