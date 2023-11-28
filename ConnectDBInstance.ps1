
$sqlcred = 'raysvm2\rgaitheraz'


$server = Connect-DbaInstance -SqlInstance "raysvm2" -Database AdventureWorks2022 -SqlCredential $sqlcred -TrustServerCertificate

Invoke-DbaQuery -SqlInstance $server -Query "select 1 as test"
