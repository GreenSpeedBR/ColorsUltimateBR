@echo off
rem �q���g�e�L�X�g

call _1_Xml2Xtb.bat
call _2_HintLink_All.bat

set SOURCE=hint_stg
set TARGET=hint_stg

if exist tmp rd /s/q tmp
md tmp

REM JAPANESE
copy xtb\Japanese\%SOURCE%.xtb tmp > nul
copy stg\Japanese\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_j.arc

REM ENGLISH
copy xtb\English\%SOURCE%.xtb tmp > nul
copy stg\English\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_e.arc

REM GERMAN
copy xtb\German\%SOURCE%.xtb tmp > nul
copy stg\German\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_g.arc

REM FRENCH
copy xtb\French\%SOURCE%.xtb tmp > nul
copy stg\French\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_f.arc

REM SPANISH
copy xtb\Spanish\%SOURCE%.xtb tmp > nul
copy stg\Spanish\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_s.arc

REM ITALIAN
copy xtb\Italian\%SOURCE%.xtb tmp > nul
copy stg\Italian\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_i.arc

REM CHINESE TRADITIONAL
copy xtb\ChineseTraditional\%SOURCE%.xtb tmp > nul
copy stg\Japanese\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_cht.arc

REM CHINESE SIMPLIFIED
copy xtb\ChineseSimplified\%SOURCE%.xtb tmp > nul
copy stg\Japanese\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_chs.arc

REM KOREAN
copy xtb\Korean\%SOURCE%.xtb tmp > nul
copy stg\Japanese\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_k.arc

REM RUSSIAN
copy xtb\Russian\%SOURCE%.xtb tmp > nul
copy stg\English\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_r.arc

REM POLISH
copy xtb\Polish\%SOURCE%.xtb tmp > nul
copy stg\English\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_p.arc

REM ERROR
copy xtb\Error\%SOURCE%.xtb tmp > nul
copy stg\English\%SOURCE%.hdb tmp > nul
..\..\tools\darch.exe -c tmp -tvV ..\..\dvd_builder_image\sonic2010\ui\%TARGET%_err.arc

rd /s/q tmp

pause
