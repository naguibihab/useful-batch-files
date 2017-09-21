REM ********************************************************************************
REM Simply opens a git bash for the primary source codes. This can be used on
REM computer startup
REM
REM prerequisits: git-bash
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %locationOfBatch%\SetupEnv.bat
)
set _isPause=%isPause%

::operations
REM Opening git on frontend
%frontend_directory%:
cd %frontend_primary_source_code%
start "" "%SYSTEMDRIVE%\Program Files\Git\git-bash.exe"

REM Opening git on backend
%backend_directory%:
cd %backend_primary_source_code%
start "" "%SYSTEMDRIVE%\Program Files\Git\git-bash.exe"

if %_isPause% equ true pause