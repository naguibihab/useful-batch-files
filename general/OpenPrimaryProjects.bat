REM ********************************************************************************
REM								OpenGitForPrimary.bat
REM Simply opens a git bash & Sublime IDE pointed at the primary source codes. 
REM This can be used on computer startup
REM
REM prerequisits: git-bash, sublime in PATH,
REM having a start.bat on the frontend projects
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _isPause=%isPause%

::operations
if "%frontend_directory%" neq "" (
REM Opening git on frontend
%frontend_directory%:
cd %frontend_primary_source_code%
start "" "%SYSTEMDRIVE%\Program Files\Git\git-bash.exe"

REM Opening sublime on frontned
call subl.exe %frontend_directory%:%frontend_primary_source_code%

REM Run the serve file on frontend
start "Serve Window" cmd /c serve.bat
)

if "%backend_directory%" neq "" (
REM Opening git on backend
%backend_directory%:
cd %backend_primary_source_code%
start "" "%SYSTEMDRIVE%\Program Files\Git\git-bash.exe"

REM Opening sublime on backend
call subl.exe %backend_directory%:%backend_primary_source_code%
)

if "%_isPause%" equ "true" pause