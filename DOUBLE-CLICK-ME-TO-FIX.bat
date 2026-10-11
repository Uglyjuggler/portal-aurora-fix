@echo off
setlocal EnableDelayedExpansion
title Aurora Store Fix for your Portal
cd /d "%~dp0"

echo ======================================================
echo   AURORA STORE FIX - for your Meta Portal
echo ======================================================
echo.
echo  Do these 3 steps first:
echo.
echo   1. Plug your Portal into this PC with a USB cable.
echo      (It must be a DATA cable - some cables only charge.)
echo.
echo   2. Make sure USB debugging (ADB) is turned ON
echo      on your Portal.
echo.
echo   3. On your Portal screen, tap ALLOW when it asks
echo      about USB debugging.
echo.
echo  Then press any key here to start the fix.
pause >nul
echo.

set TRIES=0
:checkdevice
set DEVSTATE=
for /f "skip=1 tokens=2" %%s in ('adb devices 2^>nul') do set DEVSTATE=%%s
if "!DEVSTATE!"=="device" goto found
if "!DEVSTATE!"=="unauthorized" (
  echo.
  echo Your Portal is asking for permission right now.
  echo Look at your PORTAL screen and tap ALLOW,
  echo then press any key here to try again.
  pause >nul
  goto checkdevice
)
set /a TRIES+=1
if !TRIES! GEQ 30 (
  echo.
  echo ======================================================
  echo   I waited 30 seconds but never saw your Portal.
  echo.
  echo   Try this:
  echo    - Unplug the cable and plug it back in
  echo    - Try a DIFFERENT USB cable (some only charge)
  echo    - Make sure USB debugging is ON on your Portal
  echo ======================================================
  echo.
  pause
  exit /b 1
)
timeout /t 1 >nul
goto checkdevice

:found
echo.
echo Found your Portal! Checking for Aurora Store...
echo.
adb shell pm list packages | findstr /i "com.aurora.store" >nul 2>&1
if %errorlevel% NEQ 0 (
  echo ======================================================
  echo   Aurora Store does not seem to be installed
  echo   on your Portal yet. Install it first,
  echo   then run this fix again.
  echo ======================================================
  echo.
  pause
  exit /b 1
)
echo Running the fix...
adb shell appops set com.aurora.store REQUEST_INSTALL_PACKAGES allow
if %errorlevel%==0 (
  echo.
  echo ======================================================
  echo   SUCCESS! Aurora Store is fixed.
  echo   You can unplug your Portal now.
  echo ======================================================
) else (
  echo.
  echo ======================================================
  echo   Hmm, something went wrong.
  echo   Take a screenshot of this window and send it
  echo   to the person helping you.
  echo ======================================================
)
echo.
pause
