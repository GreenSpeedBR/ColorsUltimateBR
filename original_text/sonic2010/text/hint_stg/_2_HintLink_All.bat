@echo off

for /d %%I in (stg*) do (
	cd %%I
	call _2_HintLink.bat
	cd ..
)
