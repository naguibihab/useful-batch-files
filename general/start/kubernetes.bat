REM ********************************************************************************
REM										Kubernetes.bat
REM Starts up your Kubernetes
REM
REM prerequisits: Having kubectl setup and connected to your remote cluster
REM ********************************************************************************

::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)
set _isPause=%isPause%

::operations
start "Kubernetes" kubectl proxy

start "" "http://127.0.0.1:8001/ui"

if "%_isPause%" equ "true" pause