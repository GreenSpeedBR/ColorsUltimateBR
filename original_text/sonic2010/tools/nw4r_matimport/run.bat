@echo off
rem **********************************************************
rem * マテリアルインポートツール
rem **********************************************************


rem **********************************************************
rem *
rem * 不具合があるならここのパス指定を変更してください
rem *
rem **********************************************************
set NW4R_MATIMPORT=
set INPUT_RMDL=in_rmdl
set OUTPUT_RMDL=out_rmdl
set R3MT_ROOT=..\..\artworks\material
set ERROR_TXT=error.txt


%~d0
cd %~dp0

if "%~1"=="" goto ALL

rem *****************************************
rem * 指定パス以下を全処理
rem *****************************************
:LOOP_TOP
if "%~1"=="" goto END
nw4r_matimport.exe --sonic2010-opts --volume-culling on --import-r3mt "%R3MT_ROOT%" -o "%~1" "%~1" 2> %ERROR_TXT%
if ERRORLEVEL 1 goto ERROR
shift
goto LOOP_TOP


rem *****************************************
rem * 入力されたパスを全処理
rem *****************************************
:ALL
nw4r_matimport.exe --sonic2010-opts --volume-culling on --import-r3mt "%R3MT_ROOT%" -o "%OUTPUT_RMDL%" "%INPUT_RMDL%" 2> %ERROR_TXT%
if ERRORLEVEL 1 goto ERROR
goto END


:ERROR
echo エラーが発生しました
echo カレントフォルダに作成された %ERROR_TXT% を釜井の方まで提出してください。
goto END

:END
type %ERROR_TXT%
pause
