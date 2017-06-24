@echo off

call %~dp0bat\PrintEAHeader.bat MSG_CORE_DEFINITIONS_EVENT

type bits\FE8Check.bit.event

bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -define "rGetterWrapper(aplprRoutineList)" -after "POIN prCallSequence aplprRoutineList"
bin2ea --to-stdout -short "asm\core\BCWrapper.bin"     -define "rBCWrapper"
bin2ea --to-stdout -short "asm\core\GetWrapper.bin"    -define "rGetWrapper"
echo:

type bits\CoreHelpers.bit.event

call %~dp0bat\PrintEAFooter.bat MSG_CORE_DEFINITIONS_EVENT
