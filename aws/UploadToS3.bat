REM ********************************************************************************
REM								UploadToS3.bat
REM This file uploads to an S3 bucket
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
set /P _source=Source folder: 
set /P _s3_bucket=Bucket leave empty for default: 
set /P _cf_distribution_id=Cloud Front Distribution ID leave empty for default:

goto defaults
)
:: else, get the inputs from the parameters
set _source=%1
set _s3_bucket=%2
set _cf_distribution_id=%3
set _isPause=false

::defaults
:defaults
if "%_s3_bucket%" equ "" (
set _s3_bucket=%dev_s3_bucket%
)
if "%_cf_distribution_id%" equ "" (
set _cf_distribution_id=%dev_cf_distribution_id%
)

::operations
call aws s3 cp %_source% s3://%_s3_bucket% --recursive

::if distribution-id is setup we create an invalidation
if "%_cf_distribution_id%" neq "" (
call aws cloudfront create-invalidation --distribution-id %_cf_distribution_id% --paths /*
)

echo All done, uploaded to %_s3_bucket%
if %_isPause% equ true pause