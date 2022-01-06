rem @echo off

echo ##### %1 START #####

for %%I in (Japanese,English,French,Spanish,Italian,German) do (
	if exist %%I rd /s/q %%I
	md %%I
)

echo starting with XLS2CSV

..\xls2csv.vbs %1\hint_%1.xls

echo Done with XLS2CSV

for %%I in (Japanese,English,French,Spanish,Italian,German) do (
	..\..\..\tools\HintConv.exe %%I\hint_%1.csv ..\xtb\%%I\hint_%1.xtb
)

echo ##### %1 END #####
