function setCertificatePermission {
    param($accountName, $certificate)
    if([string]::IsNullOrEmpty($certificate.PrivateKey))
    {
        $rsaCert = [System.Security.Cryptography.X509Certificates.RSACertificateExtensions]::GetRSAPrivateKey($certificate)
        $fileName = $rsaCert.key.UniqueName
        $path = "$env:ALLUSERSPROFILE\Microsoft\Crypto\Keys\$fileName"
        $permissions = Get-Acl -Path $path
        $access_rule = New-Object System.Security.AccessControl.FileSystemAccessRule($accountName, 'FullControl', 'None', 'None', 'Allow')
        $permissions.AddAccessRule($access_rule)
        Set-Acl -Path $path -AclObject $permissions
    } else{
            $user = New-Object System.Security.Principal.NTAccount($accountName)
            $accessRule = New-Object System.Security.AccessControl.CryptoKeyAccessRule($user, 'FullControl', 'Allow')
            $store = New-Object System.Security.Cryptography.X509Certificates.X509Store("My","LocalMachine")
            $store.Open("ReadWrite")
            $rwCert = $store.Certificates | where {$_.Thumbprint -eq $certificate.Thumbprint}
            $csp = New-Object System.Security.Cryptography.CspParameters($rwCert.PrivateKey.CspKeyContainerInfo.ProviderType, $rwCert.PrivateKey.CspKeyContainerInfo.ProviderName, $rwCert.PrivateKey.CspKeyContainerInfo.KeyContainerName)
            $csp.Flags = "UseExistingKey","UseMachineKeyStore"
            $csp.CryptoKeySecurity = $rwCert.PrivateKey.CspKeyContainerInfo.CryptoKeySecurity
            $csp.KeyNumber = $rwCert.PrivateKey.CspKeyContainerInfo.KeyNumber
            $csp.CryptoKeySecurity.AddAccessRule($AccessRule)
            $rsa2 = New-Object System.Security.Cryptography.RSACryptoServiceProvider($csp)
            $store.close()
        }
}



<# call

.\AddUserToCertificate.ps1 -userName rgaitherAZ -permission read -certStoreLocation \LocalMachine\My -certThumbprint 91072853CF6566D8F3FC0CBE96B38B1824A40EBD

#>