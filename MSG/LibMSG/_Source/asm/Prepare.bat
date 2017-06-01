@echo off

rem Generating ModifyBCAttack
copy "core\ModifyBCStat.s.template" "core\ModifyBCAttack.s"
fart "core\ModifyBCAttack.s" _STATOFFSET 0x5A

rem Generating ModifyBCDefense
copy "core\ModifyBCStat.s.template" "core\ModifyBCDefense.s"
fart "core\ModifyBCDefense.s" _STATOFFSET 0x5C

rem Generating ModifyBCAS
copy "core\ModifyBCStat.s.template" "core\ModifyBCAS.s"
fart "core\ModifyBCAS.s" _STATOFFSET 0x5E

rem Generating ModifyBCHit
copy "core\ModifyBCStat.s.template" "core\ModifyBCHit.s"
fart "core\ModifyBCHit.s" _STATOFFSET 0x60

rem Generating ModifyBCAvoid
copy "core\ModifyBCStat.s.template" "core\ModifyBCAvoid.s"
fart "core\ModifyBCAvoid.s" _STATOFFSET 0x62

rem Generating ModifyBCCrit
copy "core\ModifyBCStat.s.template" "core\ModifyBCCrit.s"
fart "core\ModifyBCCrit.s" _STATOFFSET 0x66

rem Generating ModifyBCDodge
copy "core\ModifyBCStat.s.template" "core\ModifyBCDodge.s"
fart "core\ModifyBCDodge.s" _STATOFFSET 0x68

rem Generating ModifyBCLethality
copy "core\ModifyBCStat.s.template" "core\ModifyBCLethality.s"
fart "core\ModifyBCLethality.s" _STATOFFSET 0x6C

rem Generating ForWord
copy "helpers\load\template\Word.s.template" "helpers\load\ForWord.s"
fart "helpers\load\ForWord.s" _RD r1

rem Generating ForShort
copy "helpers\load\template\UShort.s.template" "helpers\load\ForShort.s"
fart "helpers\load\ForShort.s" _RD r1

rem Generating ForByte
copy "helpers\load\template\UByte.s.template" "helpers\load\ForByte.s"
fart "helpers\load\ForByte.s" _RD r1

rem Generating ForConstant
copy "helpers\load\template\Constant.s.template" "helpers\load\ForConstant.s"
fart "helpers\load\ForConstant.s" _RD r1

rem Generating ForResultOf
copy "helpers\calls\GetResultOf.s.template" "helpers\calls\ForResultOf.s"
fart "helpers\calls\ForResultOf.s" _RD r1

rem Generating ForResultOfExt
copy "helpers\calls\GetResultOfExt.s.template" "helpers\calls\ForResultOfExt.s"
fart "helpers\calls\ForResultOfExt.s" _RD r1

rem Generating WithWord
copy "helpers\load\template\Word.s.template" "helpers\load\WithWord.s"
fart "helpers\load\WithWord.s" _RD r2

rem Generating WithSByte
copy "helpers\load\template\SByte.s.template" "helpers\load\WithSByte.s"
fart "helpers\load\WithSByte.s" _RD r2

rem Generating WithUByte
copy "helpers\load\template\UByte.s.template" "helpers\load\WithUByte.s"
fart "helpers\load\WithUByte.s" _RD r2

rem Generating WithSShort
copy "helpers\load\template\SShort.s.template" "helpers\load\WithSShort.s"
fart "helpers\load\WithSShort.s" _RD r2

rem Generating WithUShort
copy "helpers\load\template\UShort.s.template" "helpers\load\WithUShort.s"
fart "helpers\load\WithUShort.s" _RD r2

rem Generating WithConstant
copy "helpers\load\template\Constant.s.template" "helpers\load\WithConstant.s"
fart "helpers\load\WithConstant.s" _RD r2

rem Generating WithResultOf
copy "helpers\calls\GetResultOf.s.template" "helpers\calls\WithResultOf.s"
fart "helpers\calls\WithResultOf.s" _RD r2

rem Generating WithResultOfExt
copy "helpers\calls\GetResultOfExt.s.template" "helpers\calls\WithResultOfExt.s"
fart "helpers\calls\WithResultOfExt.s" _RD r2

pause
