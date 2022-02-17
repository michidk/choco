$ErrorActionPreference = 'Stop';

$packageName = 'just'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64       = 'https://github.com/casey/just/releases/download/0.11.2/just-0.11.2-x86_64-pc-windows-msvc.zip'
$bin         = $toolsDir + '\just.exe'

$packageArgs = @{
    packageName   = $packageName
    url64bit      = $url64

    unzipLocation = $toolsDir

    checksum64    = '8293CC38EAB2BA5570A1E1D91699C1D8441DCCBACF04EBC5B979D14E917E38CE'
    checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
