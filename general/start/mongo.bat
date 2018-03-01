REM ********************************************************************************
REM										Mogno.bat
REM Starts up your Mongo instance
REM
REM prerequisits: Having mongo variables setup in the SetupEnv.bat file
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _isPause=%isPause%

::operations
start "" "%mongo_bin%" --dbpath "%mongo_dbpath%"

if "%_isPause%" equ "true" pause