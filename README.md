# Chocolatey just package

[![Chocolatey](https://img.shields.io/chocolatey/v/just?include_prereleases)](https://community.chocolatey.org/packages/just)

## Setup

[just](https://community.chocolatey.org/packages/just) can be installed using [Chocolatey](https://chocolatey.org/) using the following command:

```bash
choco install -y just
```

## Release a new version

1. Change url and checksum (calculated with PowerShell: `Get-FileHash`) in `tools/chocolateyinstall.ps1`
2. Adjust version number in `just.nuspec`
3. Run `choco pack` in the current directory
4. Run `choco push .\{file}.nupkg --source https://push.chocolatey.org/`
