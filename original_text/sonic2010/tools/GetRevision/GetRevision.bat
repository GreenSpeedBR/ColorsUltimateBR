@echo off

echo リビジョン情報を取得しています...

setlocal
set SRC=%SONIC2010_ROOT%\Sonic2010\tools\GetRevision\Revision.h.template
set DST=%SONIC2010_ROOT%\Sonic2010\build\main\src\Revision.h

SubWCRev %SONIC2010_ROOT% %SRC% %DST%

endlocal
