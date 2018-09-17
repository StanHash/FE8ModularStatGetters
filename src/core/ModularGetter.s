.thumb

lpCallSequence = EALiterals+0x00
lpModifierList = EALiterals+0x04

ModularGetter:
	@ Loading Sequence Caller Routine Pointer
	ldr r3, lpCallSequence
	mov ip, r3

	@ Loading Routine Array Pointer
	ldr r3, lpModifierList

	@ Moving Parameters
	mov r2, r1
	mov r1, r0

	@ Stat starts at 0
	mov r0, #0

	@ I T  B E G I N S
	bx ip

.ltorg
.align

EALiterals:
	@ POIN CallSequence
	@ POIN <ModifierList>
