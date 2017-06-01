@echo off

call %~dp0bat\PrintEAHeader.bat MSG_CORE_DEFINITIONS_EVENT

type bits\FE8Check.bit.event

echo // Actually I don't seem to find anything that would fit here
echo // So I guess I'll define the version number
echo:

echo #define MSG_VERSION_MAJOR 2
echo #define MSG_VERSION_MINOR 0
echo #define MSG_VERSION_PATCH 0
echo:

echo #define MSG_VERSION_STRING "MSG_VERSION_MAJOR.MSG_VERSION_MINOR.MSG_VERSION_PATCH"
echo:

call %~dp0bat\PrintEAFooter.bat MSG_CORE_DEFINITIONS_EVENT
