@echo off
set HOME=%~dp0
echo %HOME%
start "dummy" /b "%HOME%vim91\gvim.exe"  %*
