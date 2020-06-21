$ErrorActionPreference = "Stop"; # stop on all errors

$pp = Get-PackageParameters

if (!$pp["configuration-xml-file"]) {
  throw "Package needs parameter 'configuration-xml-file' to install, that must be provided in params or in prompt." 
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

Install-ChocolateyPackage @packageArgs