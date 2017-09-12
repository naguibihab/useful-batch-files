# useful-batch-files
A bunch of useful batch files for everyday development jobs.
Especially useful for:
- Angular Development:
    - Bower install
	- Grunt build
	- Copy dist folder after build
- Common AWS tasks
    - Upload to S3
	- Invalidate CloudFront
	- Stop & Start RDS
- General
	- Copy folder & append to its name
	- Open git at a particular location
	
Feel free to fork and contribute to that repo

### To create a new batch file use this template:
```
REM ********************************************************************************
REM Explain the batch file here
REM
REM prerequisits: Any prerequisits type them here
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call ../SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%

::inputs
if "%_human_or_batch%" equ "" (
set /P _local_variables_must_start_with_underscore=question to user:

goto defaults
)
:: else, get the inputs from the parameters
set _local_variables_must_start_with_underscore=%1

::defaults
:defaults
if "_local_variables_must_start_with_underscore" equ "" (
set _local_variables_must_start_with_underscore=defaultValue
)

::operations
Your code here

if %_isPause% equ true pause
```