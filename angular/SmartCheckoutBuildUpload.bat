REM ********************************************************************************
REM							SmartCheckoutBuildUpload.bat
REM This file does exactly what CheckoutBuildUpload does but smarter as it doesn't 
REM require you to enter in the bucket or distribution but instead uses the 
REM environments that you have saved in SetupEnv
REM
REM prerequisits: git, bower, grunt, aws cli & access, CheckoutBuild.bat
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%

::inputs
if "%_human_or_batch%" equ "" (
set /P _branch_name=Hey Man, what branch do you want to build:
set /P _env=Enviroment [d]evelopment [s]taging or [p]roduction:

goto defaults
)
:: else, get the inputs from the parameters
set _branch_name=%1
set _env=%2
set _isPause=false

::defaults
:defaults
if "%_env%" equ "" (
set _env=d
)

::operations
if /I %_env% equ d (
set _s3_bucket=%dev_s3_bucket%
set _url=%dev_url%
set _cf_distribution_id=%dev_cf_distribution_id%
)
if /I %_env% equ s (
set _s3_bucket=%stg_s3_bucket%
set _url=%stg_url%
set _cf_distribution_id=%stg_cf_distribution_id%
)
if /I %_env% equ p (
set _confirm_prod=n
echo Uploading to production, press any key to confirm.
pause
set _s3_bucket=%prod_s3_bucket%
set _url=%prod_url%
set _cf_distribution_id=%prod_cf_distribution_id%
)

call %BATCHLOCATION%\angular\CheckoutBuildUpload.bat %_branch_name% %_s3_bucket% %_cf_distribution_id% %_url%

if "%_isPause%" equ "true" pause