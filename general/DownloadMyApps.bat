@echo off
SET app_list=config/app_list.txt
SET CURRENTDIR="%cd%"
SET app_path=%CURRENTDIR%/apps

mkdir %app_path%

for /f %%i in (%app_list%) do (
    echo "Downloading %%i..."
    cd %app_path%
    curl %%i -LO > nul
)

cd %app_path%
dir /b > zdownload_list.txt
for /f %%i in (zdownload_list.txt) do (
    echo "Installing %%i"
    %app_path%\%%i /S
)
