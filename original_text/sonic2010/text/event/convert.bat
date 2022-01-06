@echo off

@call _1_Xml2Xtb.bat
@call _2_Xml2Evs.bat
@call _3_Data2Arc_All.bat

@if exist xtb rd /q /s xtb
@if exist evs rd /q /s evs

@pause