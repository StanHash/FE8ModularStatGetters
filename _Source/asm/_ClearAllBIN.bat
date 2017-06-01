@echo off

rem _ClearAll.bat

for /R %%F in (*.elf) do (
	(echo y | del %%F) > nul
)

for /R %%F in (*.bin) do (
	echo Deleting "%%~nxF"...
	(echo y | del %%F) > nul
)

pause > nul
