
$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

[regex] $regex = '(.*)[\.](.*)'
$strVer = $regex.Replace($env:chocolateyPackageVersion, '$1-$2', 1)

$packageArgs = @{
  packageName    = 'notion-repackaged'
  fileType       = 'EXE'
  file64         = "$toolsDir\Notion-Enhanced-Setup-$strVer.exe"
  softwareName   = 'notion-repackaged*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
Remove-Item $toolsDir\*.exe -ea 0 -force

$packageName = $packageArgs.packageName
$installLocation = Get-AppInstallLocation "$packageName*"
if (!$installLocation)  { Write-Warning "Can't find $packageName install location"; return }
Write-Host "$packageName installed to '$installLocation'"

Register-Application "$installLocation\$packageName.exe"
Write-Host "$packageName registered as $packageName"
