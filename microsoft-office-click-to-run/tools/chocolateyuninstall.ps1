$ErrorActionPreference = "Stop"; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$pp = Get-PackageParameters

if (!$pp["configuration-xml-file"]) {
  Write-Host "No configuration-xml-file specified, trying to remove using the default."
  $pp["configuration-xml-file"] = "$toolsDir\configuration_uninstall.xml"
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = "microsoft.*(365|office)"
  file           = "$env:ChocolateyInstall\lib\microsoft-office-deployment-tool\bin\setup.exe"
  fileType       = "EXE"
  silentArgs     = "/configure " + $pp["configuration-xml-file"]
  validExitCodes = @(
    0, # success
    3010, # success, restart required
    2147781575, # pending restart required
    2147205120  # pending restart required for setup update
  )
}

Uninstall-ChocolateyPackage @packageArgs