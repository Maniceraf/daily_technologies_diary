@echo off
setlocal

:: Display header and prompt user for file path
echo ==============================
echo     Windows Defender Scanner  
echo ==============================
set /p "filePath=Enter the file path to scan: "

:: Check if the file exists
if not exist "%filePath%" (
    echo [ERROR] The file does not exist! Please check the path.
    pause
    exit /b 1
)

:: Windows Defender path
set "windowsDefenderPath=C:\Program Files\Windows Defender\MpCmdRun.exe"

:: Check if Windows Defender exists
if not exist "%windowsDefenderPath%" (
    echo [ERROR] Windows Defender not found!
    pause
    exit /b 1
)

:: Run the scan
echo [*] Scanning file: %filePath%
"%windowsDefenderPath%" -Scan -ScanType 3 -File "%filePath%" -DisableRemediation > scan_result.txt 2>&1

:: Retrieve the exit code
set "exitCode=%ERRORLEVEL%"

:: Read the scan result from the output file
for /f "delims=" %%i in (scan_result.txt) do set "output=%%i"

:: Check the scan result
if %exitCode% equ 2 (
    echo [ALERT] Virus detected!
) else if %exitCode% equ 0 (
    echo [OK] No virus found.
) else (
    echo [WARNING] An error occurred or Windows Defender could not determine the result.
)

echo ExitCode: %exitCode%
echo Output: %output%
del scan_result.txt

pause
