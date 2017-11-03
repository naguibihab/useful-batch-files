REM ********************************************************************************
REM								DownloadMyApps.bat
REM This file automatically downloads the apps specified in %my_apps%
REM
REM prerequisits: none
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _isPause=%isPause%

::operations
for /f %%i in (%my_apps%) do (
    echo "Downloading %%i..."
    BITSADMIN /transfer /download %%i %downloads%\setup.exe > nul
    echo "Installing %%i"
    %downloads%\setup.exe /S
    del %downloads%\setup.exe
)

if %_isPause% equ true pause