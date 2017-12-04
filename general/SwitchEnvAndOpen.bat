REM ********************************************************************************
REM										SwitchEnvAndOpen.bat
REM Combines the SwitchEnv.bat & OpenPrimaryProjects.bat
REM
REM prerequisits: Check SwitchEnv.bat & OpenPrimaryProjects.bat
REM ********************************************************************************

::setup (We're relying on the configuration in OpenPrimaryProjects because SwitchEnv would change them)
set _human_or_batch=%1
set _isPause=%isPause%

::operations
call %BATCHLOCATION%/general/SwitchEnv.bat
call %BATCHLOCATION%/general/OpenPrimaryProjects

if "%_isPause%" equ "true" pause