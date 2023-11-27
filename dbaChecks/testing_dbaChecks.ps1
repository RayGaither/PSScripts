Get-DbaFeature -ComputerName localhost

 
Test-DbaConnection -SqlInstance $server -Credential 'raysvm2\rgaitheraz'



$server = Connect-DbaInstance `
    -SqlInstance 'raysvm2' `
    -Database 'AdventureWorks2022' `
    -TrustServerCertificate;
# add credentials using -SqlCredential

2uWC5Qh4b3AY4Z!


# get help is your friend
Get-Help Get-DbaSpConfigure

# get examples  <<<<<<<<<<<<<<<<<<<<
Get-Help Get-DbaSpConfigure -Examples

Get-DbaSpConfigure -SqlInstance $server


