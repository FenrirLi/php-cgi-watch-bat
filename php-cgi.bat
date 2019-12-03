@echo off

set _task=php-cgi.exe
set _cmd=cmd /k "D: && D:\environment\php7.3.10\php-cgi.exe -b 9000"

:checkstart
for /f "tokens=5" %%n in ('qprocess.exe ^| find "%_task%" ') do (
 if %%n==%_task% (goto checkag) else goto startsvr
)

:startsvr
echo ********start at %time%********
echo restarted at %time% ,please check out >> restart_service.txt
start %_cmd%
echo Wscript.Sleep WScript.Arguments(0) >%tmp%\delay.vbs 
cscript //b //nologo %tmp%\delay.vbs 2000 
echo ********finished********
goto checkstart


:checkag
echo %time% processing,check after 10 seconds.. 
echo Wscript.Sleep WScript.Arguments(0) >%tmp%\delay.vbs 
cscript //b //nologo %tmp%\delay.vbs 10000 
goto checkstart