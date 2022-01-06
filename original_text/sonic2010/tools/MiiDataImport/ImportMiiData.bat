@echo off

REM ************************************************************
REM * Revolution SDK - Environment 
REM ************************************************************
REM *
REM * Please specify your installation paths here:
REM *
REM ************************************************************

SET REVOLUTION_SDK_ROOT=C:\RVL_SDK
SET CYGWIN_PATH=C:\cygwin

SET SONIC2010=.

REM ************************************************************
REM *
REM * DO NOT MODIFY BELOW HERE ---------------------------------
REM *
REM ************************************************************

SET PATH=%REVOLUTION_SDK_ROOT%\X86\bin;%PATH%
SET ODEMUSDKBIN=%NDEV_TOOLS%

REM ************************************************************

IF NOT EXIST %ODEMUSDKBIN%\odemu_exi2_comm.dll copy %ODEMUSDKBIN%\ndev_exi2_comm.dll %ODEMUSDKBIN%\odemu_exi2_comm.dll
IF NOT EXIST %ODEMUSDKBIN%\OdemRun.dll copy %ODEMUSDKBIN%\NdevRun.dll %ODEMUSDKBIN%\OdemRun.dll

SETLOCAL

FOR %%A IN (%ODEMUSDKBIN%\odemu_exi2_comm.dll) DO SET FILE_A_DATE=%%~tA
FOR %%B IN (%ODEMUSDKBIN%\ndev_exi2_comm.dll) DO SET FILE_B_DATE=%%~tB
IF NOT "%FILE_A_DATE%".=="%FILE_B_DATE%". copy %ODEMUSDKBIN%\ndev_exi2_comm.dll %ODEMUSDKBIN%\odemu_exi2_comm.dll

FOR %%A IN (%ODEMUSDKBIN%\OdemRun.dll) DO SET FILE_A_DATE=%%~tA
FOR %%B IN (%ODEMUSDKBIN%\NdevRun.dll) DO SET FILE_B_DATE=%%~tB
IF NOT "%FILE_A_DATE%".=="%FILE_B_DATE%". copy %ODEMUSDKBIN%\NdevRun.dll %ODEMUSDKBIN%\OdemRun.dll

ENDLOCAL

REM ************************************************************



@echo ==========================================================
@echo Welcome to the Nintendo Revolution SDK Environment
@echo ==========================================================
@echo Environment initialized for this session only. 
@echo ----------------------------------------------------------
@echo Command-line utilities:
@echo ----------------------------------------------------------
@echo rvl_ide.sh................Invoke CodeWarrior IDE/Debugger.
@echo ndrun (elf file)..........Load/run (elf file) on NDEV.
@echo ndstop....................Stop application.
@echo getndenv..................Display NDEV variables.
@echo setndenv DvdRoot "path"...Set DvdRoot to "path". 
@echo ----------------------------------------------------------
%CYGWIN_PATH%\bin\bash --login -i setfirmware 56
%CYGWIN_PATH%\bin\bash --login -i setsmem2size 128

@if ERRORLEVEL 9009 GOTO END

start /B /D "%NW4R_ROOT%\McsServer" McsServer.exe --connect=NDEV

ODEM -r -l RFLUtility.gcm

:END
@pause

%CYGWIN_PATH%\bin\bash --login -i ndstop
