$ErrorActionPreference = "Stop"; # stop on all errors

$packageName = (Get-AppxProvisionedPackage -Online |  Where-Object{ ($_.DisplayName -eq "5319275A.WhatsAppDesktop") }).PackageName

if($packageName){
    Remove-AppxProvisionedPackage -PackageName $packageName -Online -AllUsers
}