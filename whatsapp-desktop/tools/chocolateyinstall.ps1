$ErrorActionPreference = "Stop"; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binDir = [IO.Path]::GetFullPath((Join-Path $toolsDir "..\bin"))

Add-AppxProvisionedPackage -Online -PackagePath "$binDir\5319275A.WhatsAppDesktop_2.2025.7.0_x64__cv1g1gvanyjgm.appx" -SkipLicense