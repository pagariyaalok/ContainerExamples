
$ErrorActionPreference = "Stop"

# Azure file share crdentials
$userPassword = "$env:AZURE_FILE_SHARE_PWS"
$userName = "AZURE\$env:AZURE_FILE_SHARE_USER"
[securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force
[pscredential]$cred = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)

# File Share 1 (Replace the share name with yours)
New-SmbGlobalMapping -RemotePath \\ansalemostorage.file.core.windows.net\ansalemo-fileshare -Credential $cred
CMD /C MKLINK /D  C:\inetpub\wwwroot\remote1 \\ansalemostorage.file.core.windows.net\ansalemo-fileshare

# Monitor w3svc - Use the AppService version of ServiceMonitor if exist.
if (Test-Path -Path 'C:\AppService\Util\ServiceMonitor.exe' -PathType Leaf) 
{
    & C:\AppService\Util\ServiceMonitor.exe w3svc
}
else
{
    & C:\ServiceMonitor.exe w3svc
}