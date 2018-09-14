Function main {
    $fileName = "NDP452-KB2901951-x86-x64-DevPack.exe"
    Get-Package -FileName $fileName -Url "https://download.microsoft.com/download/4/3/B/43B61315-B2CE-4F5B-9E32-34CCA07B2F0E/$fileName"
    
    $fileName = "NDP461-DevPack-KB3105179-ENU.exe"
    Get-Package -FileName $fileName -Url "https://download.microsoft.com/download/F/1/D/F1DEB8DB-D277-4EF9-9F48-3A65D4D8F965/$fileName"

    docker build . -t andreymalyshenko/vsts-agent:ltsc2016-msbuild-sp
}

Function Get-Package {
    param (
        [string] $FileName,
        [string] $Url
    )

    Write-Host "Getting Package... " -NoNewLine
    if (Test-Path $FileName) {
        Write-Host "File alredy downloaded, skipping"
    } else {
        Write-Host "Downloading $FileName"
        Invoke-WebRequest -Uri $Url -OutFile $FileName
    }
}

main