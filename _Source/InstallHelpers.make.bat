@echo off

call %~dp0bat\PrintEAHeader.bat MSG_INSTALL_HELPER_EVENT

type bits\FE8Check.bit.event

echo #include "HelperDefinitions.event"
echo:

echo ALIGN 4
echo:

rem Misc Routines
bin2ea --to-stdout -short "asm\helpers\CapHPIfOverMax.bin"              -label "prCapHPIfOverMax"     -after "POIN (prMaxHPGetter ^ 1)"

rem Range Related Stuff
bin2ea --to-stdout -short "asm\helpers\range\FillRangeFromRange.bin"    -label "prFillRangeFromRange"
bin2ea --to-stdout -short "asm\helpers\range\FillRangeFromTemplate.bin" -label "prFillRangeFromTemplate"

rem Checks
bin2ea --to-stdout -short "asm\helpers\checks\CheckUnitAttribute.bin"   -label "prCheckUnitAttribute"
bin2ea --to-stdout -short "asm\helpers\checks\CheckUnitGuardAI.bin"     -label "prCheckUnitGuardAI"
bin2ea --to-stdout -short "asm\helpers\checks\CheckUnitStatus.bin"      -label "prCheckUnitStatus"
bin2ea --to-stdout -short "asm\helpers\checks\CheckUnitState.bin"       -label "prCheckUnitState"
bin2ea --to-stdout -short "asm\helpers\checks\CheckUnitsAllied.bin"     -label "prCheckUnitsAllied"
bin2ea --to-stdout -short "asm\helpers\checks\CheckUnitAllegience.bin"  -label "prCheckUnitAllegience"

type bits\HelperRoutines.bit.event

call %~dp0bat\PrintEAFooter.bat MSG_INSTALL_HELPER_EVENT
