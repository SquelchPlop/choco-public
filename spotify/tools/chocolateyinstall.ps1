$ErrorActionPreference = "Stop"; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binDir = [IO.Path]::GetFullPath((Join-Path $toolsDir "..\bin"))

Add-AppxProvisionedPackage -Online -PackagePath "$binDir\SpotifyAB.SpotifyMusic_1.135.458.0_x86__zpdnekdrzrea0.appx" -SkipLicense