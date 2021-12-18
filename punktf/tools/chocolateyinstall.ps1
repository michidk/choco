$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = 'punktf'
    softwareName  = 'punktf*'
    file64        = "$toolsDir\punktf-x86_64-pc-windows-msvc.zip"
    unzipLocation = $toolsDir
}
Install-ChocolateyZipPackage @packageArgs

# Don't need zip file anymore
Remove-Item $toolsDir\*.zip -ea 0 -force
