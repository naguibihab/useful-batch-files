@echo off
:: General setup
:: In order for that file not to be called twice we set this to true (Don't change this unless you know what you're doing)
SET isSetupCalled=true

:: To pause or not after running a batch file
SET isPause=true

:: The base directory where your source code is located
SET directory=D

:: The folders where your primary & secondary source code is located
:: I like to have two source code folders, if you don't then just have them pointing to the same folder
SET primary_source_code=\Dev\App
SET secondary_source_code=\Dev\App2


:::::::::::::::::::::::::::::::::::::::::::: XAMPP :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using XAMPP then set these up
:: Your destination folder
SET base_destination=C:\xampp\htdocs

:: The base url that is pointing to your destination folder (in most cases it's localhost)
SET base_url=http://10.0.2.65


:::::::::::::::::::::::::::::::::::::::::: Angular :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using angular set these up
:: The folder where you built code is copied
SET build_file=dist


:::::::::::::::::::::::::::::::::::::::::: AWS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: If you're using AWS and have the CLI installed then set these up
:: Make sure that your AWS CLI is setup with your IAM access credentials

::::::: S3 ::::::::
:: dev_s3_bucket is considered the default bucket in all batch files
SET dev_s3_bucket=dev.edquire.com

::::::: Cloud Front ::::::
set dev_cf_distribution_id=E24K1KWDFJPC0K