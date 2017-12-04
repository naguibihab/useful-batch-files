REM ********************************************************************************
REM								StopStartRDS.bat
REM This file starts or stops your RDS instances
REM
REM prerequisits: aws cli & access
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%

::inputs
if "%_human_or_batch%" equ "" (
set /P _start_or_stop=Would you like to [1]start or [2]stop these instances %rds_list%

goto defaults
)
:: else, get the inputs from the parameters
set _start_or_stop=%1

::defaults
:defaults
if "_start_or_stop" equ "" (
set _start_or_stop=1
)

::operations
:retryaction
IF %_start_or_stop%==1 (
    set _command=start
    goto :start
)
IF %_start_or_stop%==2 (
    set _command=stop
    goto :start
)

goto :retryaction

:start
(for %%a in (%rds_list%) do (
    call aws rds %_command%-db-instance --db-instance-identifier %%a
))

if "%_isPause%" equ "true" pause