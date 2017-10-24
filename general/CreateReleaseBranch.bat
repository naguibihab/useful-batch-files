REM ********************************************************************************
REM										CreateReleaseBranch.bat
REM Creates a release branch starting with "release-" for both the frontend and 
REM backend projects
REM
REM prerequisits: setting up the location of the frontend and backend & git
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%

::inputs
:inputs
if "%_human_or_batch%" equ "" (
set /P _release_version=new version:

goto defaults
)
:: else, get the inputs from the parameters
set _release_version=%1
set _isPause=false

::defaults
:defaults
if "%_release_version%" equ "" (
echo You must input a version number
goto inputs
)

::operations
REM Creating git branch on frontend
%frontend_directory%:
cd %frontend_secondary_source_code%
call git checkout master --force
call git pull --force
call git checkout -b release-%_release_version%
call git push --set-upstream origin release-%_release_version%

REM Creating git branch on backend
%backend_directory%:
cd %backend_primary_source_code%
call git checkout master --force
call git pull --force
call git checkout -b release-%_release_version%
call git push --set-upstream origin release-%_release_version%

if %_isPause% equ true pause