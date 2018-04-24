echo $env:BUILD_SOURCEBRANCH
echo $env:BUILD_BINARIESDIRECTORY
if ($env:BUILD_SOURCEBRANCH -match "^refs/tags/v?[0-9]+\.[0-9]+\.[0-9]+$") {
    $env:PATH = $env:PATH + ";$env:BUILD_BINARIESDIRECTORY"
    nuget push *.nupkg $env:api_key -Source https://www.nuget.org/api/v2/package
} else {
    echo "skipping Nuget Push"
}