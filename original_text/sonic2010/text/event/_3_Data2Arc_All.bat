@echo off

for %%I in (evs\Japanese\ev_seq_*.orc) do (
	for /F "tokens=3 delims=_" %%J in ("%%~nI") do (
		call _Data2Arc_xxx.bat %%J
		)
	)
)

pause