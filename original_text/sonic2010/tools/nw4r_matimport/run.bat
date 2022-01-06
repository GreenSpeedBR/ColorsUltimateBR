@echo off
rem **********************************************************
rem * �}�e���A���C���|�[�g�c�[��
rem **********************************************************


rem **********************************************************
rem *
rem * �s�������Ȃ炱���̃p�X�w���ύX���Ă�������
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
rem * �w��p�X�ȉ���S����
rem *****************************************
:LOOP_TOP
if "%~1"=="" goto END
nw4r_matimport.exe --sonic2010-opts --volume-culling on --import-r3mt "%R3MT_ROOT%" -o "%~1" "%~1" 2> %ERROR_TXT%
if ERRORLEVEL 1 goto ERROR
shift
goto LOOP_TOP


rem *****************************************
rem * ���͂��ꂽ�p�X��S����
rem *****************************************
:ALL
nw4r_matimport.exe --sonic2010-opts --volume-culling on --import-r3mt "%R3MT_ROOT%" -o "%OUTPUT_RMDL%" "%INPUT_RMDL%" 2> %ERROR_TXT%
if ERRORLEVEL 1 goto ERROR
goto END


:ERROR
echo �G���[���������܂���
echo �J�����g�t�H���_�ɍ쐬���ꂽ %ERROR_TXT% ������̕��܂Œ�o���Ă��������B
goto END

:END
type %ERROR_TXT%
pause
