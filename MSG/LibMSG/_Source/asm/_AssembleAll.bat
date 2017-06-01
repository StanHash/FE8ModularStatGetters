@echo off

rem _AssembleAll.bat: Calls _AssembleARM.bat for all .s files in folder & subfolders

set FILE_MATCH=*.s
set ASSEMBLE_BAT=%~dp0_AssembleARM.bat

for /R %%F in (%FILE_MATCH%) do (
	echo Assembling "%%~nxF" to "%%~nF.bin"...
	cd %%~dpF
	(echo: | (call %ASSEMBLE_BAT% %%~nxF)) > nul
)

pause > nul
