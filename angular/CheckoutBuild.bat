REM ********************************************************************************
REM								CheckoutBuild.bat
REM I use that bat file when someone asks me to build them a particular branch
REM it goes to the secondary source code (in case i'm in the middle of something
REM and don't want to commit or stash) fetches from git, checksout the branch
REM pulls it by force (it will overwrite any uncommitted changes but that folder
REM shouldn't be used to write code anyway) installs any new dependencies from
REM bower and then builds and copies that build to my xampp folder where I
REM have a local ip address pointing to it so others on the same network can see
REM it and test it. Eventually it opens a new browser tab with that url.
REM
REM If you're working remotely and want to upload the code to a server checkout
REM the batch file "CheckoutBuildUpload" which uploads to S3
REM
REM prerequisits: git, bower, grunt
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
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
echo moving to %frontend_directory%:%frontend_secondary_source_code%
%frontend_directory%:
cd %frontend_secondary_source_code%

echo getting branch %_branch_name%
call git fetch --all
call git checkout %_branch_name% --force
call git pull --force

echo building...
call bower install
call grunt build

xcopy "%build_folder%" "%base_destination%\%_branch_name%" /s/e/c/y/f

start "" %base_url%/%_branch_name%

if %_isPause% equ true pause