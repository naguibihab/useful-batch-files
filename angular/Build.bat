REM ********************************************************************************
REM As opposed to CheckoutBuild.bat this file builds the primary frontend sourcecode
REM and copies it to the targeted location without checking out from git.
REM I use that to build code that I don't want to commit
REM
REM If you're working remotely and want to upload the code to a server checkout
REM the batch file "CheckoutBuildUpload" which uploads to S3
REM
REM prerequisits: git, bower, grunt
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call ../SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%

::inputs
:: check if its called by human or by another batch file
if "%_human_or_batch%" equ "" (
set /P _branch_name=Branch: 
goto defaults
)
:: else, get the inputs from the parameters
set _branch_name=%1
set _isPause=false

::defaults
:defaults
:: No defaults in that file, but I'm keeping that for consistency

::operations
echo moving to %frontend_directory%:%frontend_primary_source_code%
%frontend_directory%:
cd %frontend_primary_source_code%

echo building...
call grunt build

xcopy "%build_folder%" "%base_destination%\%_branch_name%" /s/e/c/y/f

start "" %base_url%/%_branch_name%

if %_isPause% equ true pause