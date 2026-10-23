@echo off
title Ultimate PC Maintenance & Repair Tool
color 0A

:: Check for Administrator Privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ========================================================
    echo   ERROR: ADMINISTRATOR PRIVILEGES REQUIRED!
    echo ========================================================
    echo Please right-click this script and select "Run as administrator".
    echo.
    pause
    exit /b
)

:menu
cls
echo ========================================================
echo             PC MAINTENANCE & REPAIR TOOL
echo ========================================================
echo  [1] Flush DNS Cache (Fix network/internet issues)
echo  [2] Run System File Checker / SFC (Repair corrupted system files)
echo  [3] Run DISM Image Repair (Fix Windows image health)
echo  [4] Clear Temporary Files (Free up storage space)
echo  [5] Open Disk Cleanup Wizard (Advanced disk cleanup)
echo  [6] Run All Recommended Tasks (1 through 4)
echo  [7] Exit
echo ========================================================
set /p choice="Enter your choice (1-7): "

if "%choice%"=="1" goto flushdns
if "%choice%"=="2" goto sfcscan
if "%choice%"=="3" goto dismrepair
if "%choice%"=="4" goto cleantemp
if "%choice%"=="5" goto diskcleanup
if "%choice%"=="6" goto runall
if "%choice%"=="7" exit

echo.
echo Invalid choice! Please select between 1 and 7.
timeout /t 2 >nul
goto menu

:flushdns
echo.
echo ========================================================
echo  [+] Flushing DNS Cache...
echo ========================================================
ipconfig /flushdns
echo.
echo [✓] DNS flushed successfully!
pause
goto menu

:sfcscan
echo.
echo ========================================================
echo  [+] Running System File Checker (SFC)...
echo  (This may take several minutes)
echo ========================================================
sfc /scannow
echo.
echo [✓] SFC scan completed!
pause
goto menu

:dismrepair
echo.
echo ========================================================
echo  [+] Repairing Windows Image (DISM)...
echo  (This requires an active internet connection)
echo ========================================================
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo [✓] DISM repair completed!
pause
goto menu

:cleantemp
echo.
echo ========================================================
echo  [+] Cleaning Temporary Files...
echo ========================================================
del /s /f /q %temp%\* 2>nul
del /s /f /q C:\Windows\Temp\* 2>nul
echo [✓] Temporary files cleared successfully!
pause
goto menu

:diskcleanup
echo.
echo ========================================================
echo  [+] Launching Windows Disk Cleanup...
echo ========================================================
cleanmgr
goto menu

:runall
echo.
echo ========================================================
echo  [+] Running All Maintenance Tasks...
echo ========================================================

echo.
echo --- [Task 1/4] Flushing DNS ---
ipconfig /flushdns

echo.
echo --- [Task 2/4] Running SFC Scan ---
sfc /scannow

echo.
echo --- [Task 3/4] Running DISM Repair ---
DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo --- [Task 4/4] Clearing Temp Files ---
del /s /f /q %temp%\* 2>nul
del /s /f /q C:\Windows\Temp\* 2>nul

echo.
echo ========================================================
echo  [✓] ALL MAINTENANCE TASKS COMPLETED SUCCESSFULLY!
echo ========================================================
pause
goto menu