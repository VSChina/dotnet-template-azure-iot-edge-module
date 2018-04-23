echo $env:BUILD_SOURCEBRANCH
if ($env:BUILD_SOURCEBRANCH -match "^refs/tags/v?[0-9]+\.[0-9]+\.[0-9]+$") {
    echo "Nuget Push"
    $env:$(Build.BinariesDirectory)\nuget.exe push *.nupkg $env:api_key -Source https://www.nuget.org/api/v2/package
} else {
    echo "skipping Nuget Push"
}