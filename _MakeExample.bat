@echo off

set SourceEventFile=_Example.event
set SourceROMFile=FE8_U.gba
set OutROMFile=MSG_EXAMPLE.gba

cd %~dp0
(copy "%SourceROMFile%" "%OutROMFile%") > nul

cd "%~dp0_EventAssembler"
(Core A FE8 "-output:%~dp0%OutROMFile%" "-input:%~dp0%SourceEventFile%") > nul

pause
