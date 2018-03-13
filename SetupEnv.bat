:: Paidright Project
@echo off
:: IMPORTANT PREREQUSITE: You must setup an environment variable by the name BATCHLOCATION pointing to the 
:: directory that contains these batch files

:: General setup
:: In order for that file not to be called twice we set this to true (Don't change this unless you know what you're doing)
SET isSetupCalled=true

:: To pause or not after running a batch file
SET isPause=false

:: The base directory where your source code is located
SET frontend_directory=C
SET backend_directory=

:: The folders where your primary & secondary source code is located
:: I like to have two source code folders, if you don't then just have them pointing to the same folder
SET frontend_primary_source_code=\Users\iha001\Dev\angular-productivity-talk
SET frontend_secondary_source_code=\Users\iha001\Dev\angular-productivity-talk_copy
SET backend_primary_source_code=
SET backend_secondary_source_code=

:: Frameworks used. We use these as prefixes in some batch files
SET frontend_framework=angular
SET backend_framework=

:: Location of the downloadable url of the apps you use and where they get downloaded
:: Set this up if you're using DownloadMyApps.bat
SET my_apps=%BATCHLOCATION%\config\myapps.txt
SET downloads=C:\Users\n.ihab\Downloads

:: Path to your log file
:: Set this up if you're using LogEveryHour.bat
SET log_file=C:\Users\n.ihab\Google Drive\Productivity\energy levels.csv

:::::::::::::::::::::::::::::::::::::::::::: XAMPP :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using XAMPP then set these up
:: Your destination folder
SET base_destination=C:\xampp\htdocs

:: The base url that is pointing to your destination folder (in most cases it's localhost)
SET base_url=http://localhost

:::::::::::::::::::::::::::::::::::::::::: Angular :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using angular set these up
:: The folder where you built code is copied
SET build_folder=dist

:: The stuff you use to install
SET installUsingNpm=false
SET installUsingYarn=true
SET installUsingBower=false

:: The stuff you use to build
SET buildUsingNg=false
SET buildUsingGrunt=false
SET buildUsingYarn=true

:::::::::::::::::::::::::::::::::::::::::: MongoDB :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using MongoDB set these up
:: Location of mongod.exe
SET mongo_bin=
:: Database directory Path
SET mongo_dbpath=

::::::::::::::::::::::::::::::::::::::::::   Go    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using Golang set these up
:: Name of binary file generated
SET go_bin=

:::::::::::::::::::::::::::::::::::::::::: AWS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using AWS and have the CLI installed then set these up
:: Make sure that your AWS CLI is setup with your IAM access credentials

::::::: S3 ::::::::
:: dev_s3_bucket is considered the default bucket in all batch files
:: Any sensetive data can be stored as an environment variable
SET dev_s3_bucket=angular-productivity-talk
SET stg_s3_bucket=%ENV_stg_s3_bucket%
SET prod_s3_bucket=%ENV_prod_s3_bucket%

::::::: Cloud Front ::::::
SET dev_cf_distribution_id=E1Z9U14FY8R05Q
SET stg_cf_distribution_id=%ENV_stg_cf_dist%
SET prod_cf_distribution_id=%ENV_prod_cf_dist%

SET dev_url=http://angular-productivity-talk.s3-website-us-west-2.amazonaws.com/
SET stg_url=%ENV_stg_url%
SET prod_url=%ENV_prod_url%

::::::: RDS ::::::
SET rds_list=

:::::::::::::::::::::::::::::::::::::::::: Kubernetes ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Set this up if you're using the kubernetes shortcuts in the shortcuts folder
SET kubernetes_namespace=

:::::::::::::::::::::::::::::::::::::::::: Operations :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Operations that happen for each batch file such as printing out the current envrionment
SET _current_env_file=%BATCHLOCATION%/config/currentenv.txt
:: Read current env
SET /p _current_env=<%_current_env_file%
echo CURRENT ENVIRONMENT: %_current_env%