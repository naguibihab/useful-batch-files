REM ********************************************************************************
REM										WinodwsInfo.bat
REM Gets some info on the running windows OS
REM
REM prerequisits: None
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _isPause=%isPause%

::operations
wmic os get caption
wmic os get osarchitecture
pause

if %_isPause% equ true pause