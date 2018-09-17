.thumb

lMovGetter = EALiterals + 0x00

StatScreenMovGetterWrapper:
	push {r4, lr}

	ldr r0, [r5, #0xC]
	mov r4, r0

	bl lMovGetter

	cmp r0, #0
	bne NonZeroMov

	mov r3, #1
	neg r3, r3

	mov r0, r3

	b End

NonZeroMov:
	ldr r3, [r4, #0x4] @ Unit.pClassData

	mov  r1, #0x12
	ldsb r3, [r3, r1]

End:
	pop {r4, pc}

.ltorg
.align

EALiterals:
	@ Insert move getter here
