@echo off
title Windows Administration Tools
color 0A
cls

:: Kiểm tra quyền Admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Please run the script with Administrator rights!
    pause
    exit /b
)

:: Menu chính
:MENU
cls
echo ==============================================
echo  WINDOWS SYSTEM ADMINISTRATION - BATCH SCRIPT
echo ==============================================
echo 1. Clean up temporary files
echo 2. Check network connection
echo 3. Stop and restart Windows service
echo 4. Export list of running processes
echo 5. Exit
echo ==============================================
set /p choice=Enter selection (1-5): 

if "%choice%"=="1" goto CLEAN_TEMP
if "%choice%"=="2" goto CHECK_NETWORK
if "%choice%"=="3" goto RESTART_SERVICE
if "%choice%"=="4" goto LIST_PROCESSES
if "%choice%"=="5" exit
goto MENU

:: Clean up temporary files
:CLEAN_TEMP
echo Cleaning up temporary files...
del /s /f /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
mkdir %temp%
echo [+] Successful cleanup!
pause
goto MENU

:: Check network connection
:CHECK_NETWORK
echo Check internet connection...
ping google.com -n 4
pause
goto MENU

:: Stop and restart a service (ví dụ: Print Spooler)
:RESTART_SERVICE
set /p svcname=Enter the name of the service to restart (VD: spooler): 
echo Stop service %svcname%...
net stop %svcname% /y
timeout /t 3
echo Restart the service %svcname%...
net start %svcname%
echo [+] Service %svcname% has been restarted!
pause
goto MENU

:: Export list of running processes to file
:LIST_PROCESSES
echo Export process list...
tasklist > D:\RunningProcesses.txt
echo [+] The list has been saved on Desktop!
pause
goto MENU