REM ********************************************************************************
REM								DownloadMyApps.bat
REM This file automatically downloads the apps specified in %my_apps%
REM
REM prerequisits: none
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call ../SetupEnv.bat
)
set _isPause=%isPause%

::operations
set app_list=%my_apps%
set app_path=%downloads%
for /f %%i in (%app_list%) do (
    echo "Downloading %%i..."
    BITSADMIN /transfer /download %%i %app_path%\setup.exe > nul
    echo "Installing %%i"
    %app_path%\setup.exe /S
    del %app_path%\setup.exe
)

if %_isPause% equ true pause