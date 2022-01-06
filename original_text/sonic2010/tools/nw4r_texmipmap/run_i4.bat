@echo off
rem **********************************************************
rem * 自動ミップマップ生成ツール
rem **********************************************************


rem **********************************************************
rem *
rem * TGAファイル出力フォルダ
rem *
rem **********************************************************
set OUTPUT_TGA=out_tga

rem **********************************************************
rem *
rem * rtexファイル出力フォルダ
rem *
rem **********************************************************
set OUTPUT_RTEX=out_rtex

rem **********************************************************
rem *
rem * フォーマット
rem *
rem **********************************************************
set FORMAT=i4

rem **********************************************************
rem *
rem * ミップレベル（0指定で生成可能最大レベルまで生成）
rem *
rem **********************************************************
set LEVEL=0



rem **********************************************************
rem * ここから処理
rem **********************************************************
%~d0
cd %~dp0

pushd "%OUTPUT_RTEX%"
del /f /q *.rtex
popd

del /f /q error.txt

if "%~1"=="" goto ALL

pushd "%OUTPUT_TGA%"
del /q *.tga
popd

:LOOP_TOP
if "%~1"=="" goto NEXT
nw4r_texmipmap.exe --verbose -l %LEVEL% -f %FORMAT% --overwrite -o "%OUTPUT_TGA%" "%~1" 2>> error.txt
if ERRORLEVEL 1 goto ERROR_MIPMAP
shift
goto LOOP_TOP

:NEXT
%NW4R_ROOT%\CommandLineTools\bin\nw4r_texcvtr.exe -o "%OUTPUT_RTEX%" "%OUTPUT_TGA%"
if ERRORLEVEL 1 goto ERROR_TEXCONV
goto END

:ALL
nw4r_texmipmap.exe --verbose -l %LEVEL% -f %FORMAT% --overwrite -o "%OUTPUT_TGA%" "%OUTPUT_TGA%" 2>> error.txt
if ERRORLEVEL 1 goto ERROR_MIPMAP
"%NW4R_ROOT%\CommandLineTools\bin\nw4r_texcvtr.exe" -o "%OUTPUT_RTEX%" "%OUTPUT_TGA%"
if ERRORLEVEL 1 goto ERROR_TEXCONV
goto END


:ERROR_MIPMAP
echo ミップマップ作成に失敗しました。
echo カレントフォルダにある error.txt を釜井の方まで提出してください。
goto END

:ERROR_TEXCONV
echo rtexファイル作成に失敗しました。
goto END

:END
pause
