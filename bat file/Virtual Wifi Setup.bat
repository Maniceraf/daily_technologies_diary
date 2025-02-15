@echo off
setlocal enabledelayedexpansion
title Virtual Wi-Fi Setup Tool v1.1
color 0A

cls:: Clear screen
call :admintest :: Check if running as administrator
call :vercheck  :: Check if the system is Win7 or Win8

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

choice /c:ABCDEFX /n /m "Please select an option: "
if %errorlevel%==1 (netsh wlan show hostednetwork)
if %errorlevel%==2 call :update
if %errorlevel%==3 (netsh wlan start hostednetwork)
if %errorlevel%==4 (netsh wlan stop hostednetwork)
if %errorlevel%==5 (netsh wlan set hostednetwork mode=disallow)
if %errorlevel%==6 call:about
if %errorlevel%==7 exit
goto :menu

:update :: Modify Name and Password
echo Enter the Virtual Wi-Fi Name:
set /p ssid=%=%
echo Enter the Password (minimum 8 characters):
set /p key=%=%
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%key%
goto :EOF

:admintest :: Check if running as administrator
set rnd=_%random%
md %windir%\%rnd% >nul 2>nul
if %errorlevel%==1 (echo.&echo Please right-click this file and select "Run as Administrator".&echo.&echo Press any key to exit...&pause>nul 2>nul &exit)
rd /q %windir%\%rnd%
goto :EOF

:vercheck :: Check system version
ver | find "6.1" >nul 2>nul && (echo Your system is Windows 7, supported!&echo.&goto :EOF)
ver | find "6.2" >nul 2>nul && (echo Your system is Windows 8, supported!&echo.&goto :EOF)
ver | find "6.3" >nul 2>nul && (echo Your system is Windows 8.1, supported!&echo.&goto :EOF)
ver | find "10.0" >nul 2>nul && (echo Your system is Windows 10, supported!&echo.&goto :EOF)
echo.&echo Sorry, this batch script only supports Windows 7 or later!
echo.&echo Press any key to exit...
pause>nul
exit

:about :: About
echo.
echo [Virtual Wi-Fi Setup Tool]
echo Author: savage_boi
echo Created: 02/15/2025
echo.
goto :EOF
