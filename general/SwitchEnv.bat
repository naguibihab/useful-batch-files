REM ********************************************************************************
REM										SwitchEnv.bat
REM Renames the SetupEnv.bat file to the environment you want to use
REM
REM prerequisits: config/myapps.txt must have the current environment you're operations
REM if you have other environments then copy and rename your SetupEnv.bat to:
REM SetupEnv-environmenName.bat
REM ********************************************************************************

::setup (Because that file is modifying the setup file we don't import it here)
set _human_or_batch=%1
set _isPause=%isPause%
set _current_env_file=config/currentenv.txt
cd ..
:: Read current env
set /p _from_env=<%_current_env_file%

::inputs
if "%_human_or_batch%" equ "" (
set /P _env=Switch to environment [current enviroment: %_from_env%]:

goto defaults
)
:: else, get the inputs from the parameters
set _env=%1
set _isPause=false

::defaults
:defaults
if "%_env%" equ "" (
set _env=main
)

::operations

:: Rename files
ren SetupEnv.bat SetupEnv-%_from_env%.bat
ren SetupEnv-%_env%.bat SetupEnv.bat
:: Write current env
echo %_env%>%_current_env_file%

if %_isPause% equ true pause