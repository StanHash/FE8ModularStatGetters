@echo off

call %~dp0bat\PrintEAHeader.bat MSG_INSTALL_CORE_EVENT

type bits\FE8Check.bit.event

echo #include "CoreDefinitions.event"
echo:

echo #include "3rdParty/InjectMovGetters.event"
echo #include "3rdParty/InjectConGetters.event"
echo:

type bits\InjectGetters.bit.event

echo ALIGN 4
echo:

bin2ea "asm\core\CallSequence.bin" --to-stdout -short -label prCallSequence
echo:

rem TODO: maybe inject those in place of the old getters? depends on size I guess
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prMaxHPGetter -after "POIN prCallSequence pMaxHPModifiers"
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prCurHPGetter -after "POIN prCallSequence pCurHPModifiers"
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prPowGetter   -after "POIN prCallSequence pPowerModifiers"
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prSklGetter   -after "POIN prCallSequence pSkillModifiers"
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prSpdGetter   -after "POIN prCallSequence pSpeedModifiers"
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prDefGetter   -after "POIN prCallSequence pDefenseModifiers"
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prResGetter   -after "POIN prCallSequence pResistanceModifiers"
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prLckGetter   -after "POIN prCallSequence pLuckModifiers"
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prAidGetter   -after "POIN prCallSequence pAidModifiers"
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prConGetter   -after "POIN prCallSequence pConModifiers"
echo:

bin2ea --to-stdout -short "asm\core\SSMovGetterWrapper.bin" -label prStatScreenMovGetter
bin2ea --to-stdout -short "asm\core\GetterWrapper.bin" -label prMovGetter   -after "POIN prCallSequence pMovModifiers"
echo:

call %~dp0bat\PrintEAFooter.bat MSG_INSTALL_CORE_EVENT
