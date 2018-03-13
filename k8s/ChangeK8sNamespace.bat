REM ********************************************************************************
REM										ChangeK8sNamespace.bat
REM Simply changes the string in config/kubernetesnamespace.txt
REM
REM prerequisits: config/kubernetesnamespace.txt must have the current environment you're 
REM working on
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _human_or_batch=%1
set _isPause=%isPause%
set _current_ns_file=%kubernetes_namespace%
:: read current namespace
set /p _namespace=<%_current_ns_file%

::inputs
if "%_human_or_batch%" equ "" (
set /P _new_namespace=Current namespace: %_namespace%. What do you want to switch to dude?  
goto defaults
)
:: else, get the inputs from the parameters
set _new_namespace=%1
set _isPause=false

::defaults
:defaults
if "%_new_namespace%" equ "" (
set _new_namespace=ci
)

::operations
echo %_new_namespace%>%_current_ns_file%

if "%_isPause%" equ "true" pause