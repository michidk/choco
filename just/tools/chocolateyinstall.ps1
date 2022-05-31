$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = 'just'
    file64        = "$toolsDir\just-$env:chocolateyPackageVersion-x86_64-pc-windows-msvc.zip"
    unzipLocation = $toolsDir
}
Install-ChocolateyZipPackage @packageArgs

# Don't need tar file anymore
Remove-Item $toolsDir\*.zip -ea 0 -force
