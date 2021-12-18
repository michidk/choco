$ErrorActionPreference = 'Stop';

$packageName = 'just'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64       = 'https://github.com/casey/just/releases/download/0.10.5/just-0.10.5-x86_64-pc-windows-msvc.zip'
$bin         = $toolsDir + '\just.exe'

$packageArgs = @{
    packageName   = $packageName
    url64bit      = $url64

    softwareName  = 'just*'

    unzipLocation = $toolsDir

    checksum64    = 'EF5421ED3B3663F58A804D1F3D8F865318FC1CB89E87CC78B28B00DFD1F41A6B'
    checksumType64= 'sha256'

    validExitCodes= @(0)
}
Install-ChocolateyZipPackage @packageArgs
