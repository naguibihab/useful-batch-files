@echo off
rem General setup
:: To pause or not after running a batch file
SET isPause=true

:: The base directory where your source code is located
SET directory=D

:: The folders where your primary & secondary source code is located
:: I like to have two source code folders, if you don't then just have them pointing to the same folder
SET primary_source_code=\Dev\App
SET secondary_source_code=\Dev\App2

:::::::::::::::::::::::::::::::::::::::::::: XAMPP :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem If you're using XAMPP then set these up
:: Your destination folder
SET base_destination=C:\xampp\htdocs

:: The base url that is pointing to your destination folder (in most cases it's localhost)
SET base_url=http://10.0.2.65

:::::::::::::::::::::::::::::::::::::::::: Angular :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem If you're using angular set these up
:: The folder where you built code is copied
SET build_file=dist