$ErrorActionPreference = 'Stop';

$packageName = 'just'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64       = 'https://github.com/casey/just/releases/download/0.10.7/just-0.10.7-x86_64-pc-windows-msvc.zip'
$bin         = $toolsDir + '\just.exe'

$packageArgs = @{
    packageName   = $packageName
    url64bit      = $url64

    unzipLocation = $toolsDir

    checksum64    = '47C353F7925EFE6CE989362C249ECD6711EC0D2624B5ACDE2FF81C260C0C3994'
    checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
