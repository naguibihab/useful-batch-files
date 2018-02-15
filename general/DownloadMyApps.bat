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
	start "" %%i
)
echo "Once all installs are done hit enter"
pause

for /r "%downloads%" %%a in (*.exe) do start "" "%%~fa"
for /r "%downloads%" %%a in (*.msi) do start "" "%%~fa"

if "%_isPause%" equ "true" pause