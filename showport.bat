@echo off
set /p lport=please input the port:
rem for /f %%i in ('netstat -noa|findstr %lport%') do set lpid=%lpid%,%%i
netstat -noa|findstr %lport%>>port
set lpid=
setlocal enabledelayedexpansion
for /f "tokens=4" %%i in (port) do set lpid=%%i
for /f "delims=," %%i in ("%lpid%") do (tasklist|findstr %%i)
endlocal
pause