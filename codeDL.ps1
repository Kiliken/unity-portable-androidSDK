

$wc = New-Object Net.WebClient
Add-Type -AssemblyName System.IO.Compression.FileSystem

$wc.DownloadFile("https://github.com/Kiliken/unity-portable-androidSDK/archive/refs/heads/main.zip", "$($PSScriptRoot)\main.zip")

[System.IO.Compression.ZipFile]::ExtractToDirectory("$($PSScriptRoot)\main.zip", $PSScriptRoot)

Move-Item "$($PSScriptRoot)\unity-portable-androidSDK\*" $PSScriptRoot -Force
Remove-Item "$($PSScriptRoot)\unity-portable-androidSDK" -Recurse -Force
Remove-Item "$($PSScriptRoot)\main.zip" -Force
