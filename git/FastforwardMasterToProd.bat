REM ********************************************************************************
REM								FastforwardMasterToProd.bat
REM Fast forwards the branch `master` to the branch `production`.
REM
REM prerequisits: master must not be deviated from production
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _isPause=%isPause%

::operations
%frontend_directory%:
cd %frontend_secondary_source_code%
call git checkout master --force
call git pull --force
call git merge origin/production
call git push

if "%_isPause%" equ "true" pause