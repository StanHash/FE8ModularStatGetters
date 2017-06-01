@echo off

call %~dp0bat\PrintEAHeader.bat MSG_INSTALL_CORE_BLRANGE_EVENT

type bits\FE8Check.bit.event
type bits\BLRangeCheck.bit.event

echo #include "CoreDefinitions.event"
echo:

echo #include "3rdParty/InjectMovGetters.event"
echo #include "3rdParty/InjectConGetters.event"
echo:

echo prGotoMovGetter: replaceWithHack(prMovGetter)
echo prGotoConGetter: replaceWithHack(prConGetter)

call %~dp0bat\PrintEAFooter.bat MSG_INSTALL_CORE_BLRANGE_EVENT
