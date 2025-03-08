@echo off

cls
setlocal enabledelayedexpansion
title Google Chorme History Copier
color 0f

:mainmenu
    set program_prompt_input=
    cls
	echo.
	echo.                      ______________
	echo                   ___/              \_
	echo         \_       /       _  __________\       _/
	echo           \     /         \/           \     /
	echo                /     \     \            \
	echo      \_       /  \    \     \______      \       _/
	echo        \      \   \    \     \___//      /      /
	echo                \__/\__/ \___/  __/      /
	echo                 \             /        /
	echo        \_        \                    /        _/
	echo          \        \                  /        /
	echo                    \________________/
    echo.
    echo.
    call :color_echo . cyan "Google Chorme History Copier - By @Maniceraf"
    echo.
    echo.
    echo Type 'help' for more info
    echo.
    call :program_prompt
    echo.

    if "%program_prompt_input%" equ "start" (
        call :start
        goto :mainmenu
    )

    if "%program_prompt_input%" equ "help" (
        call :help
        goto :mainmenu
    )

    if "%program_prompt_input%" equ "exit" (
        exit
    )

    call :program_prompt_invalid_input
goto :mainmenu

:program_prompt
    call :color_echo . green ">"
    call :color_echo . white "$ "
    set /p program_prompt_input=
goto :eof

:program_prompt_invalid_input
    call :color_echo . red "Invalid input"
    timeout /t 3 >nul
goto :eof

:color_echo

    :: Check if the first 2 arguments are empty, cause they are needed for background/foreground information
    :: The 3rd argument is not that important because it can be an empty string
    if "%~1" equ "" (
        goto :eof
    )
    if "%~2" equ "" (
        goto :eof
    )

    :: Background color; if invalid, no action
    if "%~1" equ "black" (
        <nul set /p=[40m
    )

    if "%~1" equ "red" (
        <nul set /p=[41m
    )

    if "%~1" equ "green" (
        <nul set /p=[42m
    )

    if "%~1" equ "yellow" (
        <nul set /p=[43m
    )

    if "%~1" equ "blue" (
        <nul set /p=[44m
    )

    if "%~1" equ "magenta" (
        <nul set /p=[45m
    )

    if "%~1" equ "cyan" (
        <nul set /p=[46m
    )

    if "%~1" equ "white" (
        <nul set /p=[47m
    )

    :: Foreground color; if invalid, no action

    if "%~2" equ "black" (
        <nul set /p=[30m
    )

    if "%~2" equ "red" (
        <nul set /p=[31m
    )

    if "%~2" equ "green" (
        <nul set /p=[32m
    )

    if "%~2" equ "yellow" (
        <nul set /p=[33m
    )

    if "%~2" equ "blue" (
        <nul set /p=[34m
    )

    if "%~2" equ "magenta" (
        <nul set /p=[35m
    )

    if "%~2" equ "cyan" (
        <nul set /p=[36m
    )

    if "%~2" equ "white" (
        <nul set /p=[37m
    )

    <nul set /p="%~3"

    <nul set /p=[0m
goto :eof

:help
	cls
	echo.
	call :color_echo . cyan "Main Commands:"
	echo.
	echo.
	echo  - help             : Displays this page
	echo  - start            : Performs copy Google Chorme History
	echo  - exit             : Close the program
	echo.
	echo.
	echo Press any key to continue...
	pause >nul

goto :eof

:start
	cls
    echo.
    echo.
	set histFile=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\History
    set backupDir=D:\
    if not exist "%histFile%" (
        call :color_echo . red "Chrome history file not found!"
    )
    else
    (
        if not exist "%backupDir%" mkdir "%backupDir%"
        (
            copy "%histFile%" "%backupDir%\History_backup.db" /Y
            cls
            call :color_echo . green "Chrome history backed up to %backupDir%"
        )
    )
	echo.
	echo.
	echo Press any key to continue...
	pause >nul

goto :eof

pause