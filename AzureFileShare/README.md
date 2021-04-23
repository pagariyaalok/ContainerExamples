# ContainerExamples

This example creats windows container from mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019 and call Powershell script using entrypoint to configure SYMLINK

This is tested with Azure App Service.

First define application settings for WebApp to store credentials to connect to Azure file share . They will be used in startup script.
For example : 
AZURE_FILE_SHARE_PWS
AZURE_FILE_SHARE_USER  (e.g. storageaccountname)

The entry point calls start-iis-environment.ps1, which configures the SYMLINK, pointing to Azure File Share.
