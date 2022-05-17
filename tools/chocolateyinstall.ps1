$ErrorActionPreference = 'Stop';

$packageName = 'just'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64       = 'https://github.com/casey/just/releases/download/1.1.3/just-1.1.3-x86_64-pc-windows-msvc.zip'
$bin         = $toolsDir + '\just.exe'

$packageArgs = @{
    packageName   = $packageName
    url64bit      = $url64

    unzipLocation = $toolsDir

    checksum64    = '00B0F3F158DA01BCFC3F712722D917F8084C9BFAA693D71F64F4E67F957FB2CB'
    checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
