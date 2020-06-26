$ErrorActionPreference = "Stop"; # stop on all errors
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  fileType        = "EXE"
  url             = "https://update-software.sonos.com/software/pc/dcr/SonosDesktopController112.exe"
  checksum        = "0662D22698D1B798E3A817960B45BF614160518EF59C958EFA2272CF4583611C"
  checksumType    = "sha256"
  silentArgs     = '/s /v"/qn"'
  validExitCodes	= @(0, 3010)
  softwareName    = "Sonos Controller"
}

Install-ChocolateyPackage @packageArgs