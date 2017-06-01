@echo off

call %~dp0bat\PrintEAHeader.bat MSG_HELPER_DEFINITIONS_EVENT

type bits\FE8Check.bit.event

echo #include "CoreDefinitions.event"
echo:

type bits\FE8VanillaRoutineDefs.bit.event

bin2ea --to-stdout -short "asm\helpers\Argument.bin"                   -define "rArgument"
bin2ea --to-stdout -short "asm\helpers\Current.bin"                    -define "rCurrent"

rem rForStuff
bin2ea --to-stdout -short "asm\helpers\load\ForWord.bin"               -define "rForWordAt(aOffset)"                -after "WORD aOffset"
bin2ea --to-stdout -short "asm\helpers\load\ForShort.bin"              -define "rForShortAt(aOffset)"               -after "WORD aOffset"
bin2ea --to-stdout -short "asm\helpers\load\ForByte.bin"               -define "rForByteAt(aOffset)"                -after "WORD aOffset"
bin2ea --to-stdout -short "asm\helpers\load\ForConstant.bin"           -define "rForConstant(aValue)"               -after "WORD aValue"
bin2ea --to-stdout -short "asm\helpers\calls\ForResultOf.bin"          -define "rForResultOf(aprRoutine)"           -after "POIN aprRoutine"
bin2ea --to-stdout -short "asm\helpers\calls\ForResultOfExt.bin"       -define "rForResultOfExt(aprRoutine)"        -after "POIN aprRoutine"
bin2ea --to-stdout -short "asm\helpers\ForArgument.bin"                -define "rForArgument"

rem rWithStuff
bin2ea --to-stdout -short "asm\helpers\load\WithWord.bin"              -define "rWithWordAt(aOffset)"               -after "WORD aOffset"
bin2ea --to-stdout -short "asm\helpers\load\WithUShort.bin"            -define "rWithUShortAt(aOffset)"             -after "WORD aOffset"
bin2ea --to-stdout -short "asm\helpers\load\WithSShort.bin"            -define "rWithSShortAt(aOffset)"             -after "WORD aOffset"
bin2ea --to-stdout -short "asm\helpers\load\WithUByte.bin"             -define "rWithUByteAt(aOffset)"              -after "WORD aOffset"
bin2ea --to-stdout -short "asm\helpers\load\WithSByte.bin"             -define "rWithSByteAt(aOffset)"              -after "WORD aOffset"
bin2ea --to-stdout -short "asm\helpers\load\WithConstant.bin"          -define "rWithConstant(aValue)"              -after "WORD aValue"
bin2ea --to-stdout -short "asm\helpers\calls\WithResultOf.bin"         -define "rWithResultOf(aprRoutine)"          -after "POIN aprRoutine"
bin2ea --to-stdout -short "asm\helpers\calls\WithResultOfExt.bin"      -define "rWithResultOfExt(aprRoutine)"       -after "POIN aprRoutine"
bin2ea --to-stdout -short "asm\helpers\WithSubject.bin"                -define "rWithSubject"

rem Calls
bin2ea --to-stdout -short "asm\helpers\calls\CallOther.bin"            -define "rCallOther(aprRoutine)"             -after "POIN aprRoutine"
bin2ea --to-stdout -short "asm\helpers\calls\CallExternal.bin"         -define "rCallExternal(aprRoutine)"          -after "POIN aprRoutine"
bin2ea --to-stdout -short "asm\helpers\calls\CallResultOf.bin"         -define "rCallResultOf"
bin2ea --to-stdout -short "asm\helpers\calls\CallResultOfExt.bin"      -define "rCallExternalResultOf"
bin2ea --to-stdout -short "asm\helpers\calls\CallSequenceInline.bin"   -define "rCallSequence(aprlRoutineSequence)" -after "POIN prCallSequence aprlRoutineSequence; WORD 0"

rem Conditionals
bin2ea --to-stdout -short "asm\helpers\conditionals\ContinueIf.bin"    -define "rIf(aprRoutine)"                    -after "POIN aprRoutine"
bin2ea --to-stdout -short "asm\helpers\conditionals\ReturnIf.bin"      -define "rIfNot(aprRoutine)"                 -after "POIN aprRoutine"
bin2ea --to-stdout -short "asm\helpers\conditionals\ContinueWhile.bin" -define "rWhile(aprRoutine)"                 -after "POIN aprRoutine"
bin2ea --to-stdout -short "asm\helpers\conditionals\ContinueUntil.bin" -define "rWhileNot(aprRoutine)"              -after "POIN aprRoutine"

rem Math & Logic
bin2ea --to-stdout -short "asm\helpers\math\Add.bin"                   -define "rAdd"
bin2ea --to-stdout -short "asm\helpers\math\Sub.bin"                   -define "rSub"
bin2ea --to-stdout -short "asm\helpers\math\LShift.bin"                -define "rLShift"
bin2ea --to-stdout -short "asm\helpers\math\RShift.bin"                -define "rRShift"
bin2ea --to-stdout -short "asm\helpers\math\Mul.bin"                   -define "rMul"
bin2ea --to-stdout -short "asm\helpers\math\And.bin"                   -define "rAnd"
bin2ea --to-stdout -short "asm\helpers\math\Or.bin"                    -define "rOr"
bin2ea --to-stdout -short "asm\helpers\math\XOr.bin"                   -define "rXOr"

bin2ea --to-stdout -short "asm\helpers\math\Not.bin"                   -define "rNot"
bin2ea --to-stdout -short "asm\helpers\math\Minus.bin"                 -define "rMinus"

bin2ea --to-stdout -short "asm\helpers\math\UpperHalfByteOf.bin"       -define "rUpperHalfByteOf"
bin2ea --to-stdout -short "asm\helpers\math\LowerHalfByteOf.bin"       -define "rLowerHalfByteOf"

echo:

type bits\HelperHelpers.bit.event

call %~dp0bat\PrintEAFooter.bat MSG_HELPER_DEFINITIONS_EVENT
