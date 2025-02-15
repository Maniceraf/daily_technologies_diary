@echo off
setlocal enabledelayedexpansion
title Virtual Wi-Fi Setup Tool v1.3
color 0A

cls:: Clear screen
call :admintest :: Check if running as administrator
call :vercheck  :: Check if the system is Win7 or later

:menu
set Line===================================================
echo %Line%
echo    Note: If running this tool for the first time, press "B" to set a password
echo.
echo        [A] View Virtual Wi-Fi Information (Hosted Network)
echo        [B] Create or Modify Virtual Wi-Fi Name and Password
echo        [C] Start Virtual Wi-Fi
echo        [D] Stop Virtual Wi-Fi
echo        [E] Disable Virtual Wi-Fi Completely
echo        [F] About
echo.
echo        [X] Exit
echo %Line%

echo Please select an option: [A/B/C/D/E/F/X]
set /p choice=
set choice=!choice:~0,1!

if /i "%choice%"=="A" (netsh wlan show hostednetwork & goto :menu)
if /i "%choice%"=="B" call :update
if /i "%choice%"=="C" call :startwifi
if /i "%choice%"=="D" call :stopwifi
if /i "%choice%"=="E" call :disablewifi
if /i "%choice%"=="F" call :about
if /i "%choice%"=="X" exit
echo Invalid choice, please try again.
pause
goto :menu

:update :: Modify Name and Password
echo Enter the Virtual Wi-Fi Name:
set /p ssid=
:checkpassword
echo Enter the Password (minimum 8 characters):
set /p key=
if not "%key:~7,1%"=="" goto :validpassword
echo Password must be at least 8 characters long. Try again.
goto :checkpassword

:validpassword
echo.
echo Configuring Virtual Wi-Fi...
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%key%
echo Configuration updated successfully!
pause
goto :menu

:startwifi :: Start Virtual Wi-Fi
echo Checking Virtual Wi-Fi status...
netsh wlan show hostednetwork | find "Status" | find "Not started" >nul && (
    echo Starting Virtual Wi-Fi...
    netsh wlan start hostednetwork
    echo Virtual Wi-Fi started successfully!
) || echo Virtual Wi-Fi is already running!
pause
goto :menu

:stopwifi :: Stop Virtual Wi-Fi
echo Checking Virtual Wi-Fi status...
netsh wlan show hostednetwork | find "Status" | find "Started" >nul && (
    echo Stopping Virtual Wi-Fi...
    netsh wlan stop hostednetwork
    echo Virtual Wi-Fi has been stopped!
) || echo Virtual Wi-Fi is already stopped!
pause
goto :menu

:disablewifi :: Disable Virtual Wi-Fi
echo Disabling Virtual Wi-Fi...
netsh wlan set hostednetwork mode=disallow
echo Virtual Wi-Fi has been disabled!
pause
goto :menu

:admintest :: Check if running as administrator
set rnd=_%random%
md %windir%\%rnd% >nul 2>nul
if %errorlevel%==1 (
    echo.
    echo Please right-click this file and select "Run as Administrator".
    echo.
    echo Press any key to exit...
    pause>nul 2>nul
    exit
)
rd /q %windir%\%rnd%
goto :EOF

:vercheck :: Check system version
ver | find "6.1" >nul 2>nul && (echo Your system is Windows 7, supported!&goto :EOF)
ver | find "6.2" >nul 2>nul && (echo Your system is Windows 8, supported!&goto :EOF)
ver | find "6.3" >nul 2>nul && (echo Your system is Windows 8.1, supported!&goto :EOF)
ver | find "10.0" >nul 2>nul && (echo Your system is Windows 10, supported!&goto :EOF)
ver | find "11.0" >nul 2>nul && (echo Your system is Windows 11, supported!&goto :EOF)
echo.
echo Sorry, this batch script only supports Windows 7 or later!
echo.
echo Press any key to exit...
pause>nul
exit

:about :: About
echo.
echo [Virtual Wi-Fi Setup Tool]
echo Author: savage_boi
echo Created: February 11, 2013
echo Last Modified: February 15, 2025
echo.
pause
goto :menu

:: PowerShell GUI Improvement Placeholder
echo A future update will introduce a PowerShell-based graphical interface for better user experience.
pause
goto :menu