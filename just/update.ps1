Import-Module au

$releases = "https://github.com/casey/just/releases/latest"

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(Get-RemoteChecksum).*" = "`${1} $($Latest.URL64)"
            "(?i)(\s+checksum64:).*"     = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_GetLatest {
    $request                    = [System.Net.WebRequest]::Create($releases)
    $request.AllowAutoRedirect  = $false
    $response                   = $request.GetResponse()
    $downloadUrl                = $response.GetResponseHeader("Location")

    $version = $downloadUrl -Split '/' | Select-Object -Last 1

    @{
        URL64           = "https://github.com/casey/just/releases/download/$version/just-$version-x86_64-pc-windows-msvc.zip"
        Version         = $version
        ReleaseNotes    = "https://github.com/casey/just/releases/tag/$version"
    }
}

update -ChecksumFor None
