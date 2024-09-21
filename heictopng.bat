@echo off
cls

where magick >nul 2>&1
if %errorlevel% neq 0 (
    echo ImageMagick not found. Install and add to PATH.
    pause
    exit
) else (
    echo ImageMagick is installed.
)

set "DIR=%~dp0"
set "CONVERTEDFOLDER=converted_png"
set "filesfound=false"

echo.
echo Converting HEIC to PNG.
echo.

if not exist "%CONVERTEDFOLDER%" (
    mkdir "%CONVERTEDFOLDER%"
)

echo Scanning...

for %%f in ("%DIR%*.heic") do (
    if exist "%%f" (
        set filesfound=true
        echo Converting: %%~nxf
        magick "%%f" "%CONVERTEDFOLDER%\%%~nf.png"
    )
)

if "%filesfound%"=="false" (
    echo No HEIC files found.
    pause
    exit
)

echo.
echo Conversion complete! Files are in '%CONVERTEDFOLDER%'.
pause
