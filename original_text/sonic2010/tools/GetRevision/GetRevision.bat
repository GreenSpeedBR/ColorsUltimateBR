@echo off

echo ���r�W���������擾���Ă��܂�...

setlocal
set SRC=%SONIC2010_ROOT%\Sonic2010\tools\GetRevision\Revision.h.template
set DST=%SONIC2010_ROOT%\Sonic2010\build\main\src\Revision.h

SubWCRev %SONIC2010_ROOT% %SRC% %DST%

endlocal
