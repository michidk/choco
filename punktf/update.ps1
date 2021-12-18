Import-Module au

$releases = "https://github.com/Shemnei/punktf/releases/latest"

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

        ".\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(Get-RemoteChecksum).*" = "`${1} $($Latest.URL64)"
            "(?i)(\s+checksum64:).*"     = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_GetLatest {
    $request = [System.Net.WebRequest]::Create($releases)
    $request.AllowAutoRedirect = $false
    $response = $request.GetResponse()
    $downloadUrl = $response.GetResponseHeader("Location")

    $version = $downloadUrl -Split '/' | Select-Object -Last 1
    $version = $version.substring(1)

    @{
        URL64   = "https://github.com/Shemnei/punktf/releases/download/v$version/punktf-x86_64-pc-windows-msvc.zip"
        Version = $version
        ReleaseNotes = "https://github.com/Shemnei/punktf/releases/tag/v$version"
    }
}

update -ChecksumFor None
