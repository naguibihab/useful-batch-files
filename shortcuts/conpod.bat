::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)

:: read current namespace
set /p _namespace=<%kubernetes_namespace%

k exec -it %1 bash