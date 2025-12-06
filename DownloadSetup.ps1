
Write-Output "[openGL-portable-setup] This setup is calibrated on unity SOMETHINGVERSION..."
$answer = Read-Host "[openGL-portable-setup] Do you want to continue? (Y/N)"
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
Write-Output "[openGL-portable-setup] Downloading OpenJDK_25..."
$wc.DownloadFile($jdk25DlUrl, "$($PSScriptRoot)\jdk25.zip")
Write-Output "[openGL-portable-setup] Downloading OpenJDK_11.0.1..."
$wc.DownloadFile($jdk11DlUrl, "$($PSScriptRoot)\jdk11.zip")
Write-Output "[openGL-portable-setup] Downloading Android_SDKCmdline-tools..."
$wc.DownloadFile($sdkCmdtDlUrl, "$($PSScriptRoot)\sdkCmdlt.zip")

# Extract
Write-Output "[openGL-portable-setup] Extracting OpenJDK_25..."
[System.IO.Compression.ZipFile]::ExtractToDirectory("$($PSScriptRoot)\jdk25.zip", "$($PSScriptRoot)\")
Write-Output "[openGL-portable-setup] Extracting OpenJDK_11.0.1..."
[System.IO.Compression.ZipFile]::ExtractToDirectory("$($PSScriptRoot)\jdk11.zip", "$($PSScriptRoot)\")
Write-Output "[openGL-portable-setup] Extracting Android_SDKCmdline-tools..."
[System.IO.Compression.ZipFile]::ExtractToDirectory("$($PSScriptRoot)\sdkCmdlt.zip", "$($PSScriptRoot)\SDK\cmdline-tools")



# Dependencies Setup
Rename-Item -Path "$($PSScriptRoot)\SDK\cmdline-tools\cmdline-tools" -NewName "latest"

& ".\GenerateLibs.bat"

.\SetupInLocal.ps1


return 0
