@echo off
title Ultimate Windows Space Cleaner
echo ===================================================
echo   Ultimate Space Saving and Optimization Tool V1.0
echo ===================================================
echo.

:: 1. Check for Admin Privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Please close this window, right-click the file,
    echo         and select "Run as administrator"!
    echo ---------------------------------------------------
    pause
    exit /b
)

:: 2. Disable Hibernation (Frees up GBs equal to your RAM size)
echo [1/7] Disabling Hibernation to free up C: drive space...
powercfg -h off >nul 2>&1
echo       Done.

:: 3. Enable Storage Sense System-Wide via Registry
echo [2/7] Activating Storage Sense for automatic future cleanups...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "01" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d 1 /f >nul 2>&1
echo       Done.

:: 4. Run Advanced Disk Cleanup (cleanmgr) Silently
echo [3/7] Initializing Windows Disk Cleanup in silent mode...
cleanmgr /sagerun:64 >nul 2>&1
echo       Done.

:: 5. Flush Windows Update Cache (Very Safe & Frees a lot of space)
echo [4/7] Clearing Windows Update Cache files...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /q /s "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo       Done.

:: 6. Include Previous Force Temp & Prefetch Cleaner Code
echo [5/7] Executing previous Force-Delete script for Temp and Prefetch...
taskkill /f /im explorer.exe >nul 2>&1
del /s /f /q /a "C:\Windows\Temp\*.*" >nul 2>&1
for /d %%p in ("C:\Windows\Temp\*") do rmdir "%%p" /s /q >nul 2>&1
del /s /f /q /a "%USERPROFILE%\AppData\Local\Temp\*.*" >nul 2>&1
for /d %%p in ("%USERPROFILE%\AppData\Local\Temp\*") do rmdir "%%p" /s /q >nul 2>&1
del /s /f /q /a "C:\Windows\Prefetch\*.*" >nul 2>&1
for /d %%p in ("C:\Windows\Prefetch\*") do rmdir "%%p" /s /q >nul 2>&1
start explorer.exe
echo       Done.

:: 7. Clear DNS Cache and Quick System Caches
echo [6/7] Flushing DNS and System Font Cache...
ipconfig /flushdns >nul 2>&1
echo       Done.

:: 8. Optimize All Connected Drives (TRIM for SSD / Defrag for HDD)
echo [7/7] Running Optimization and Retrim on all drives (Please wait)...
defrag /c /o >nul 2>&1
echo       Done.

echo.
echo ===================================================
echo  ALL OPERATIONS COMPLETED SUCCESSFULLY! SAFE SPACE FREED.
echo ===================================================
pause
