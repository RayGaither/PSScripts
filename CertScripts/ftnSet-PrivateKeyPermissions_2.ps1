#  this fer works

function Set-PrivateKeyPermissions_2 {
    param(
        [Parameter(Mandatory=$true)]
        [string]$thumbprint,
        [Parameter(Mandatory=$true)]
        [string]$account
    )

    #Open Certificate store and locate certificate based on provided thumbprint
    $store = New-Object System.Security.Cryptography.X509Certificates.X509Store("My","LocalMachine")
    $store.Open("ReadWrite")
    $cert = $store.Certificates | where {$_.Thumbprint -eq $thumbprint}

    if ($cert.PrivateKey -Eq $null) {
        # Probably using Key Storage Provider rather than crypto service provider
        $rsaCert = [System.Security.Cryptography.X509Certificates.RSACertificateExtensions]::GetRSAPrivateKey($cert)
        if ($rsaCert -Eq $null) {
            throw "Private key on certificate $($cert.Subject) not available"
        }

        $fileName = $rsaCert.key.UniqueName
        $path = "$env:ALLUSERSPROFILE\Microsoft\Crypto\Keys\$fileName"
        $permissions = Get-Acl -Path $fileName       #-Path $path

        $access_rule = New-Object System.Security.AccessControl.FileSystemAccessRule($account, "FullControl", "Allow")
        $permissions.AddAccessRule($access_rule)
        # Set-Acl -Path $path -AclObject $permissions
        Set-Acl -Path $fileName -AclObject $permissions
    } else {
        #Create new CSP object based on existing certificate provider and key name
        $csp = New-Object System.Security.Cryptography.CspParameters($cert.PrivateKey.CspKeyContainerInfo.ProviderType, $cert.PrivateKey.CspKeyContainerInfo.ProviderName, $cert.PrivateKey.CspKeyContainerInfo.KeyContainerName)

        # Set flags and key security based on existing cert
        $csp.Flags = "UseExistingKey","UseMachineKeyStore"
        $csp.CryptoKeySecurity = $cert.PrivateKey.CspKeyContainerInfo.CryptoKeySecurity
        $csp.KeyNumber = $cert.PrivateKey.CspKeyContainerInfo.KeyNumber

        # Create new access rule - could use parameters for permissions, but I only needed GenericRead
        $access = New-Object System.Security.AccessControl.CryptoKeyAccessRule($account,"GenericRead","Allow")
        # Add access rule to CSP object
        $csp.CryptoKeySecurity.AddAccessRule($access)

        #Create new CryptoServiceProvider object which updates Key with CSP information created/modified above
        $rsa2 = New-Object System.Security.Cryptography.RSACryptoServiceProvider($csp)
    }

    #Close certificate store
    $store.Close()
}



# call
# Set-PrivateKeyPermissions_2 -thumbprint 'A9E58FE38667FDFA7D8F956CE24268F26AD6FC6E' -account "NT AUTHORITY\NETWORK SERVICE"