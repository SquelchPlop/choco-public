$ErrorActionPreference = "Stop"; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binDir = "$toolsDir\..\bin"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $binDir
  fileType       = "EXE"
  url            = "https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_12130-20272.exe"
  checksum       = "E94CA0062ED610CDED2399E22AD2CAB6377989CB0744CEED1CF3500C9810C45D"
  checksumType   = "sha256"
}

Install-ChocolateyZipPackage @packageArgs