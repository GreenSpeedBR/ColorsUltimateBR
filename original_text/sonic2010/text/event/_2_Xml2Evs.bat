@echo off

if exist evs rd /s/q evs
md evs

REM ..\..\tools\eventconv.exe -o=evs -i=ev_seq_j.xml
REM ..\..\tools\eventconv.exe -o=evs -i=ev_seq_e.xml
..\..\tools\eventconv.exe -o=evs -i=ev_seq.xml
pause
for /R %%I in (*.src) do (
	@echo binarc.exe -l %%~I %%~dpI%%~nI.orc
	..\..\tools\binarc.exe -l %%~I %%~dpI%%~nI.orc
	del %%~I
)

pause