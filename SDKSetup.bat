
set JAVA_HOME=%cd%\jdk-25
set SDKM=%cd%\SDK\cmdline-tools\latest\bin

set PATH=%JAVA_HOME%\bin;%SDKM%;%PATH%

set SKIP_JDK_VERSION_CHECK=true

:: sdkmanager --list > list.txt
:: exit

call sdkmanager --install "cmdline-tools;6.0"
call sdkmanager --install "build-tools;34.0.0"
call sdkmanager --install "platforms;android-33"
call sdkmanager --install "platforms;android-34"
call sdkmanager --install "platforms;android-35"
call sdkmanager --install "ndk;23.1.7779620"

pause