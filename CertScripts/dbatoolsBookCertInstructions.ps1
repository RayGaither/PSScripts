
#  To encrypt connections, you must perform the following steps:
#   Obtain and install an appropriate certificate.
#   Set the SQL Server to use the certificate.
#   Enable and, preferably, force encrypted connections.




#   Obtain and install an appropriate certificate.
$splatCert = @{
ComputerName = "RaysVM2"
Dns = "RaysVM2.raysvm2.internal.cloudapp.net, RaysVM2"
}

New-DbaComputerCertificate $splatCert

New-DbaComputerCertificate -ComputerName = "RaysVM2" -Dns = "RaysVM2.lencivbtuu4epm0p5ct0exm5oe.bx.internal.cloudapp.net, RaysVM2"
New-DbaComputerCertificate -ComputerName RaysVM2 -Dns RaysVM2.raysvm2.internal.cloudapp.net, RaysVM2


Get-DbaComputerCertificate -ComputerName RaysVM2

Test-DbaComputerCertificateExpiration

Get-DbaComputerCertificate



$splatSetCertificate = @{
SqlInstance = "RaysVM2"
Thumbprint = "A9E58FE38667FDFA7D8F956CE24268F26AD6FC6E"
}
Set-DbaNetworkCertificate @splatSetCertificate