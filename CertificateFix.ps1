# Does your AD account have permission to create certificates? Try New-DbaComputerCertificate
New-DbaComputerCertificate -ComputerName RaysVM2 -Dns RaysVM2.RaysDomainForrest.io, RaysVM2

# If you don't, you can create a Certificate Signing Request that'll work
New-DbaComputerCertificateSigningRequest -ComputerName RaysVM2 -Dns RaysVM2.RaysDomainForrest.io, RaysVM2

# Unsure if any candidates already exist? Check certs that can be used for encryption        
Get-DbaComputerCertificate -ComputerName RaysVM2

# Already have a cert? Use it!
Set-DbaNetworkCertificate -SqlInstance RaysVM2 -Thumbprint Cert:\LocalMachine\My\0685471F16EE1B756994C6FB951C30EB7A0685C0

# Or get a visual and use some piping        
Get-DbaComputerCertificate | Out-GridView -PassThru | Set-DbaNetworkCertificate -SqlInstance sql1

# Once you've got your certs setup, Force Network Encryption        
Enable-DbaForceNetworkEncryption -SqlInstance RaysVM2

Get-DbaProcess -SqlInstance RaysVM2 |
Where EncryptOption -ne $null |
Select Login, Program, ClientNetAddress, NetTransport, EncryptOption



Test-Connection  10.1.0.5
nslookup.exe 20.42.95.64



# from the book
$splatCert = @{
ComputerName = "RaysVM2" `
Dns = "RaysVM2.RaysDomainForrest.io, RaysVM2"
}

New-DbaComputerCertificate $splatCert


Get-Childitem Cert:\LocalMachine\My