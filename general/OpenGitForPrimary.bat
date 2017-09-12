REM ********************************************************************************
REM Simply opens a git bash for the primary source codes. This can be used on
REM computer startup
REM
REM prerequisits: git-bash
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call ../SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%
::inputs
:: No inputs needed. Just keeping this for consistency
if "%_human_or_batch%" equ "" (
goto defaults
)
:: else, get the inputs from the parameters
:: No inputs needed. Just keeping this for consistency
set _isPause=false

::defaults
:defaults
:: No defaults set. Just keeping this for consistency

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