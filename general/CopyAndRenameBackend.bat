REM ********************************************************************************
REM Simply copying and renaming the folder to the git branch number
REM I use that when I have a frontend version built that is pointing to my backend
REM application, but I want to switch to another branch on my backend app without 
REM affecting the frontend built version; So I copy the backend folder and have the
REM frontend app pointing to it.
REM
REM prerequisits: Xampp (used as the destination but you can replace that if you want)
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %locationOfBatch%\SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%

::inputs
if "%_human_or_batch%" equ "" (
set /P _branch=Branch name:

goto defaults
)
:: else, get the inputs from the parameters
set _branch=%1
set _isPause=false

::defaults
:defaults
if "%_branch%" equ "" (
set _branch=master
)

::operations
xcopy "%backend_directory%:%backend_secondary_source_code%" "%base_destination%\%backend_framework%-%_branch%" /s/e/c/y/f

if %_isPause% equ true pause