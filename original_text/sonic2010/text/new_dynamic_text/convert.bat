@echo off

@if exist xtb rd /s/q xtb
@md xtb

..\..\tools\xTextViewer\xTextViewer.exe /finish /output:xtb /input:new_dynamic_text.xml
..\..\tools\xTextViewer\xTextViewer.exe /finish /output:xtb /input:achievement_dynamic_text.xml

@if exist __local__ rd /s/q __local__
@md __local__

@copy /y /b xtb\Japanese\new_dynamic_text_text.xtb __Local__\new_dynamic_text_j.xtb
@copy /y /b xtb\English\new_dynamic_text_text.xtb __Local__\new_dynamic_text_e.xtb
@copy /y /b xtb\French\new_dynamic_text_text.xtb __Local__\new_dynamic_text_f.xtb
@copy /y /b xtb\German\new_dynamic_text_text.xtb __Local__\new_dynamic_text_g.xtb
@copy /y /b xtb\Italian\new_dynamic_text_text.xtb __Local__\new_dynamic_text_i.xtb
@copy /y /b xtb\Spanish\new_dynamic_text_text.xtb __Local__\new_dynamic_text_s.xtb
@copy /y /b xtb\ChineseSimplified\new_dynamic_text_text.xtb __Local__\new_dynamic_text_chs.xtb
@copy /y /b xtb\ChineseTraditional\new_dynamic_text_text.xtb __Local__\new_dynamic_text_cht.xtb
@copy /y /b xtb\Korean\new_dynamic_text_text.xtb __Local__\new_dynamic_text_k.xtb
@copy /y /b xtb\Russian\new_dynamic_text_text.xtb __Local__\new_dynamic_text_r.xtb
@copy /y /b xtb\Polish\new_dynamic_text_text.xtb __Local__\new_dynamic_text_p.xtb

@copy /y /b xtb\Japanese\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_j.xtb
@copy /y /b xtb\English\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_e.xtb
@copy /y /b xtb\French\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_f.xtb
@copy /y /b xtb\German\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_g.xtb
@copy /y /b xtb\Italian\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_i.xtb
@copy /y /b xtb\Spanish\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_s.xtb
@copy /y /b xtb\ChineseSimplified\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_chs.xtb
@copy /y /b xtb\ChineseTraditional\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_cht.xtb
@copy /y /b xtb\Korean\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_k.xtb
@copy /y /b xtb\Russian\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_r.xtb
@copy /y /b xtb\Polish\achievement_dynamic_text_text.xtb __Local__\achievement_dynamic_text_p.xtb

..\..\tools\darch -c __Local__  -tvV new_dynamic_text.arc

@copy /y /b new_dynamic_text.arc ..\..\dvd_builder_image\sonic2010

@if exist new_dynamic_text.arc del new_dynamic_text.arc

@if exist __local__ rd /s/q __local__

@pause
