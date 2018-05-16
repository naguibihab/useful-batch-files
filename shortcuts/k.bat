::setup
if "%isSetupCalled%" equ "" (
call %BATCHLOCATION%/SetupEnv.bat
)

:: read current namespace
set /p _namespace=<%kubernetes_namespace%

@echo on
kubectl %1 %2 %3 %4 %5 %6 %7 %8 %9 -n %_namespace%