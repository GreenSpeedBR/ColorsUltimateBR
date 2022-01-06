@echo off
%~d0
cd %~dp0

@call darch.exe -tvV %%~f1

@pause