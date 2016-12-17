# code from http://stackoverflow.com/questions/5171117/import-pfx-file-into-particular-certificate-store-from-command-line
# import the Aristocrat-provided pfx file into the local machine Trusted Root store

$HostName = "localhost"
$CertificatePassword = ''
$certPath = 'C:\certutil\aristocrat.serviceframework.comm.pfx'


Write-Host 'Import pfx certificate' $certPath
$certRootStore = “LocalMachine”
$certStore = "Root"
$pfx = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
$pfx.Import($certPath,$CertificatePassword,"Exportable,PersistKeySet") 
$store = New-Object System.Security.Cryptography.X509Certificates.X509Store($certStore,$certRootStore) 
$store.Open('ReadWrite')
$store.Add($pfx) 
$store.Close() 
$certThumbprint = $pfx.Thumbprint