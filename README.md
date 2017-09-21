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
	
You can run any of these batch files manually and enter the inputs as they come up or by calling the batch file in cmd and passing the inputs as parameters, i.e. `D:\Dev\useful-batch-files\angular\CheckoutBuild.bat master`
	
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
call %locationOfBatch%\SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%

::inputs
if "%_human_or_batch%" equ "" (
:: REPLACE ME set /P _local_variables_must_start_with_underscore=question to user:

goto defaults
)
:: else, get the inputs from the parameters
:: REPLACE ME set _local_variables_must_start_with_underscore=%1
set _isPause=false

::defaults
:defaults
:: REPLACE ME if "_local_variables_must_start_with_underscore" equ "" (
:: REPLACE ME set _local_variables_must_start_with_underscore=defaultValue
:: REPLACE ME )

::operations
:: REPLACE ME Your code here

if %_isPause% equ true pause
```

### If your batch file doesn't require any inputs then use this smaller version
```
REM ********************************************************************************
REM Explain the batch file here
REM
REM prerequisits: Any prerequisits type them here
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %locationOfBatch%\SetupEnv.bat
)
set _isPause=%isPause%

::operations
:: REPLACE ME Your code here

if %_isPause% equ true pause
```