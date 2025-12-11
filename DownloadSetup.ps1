
Write-Output "[unity-portable-androidSDK] This setup is calibrated on Unity (2022.3.56f1)..."
$answer = Read-Host "[unity-portable-androidSDK] Do you want to continue? (Y/N)"
if ($answer -match '^[Nn]$') {
    return 0
}


New-Item -Path "$($PSScriptRoot)\SDK" -ItemType Directory
New-Item -Path "$($PSScriptRoot)\SDK\cmdline-tools" -ItemType Directory


$jdk25DlUrl = "https://download.java.net/java/GA/jdk25/bd75d5f9689641da8e1daabeccb5528b/36/GPL/openjdk-25_windows-x64_bin.zip"
$jdk11DlUrl = "https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_windows-x64_bin.zip"
$sdkCmdtDlUrl = "https://dl.google.com/android/repository/commandlinetools-win-13114758_latest.zip"

$wc = New-Object Net.WebClient
Add-Type -AssemblyName System.IO.Compression.FileSystem

# Downloads
Write-Output "[unity-portable-androidSDK] Downloading OpenJDK_25..."
$wc.DownloadFile($jdk25DlUrl, "$($PSScriptRoot)\jdk25.zip")
Write-Output "[unity-portable-androidSDK] Downloading OpenJDK_11.0.1..."
$wc.DownloadFile($jdk11DlUrl, "$($PSScriptRoot)\jdk11.zip")
Write-Output "[unity-portable-androidSDK] Downloading Android_SDKCmdline-tools..."
$wc.DownloadFile($sdkCmdtDlUrl, "$($PSScriptRoot)\sdkCmdlt.zip")

# Extract
Write-Output "[unity-portable-androidSDK] Extracting OpenJDK_25..."
[System.IO.Compression.ZipFile]::ExtractToDirectory("$($PSScriptRoot)\jdk25.zip", "$($PSScriptRoot)\")
Write-Output "[unity-portable-androidSDK] Extracting OpenJDK_11.0.1..."
[System.IO.Compression.ZipFile]::ExtractToDirectory("$($PSScriptRoot)\jdk11.zip", "$($PSScriptRoot)\")
Write-Output "[unity-portable-androidSDK] Extracting Android_SDKCmdline-tools..."
[System.IO.Compression.ZipFile]::ExtractToDirectory("$($PSScriptRoot)\sdkCmdlt.zip", "$($PSScriptRoot)\SDK\cmdline-tools")



# Dependencies Setup
Rename-Item -Path "$($PSScriptRoot)\SDK\cmdline-tools\cmdline-tools" -NewName "latest"

& ".\SDKSetup.bat"

.\SetupInLocal.ps1

explorer "$($env:LOCALAPPDATA)\PortableAndroidSDK"

Write-Host ""
Write-Host "[unity-portable-androidSDK] Installation completed."
Write-Host "Now manually point Unity to the installed paths (JDK, SDK, NDK)."
Write-Host ""
Write-Host "Press any key to continue..."
[void][System.Console]::ReadKey($true)


exit

return 0
