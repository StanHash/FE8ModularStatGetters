@echo off

call %~dp0bat\PrintEAHeader.bat MSG_CORE_DEFINITIONS_EVENT

type bits\FE8Check.bit.event

bin2ea --to-stdout -short "asm\core\ModifyBCAttack.bin"    -define "rModifyBCAttack"
bin2ea --to-stdout -short "asm\core\ModifyBCDefense.bin"   -define "rModifyBCDefense"
bin2ea --to-stdout -short "asm\core\ModifyBCAS.bin"        -define "rModifyBCAS"
bin2ea --to-stdout -short "asm\core\ModifyBCHit.bin"       -define "rModifyBCHit"
bin2ea --to-stdout -short "asm\core\ModifyBCAvoid.bin"     -define "rModifyBCAvoid"
bin2ea --to-stdout -short "asm\core\ModifyBCCrit.bin"      -define "rModifyBCCrit"
bin2ea --to-stdout -short "asm\core\ModifyBCDodge.bin"     -define "rModifyBCDodge"
bin2ea --to-stdout -short "asm\core\ModifyBCLethality.bin" -define "rModifyBCLethality"

type bits\CoreHelpers.bit.event

call %~dp0bat\PrintEAFooter.bat MSG_CORE_DEFINITIONS_EVENT
