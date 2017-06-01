@echo off

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
