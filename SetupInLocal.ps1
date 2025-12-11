
New-Item -Path "$($env:LOCALAPPDATA)\PortableAndroidSDK" -ItemType Directory
New-Item -Path "$($env:LOCALAPPDATA)\PortableAndroidSDK\OpenJDK" -ItemType Directory
New-Item -Path "$($env:LOCALAPPDATA)\PortableAndroidSDK\SDK" -ItemType Directory
New-Item -Path "$($env:LOCALAPPDATA)\PortableAndroidSDK\NDK" -ItemType Directory

Copy-Item -Path "$($PSScriptRoot)\jdk-11.0.1\*" -Destination "$($env:LOCALAPPDATA)\PortableAndroidSDK\OpenJDK" -Recurse
Copy-Item -Path "$($PSScriptRoot)\SDK\*" -Destination "$($env:LOCALAPPDATA)\PortableAndroidSDK\SDK" -Recurse
Copy-Item -Path "$($PSScriptRoot)\SDK\ndk\23.1.7779620\*" -Destination "$($env:LOCALAPPDATA)\PortableAndroidSDK\NDK" -Recurse

Rename-Item -Path "$($env:LOCALAPPDATA)\PortableAndroidSDK\SDK\cmdline-tools\latest" -NewName "19.0"
Rename-Item -Path "$($env:LOCALAPPDATA)\PortableAndroidSDK\SDK\cmdline-tools\6.0" -NewName "latest"

# Clean Dependencies
Remove-Item -Path "$($PSScriptRoot)\SDK" -Recurse -Force
Remove-Item -Path "$($PSScriptRoot)\jdk-11.0.1" -Recurse -Force

return 0
