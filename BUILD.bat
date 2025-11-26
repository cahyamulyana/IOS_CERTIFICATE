@echo off
echo ========================================
echo   SISPEG Mobile - Auto Build APK
echo ========================================
echo.

echo [1/5] Checking Cordova...
call cordova -v
if errorlevel 1 (
    echo ERROR: Cordova not installed!
    echo Install: npm install -g cordova
    pause
    exit
)

echo [2/5] Adding Android platform...
call cordova platform add android

echo [3/5] Building APK...
call cordova build android

echo [4/5] Locating APK...
set APK_PATH=platforms\android\app\build\outputs\apk\debug\app-debug.apk
if exist "%APK_PATH%" (
    echo.
    echo ========================================
    echo   BUILD SUCCESS!
    echo ========================================
    echo.
    echo APK Location:
    echo %CD%\%APK_PATH%
    echo.
    echo [5/5] Copying to root folder...
    copy "%APK_PATH%" "..\sispeg_mobile_v2.apk"
    echo.
    echo APK copied to:
    echo %CD%\..\sispeg_mobile_v2.apk
    echo.
    echo Transfer file ini ke HP, install, selesai!
) else (
    echo ERROR: APK not found!
    echo Check build errors above.
)

echo.
pause
