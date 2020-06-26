$ErrorActionPreference = "Stop"; # stop on all errors

$pp = Get-PackageParameters

if (!$pp["configuration-xml-file"]) {
  throw "Package needs parameter 'configuration-xml-file' to install, that must be provided in params or in prompt." 
}

if (-not(Test-Path($pp["configuration-xml-file"]))){
  throw "The configuration XML file provided couldn't be found.  Is the path correct?"
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

if ($pp["kms"]) {
  switch([int]$pp["kms"]){
    #Enables KMS activation.  Note - you must have a licensed KMS server available to use this.  VL is only supported up to Office 2019 - see https://docs.microsoft.com/en-us/deployoffice/vlactivation/activate-office-by-using-kms
    #The keys below are GVLKs - https://docs.microsoft.com/en-us/deployoffice/vlactivation/gvlks. 
    2016{
      foreach ($file in (Get-Item "$env:ProgramFiles\Microsoft Office\root\Licenses16\proplusvl_kms*.xrm-ms").FullName){
        & cscript "$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs" /inslic:"$file"
      }
      & cscript "$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs" /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99
    }
    2019{
      foreach ($file in (Get-Item "$env:ProgramFiles\Microsoft Office\root\Licenses16\ProPlus2019VL*.xrm-ms").FullName){
        & cscript "$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs" /inslic:"$file"
      }
      & cscript "$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs" /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP
    }
  }
}