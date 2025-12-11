# unity-portable-androidSDK

A portable setup script for installing all the necessary components to build **Unity Android games** without relying on Unity Hub’s bundled tools.  
This project automates downloading and configuring:

- **JDK** (Java Development Kit)  
- **Android SDK** (including build-tools, platform-tools, and platforms)  
- **Android NDK** (Native Development Kit)  

So you can quickly get a Unity environment ready for Android builds.

---

## 🚀 Setup Instructions

Open PowerShell in the project folder (right‑click → **Open in Terminal/PowerShell**).  
Run the setup script by pasting the commands below — this will download all required files and dependencies.

```powershell
curl.exe -L -o "$(Get-Location)\codeDL.ps1" "https://raw.githubusercontent.com/Kiliken/unity-portable-androidSDK/main/codeDL.ps1"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$(Get-Location)\codeDL.ps1"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$(Get-Location)\DownloadSetup.ps1"

```

---

## 📦 What Gets Installed

- **Command-line tools** (`cmdline-tools`)  
- **Platform-tools** (`adb`, etc.)  
- **Build-tools** (Unity‑compatible version)
- **Android platforms** (API levels 33–35)  
- **NDK** (Unity‑compatible version)  
- **JDK** (OpenJDK 11, recommended for Unity)

---

## ⚙️ Unity Configuration

After running the scripts:

1. Open Unity → **Edit → Preferences → External Tools**.  
2. Point Unity to the installed paths:
   - **JDK** → `<Local>\PortableAndroidSDK\OpenJDK`
   - **SDK** → `<Local>\PortableAndroidSDK\SDK`
   - **NDK** → `<Local>\PortableAndroidSDK\NDK`

Unity should now recognize Android as a build target.

---

## 📝 Notes

- Tested on **Windows PowerShell**.  
- Scripts bypass execution policy for convenience (`-ExecutionPolicy Bypass`).  
- If you already have Unity Hub’s Android support installed, you don’t need this — this repo is for portable/manual setups.  
