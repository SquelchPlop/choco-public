$ErrorActionPreference = "Stop"; # stop on all errors

$packageName = (Get-AppxProvisionedPackage -Online |  Where-Object{ ($_.DisplayName -eq "SpotifyAB.SpotifyMusic") }).PackageName

if($packageName){
    Remove-AppxProvisionedPackage -PackageName $packageName -Online -AllUsers
}