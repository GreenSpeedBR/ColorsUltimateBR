@echo off
rem **********************************************************
rem * �����~�b�v�}�b�v�����c�[��
rem **********************************************************


rem **********************************************************
rem *
rem * TGA�t�@�C���o�̓t�H���_
rem *
rem **********************************************************
set OUTPUT_TGA=out_tga

rem **********************************************************
rem *
rem * rtex�t�@�C���o�̓t�H���_
rem *
rem **********************************************************
set OUTPUT_RTEX=out_rtex

rem **********************************************************
rem *
rem * �t�H�[�}�b�g
rem *
rem **********************************************************
set FORMAT=i4

rem **********************************************************
rem *
rem * �~�b�v���x���i0�w��Ő����\�ő僌�x���܂Ő����j
rem *
rem **********************************************************
set LEVEL=0



rem **********************************************************
rem * �������珈��
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
echo �~�b�v�}�b�v�쐬�Ɏ��s���܂����B
echo �J�����g�t�H���_�ɂ��� error.txt ������̕��܂Œ�o���Ă��������B
goto END

:ERROR_TEXCONV
echo rtex�t�@�C���쐬�Ɏ��s���܂����B
goto END

:END
pause
