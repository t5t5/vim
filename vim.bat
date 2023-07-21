@echo off
set HOME=%~dp0
echo %HOME%
if "%ConEmuHooks%" == "Enabled" (
    set add_arg=-new_console:o:n:h0
) else (
    set add_arg=
)
"%HOME%vim90\vim.exe" %add_arg% %*
