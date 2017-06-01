@echo off

set SOURCEFILE=TestBuild.event
set CLEANROM=FE8_U.gba
set OUTPUTROM=MSG_TEST.gba

cd %~dp0
(copy "%CLEANROM%" "%OUTPUTROM%") > nul

cd "%~dp0EventAssembler"
Core A FE8 "-output:%~dp0%OUTPUTROM%" "-input:%~dp0%SOURCEFILE%"

pause
