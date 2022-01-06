@echo off

SET EVENT_EVS_DIR=evs
SET EVENT_XTB_DIR=xtb
SET EVENT_OUT_DIR=..\..\dvd_builder_image\sonic2010\event
SET EVENT_TOOL_ARC=..\..\tools\darch.exe

echo ##### %1 START #####
rem ## ���{�� ##
SET EVENT_LANG=Japanese
SET EVENT_LANG_SEP=j

if exist __tmp__ rd /s/q __tmp__
md __tmp__

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb

rem ## English ##
SET EVENT_LANG=English
SET EVENT_LANG_SEP=e

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb

rem ## French ##
SET EVENT_LANG=French
SET EVENT_LANG_SEP=f

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb

rem ## Italian ##
SET EVENT_LANG=Italian
SET EVENT_LANG_SEP=i

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb

rem ## German ##
SET EVENT_LANG=German
SET EVENT_LANG_SEP=g

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb

rem ## Spanish ##
SET EVENT_LANG=Spanish
SET EVENT_LANG_SEP=s

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb

rem ## Chinese Traiditional ##
SET EVENT_LANG=ChineseTraditional
SET EVENT_LANG_SEP=cht

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb

rem ## Chinese Simplified ##
SET EVENT_LANG=ChineseSimplified
SET EVENT_LANG_SEP=chs

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb

rem ## Korean ##
SET EVENT_LANG=Korean
SET EVENT_LANG_SEP=k

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb

rem ## Russian ##
SET EVENT_LANG=Russian
SET EVENT_LANG_SEP=r

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb

rem ## Polish ##
SET EVENT_LANG=Polish
SET EVENT_LANG_SEP=p

copy /y %EVENT_EVS_DIR%\%EVENT_LANG%\*_%1.orc __tmp__\*_%1_%EVENT_LANG_SEP%.orc
copy /y %EVENT_XTB_DIR%\%EVENT_LANG%\*_%1.xtb __tmp__\*_%1_%EVENT_LANG_SEP%.xtb


%EVENT_TOOL_ARC% -c __tmp__ -tvV %EVENT_OUT_DIR%\%1_seq.arc


if exist __tmp__ rd /s/q __tmp__

