REM ********************************************************************************
REM								DownloadMyApps.bat
REM This file automatically downloads the apps specified in %my_apps%
REM
REM prerequisits: 
REM 	- BATCHLOCATION environment variable needs to be setup
REM 	- Setup %downloads% variable in SetupEnv.bat to point at your default 
REM downloads folder
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _isPause=%isPause%

if "%my_apps%" equ "" (
	echo You need to add BATCHLOCATION as an environemnt variable so I can detect your configuration. Check README to know more
	pause
)

::operations
for /f %%i in (%my_apps%) do (
	start "" %%i
)
echo "Once all installs are done hit enter"
pause

for /r "%downloads%" %%a in (*.exe) do start "" "%%~fa"
for /r "%downloads%" %%a in (*.msi) do start "" "%%~fa"

if "%_isPause%" equ "true" pause