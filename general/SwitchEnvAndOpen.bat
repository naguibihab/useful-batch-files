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
call SwitchEnv.bat
call OpenPrimaryProjects

if %_isPause% equ true pause