@echo off

set INSTALL_FOLDER=%~dp0..\

rem Allows us to call fart and bin2ea from anywhere
set PATH=%~dp0bin;%PATH%

rem Step 1: Generating & Assembling ASM

cd %~dp0asm

(echo: | (call Prepare.bat)) > nul 2> nul
echo:

echo: | (call _ClearAllBIN.bat)
echo:

echo: | (call _AssembleAll.bat)
echo:

echo Assembling Done!
echo:

rem Step 2: Generating & Installing EA files

cd %~dp0

for %%F in (
	CoreDefinitions
	InstallCore
	InstallCore_BLRange
	
	HelperDefinitions
	InstallHelpers
) do (
	echo Generating "%%F.event"...
	call %%F.make.bat > "%INSTALL_FOLDER%%%F.event"
)

echo:
echo Generation Done!
pause
