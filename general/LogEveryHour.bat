REM ********************************************************************************
REM								LogEveryHour.bat
REM This batch file writes in a log everytime it opens up. I use it to log my
REM energy levels every hour and set this file up with task scheduler
REM
REM prerequisits: %log_file% variable in SetupEnv.bat
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%

::inputs
if "%_human_or_batch%" equ "" (
set /P _energy_level=Energy Level [0-10]:
set /P _notes=Notes:

goto defaults
)
:: else, get the inputs from the parameters
set _energy_level=%1
set _notes=%2
set _isPause=false

::defaults
:defaults
if "%_energy_level%" equ "" (
set _energy_level=defaultValue
)
if "%_notes%" equ "" (
set _notes=defaultValue
)

::operations
echo Time is now %TIME% 
echo %DATE%,%TIME%,%_energy_level%,%_notes%>>"%log_file%"

if %_isPause% equ true pause