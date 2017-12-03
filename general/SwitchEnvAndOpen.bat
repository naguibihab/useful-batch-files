REM ********************************************************************************
REM										SwitchEnvAndOpen.bat
REM Combines the SwitchEnv.bat & OpenPrimaryProjects.bat
REM
REM prerequisits: Check SwitchEnv.bat & OpenPrimaryProjects.bat
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _isPause=%isPause%

::operations
call %BATCHLOCATION%/general/SwitchEnv.bat
call %BATCHLOCATION%/general/OpenPrimaryProjects

if %_isPause% equ true pause