@echo off
    setlocal enableextensions disabledelayedexpansion

:ask
    rem select disk to format
    set /p "diskNumber=Type number of disk to format: " || goto :processCancelled

    rem Create script file
    set "scriptFile=%temp%\%~nx0.%random%%random%%random%.tmp"
    > "%scriptFile%" (
        echo SELECT DISK %diskNumber%
        echo CLEAN
        echo CREATE PARTITION PRIMARY
        echo FORMAT FS=NTFS LABEL="Windows" QUICK
        echo ACTIVE
        echo ASSIGN LETTER="C"
    )

    rem execute script file
    diskpart /s "%scriptFile%"

    rem cleanup and exit
    del /q "%scriptFile%"

    imagex /apply images/image.wim 1 C:\

    exit /b 0

:processCancelled
    echo(
    echo PROCESS CANCELLED
    echo(
    exit /b 1