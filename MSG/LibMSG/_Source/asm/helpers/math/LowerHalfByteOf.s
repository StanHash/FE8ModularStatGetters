.thumb

.equ Continue, EALiterals+0x00

LowerHalfByteOf:
	push {lr}
	
	bl Continue
	
	@ And for good measure
	mov r3, #0xF
	and r0, r3
	
	@ End
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Next
