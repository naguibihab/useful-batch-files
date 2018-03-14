# useful-batch-files
A bunch of useful batch files for everyday frontend and backend development jobs.

## Usage 

### IMPORTANT PREREQUSITE:
You must setup an environment variable by the name **BATCHLOCATION** pointing to the directory that contains these batch files

### Seting up the SetupEnv.bat
Start by exploring SetupEnv.bat file in the root and adding in your values, there might be a lot of variables in there that you won't need, don't feel like you have to fill in everything.

If you have any questions about using the files for your own development environment tweet me @naguibihab

## Contribution

Feel free to fork and contribute to that repo

### To create a new batch file use this template:
```
REM ********************************************************************************
REM										FileNameHere.bat
REM Explain the batch file here
REM
REM prerequisits: Any prerequisits type them here
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
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
:: REPLACE ME if "%_local_variables_must_start_with_underscore%" equ "" (
:: REPLACE ME set _local_variables_must_start_with_underscore=defaultValue
:: REPLACE ME )

::operations
:: REPLACE ME Your code here

if "%_isPause%" equ "true" pause
```

### If your batch file doesn't require any inputs then use this smaller version
```
REM ********************************************************************************
REM										FileNameHere.bat
REM Explain the batch file here
REM
REM prerequisits: Any prerequisits type them here
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _isPause=%isPause%

::operations
:: REPLACE ME Your code here

if "%_isPause%" equ "true" pause
```