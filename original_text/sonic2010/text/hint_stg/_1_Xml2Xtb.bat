@echo off

if exist xtb rd /s/q xtb
md xtb

..\..\tools\xTextViewer\xTextViewer.exe /finish /output:xtb /input:hint.xml
