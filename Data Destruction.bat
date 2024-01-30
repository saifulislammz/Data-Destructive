@echo off

REM Set a custom title for the Command Prompt window
title Data Destruction Script

REM Check if the script is run as administrator
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if %errorlevel% neq 0 (
    echo This script requires administrator privileges.
    echo Please run the script as an administrator.
    pause
    exit /b
)

REM Set command prompt window size and color
mode con: cols=60 lines=25
color 0A

echo ***********************************************************
echo *4GB,8GB,16GB,32GB,64GB Pendrive Data Destruction Script *
echo ***********************************************************
echo.

set /p drive_letter=Enter the drive letter (e.g., J): 
set /p passes=Enter the number of passes for formatting (default is 1): 

if not exist %drive_letter%: (
    echo Drive %drive_letter% not found.
    pause
    exit /b
)

if "%passes%"=="" set passes=1

echo Formatting %drive_letter%...
format %drive_letter%: /fs:NTFS /p:%passes%

echo Formatting complete.
pause
