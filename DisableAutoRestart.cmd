@echo off

REM Check for administrative privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process -FilePath \"%~dp0%~nx0\" -Verb RunAs"
    exit /b
)

REM Continue with the script after acquiring administrative privileges
echo Administrative privileges acquired.

REM Disable Automatic Updates in Registry
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f

REM Set AUOptions to 1 (disable Automatic Updates)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 1 /f

REM Disable automatic restart on system failure
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v AutoReboot /t REG_DWORD /d 0 /f

REM Disable automatic restart with logged-on users for Windows Update installations
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f

REM Display a countdown message
echo Waiting for 10 seconds before updating Group Policy...

REM Loop for 10 seconds
for /l %%i in (10,-1,1) do (
    echo Remaining time: %%i seconds
    timeout /nobreak /t 1 >nul
)

REM Update Group Policy
echo Updating Group Policy...
gpupdate /force
echo Group Policy update completed.

REM Restart Windows Update Service
net stop wuauserv
net start wuauserv

echo Configuration completed. AutoRestart of your computer should be disabled successfully.
pause
