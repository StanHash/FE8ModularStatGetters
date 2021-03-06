@echo off

set INSTALL_FOLDER=%~dp0..\MSG\

rem Allows us to call fart and bin2ea from anywhere
set PATH=%~dp0bin;%PATH%

rem Step 1: Generating & Assembling ASM

cd %~dp0asm

(echo: | (call Prepare.bat)) > nul 2> nul
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
	
	HelperDefinitions
	InstallHelpers
) do (
	echo Generating "%%F.event"...
	call %%F.make.bat > "%INSTALL_FOLDER%%%F.event"
)

cd %~dp0asm
echo: | (call _ClearAllBIN.bat)
echo:

cd %~dp0

echo:
echo Generation Done!
pause
