.thumb

@ Argument: (standard r0, r1), r2 = attribute to check against
AttributeCheck:
	@ Loading ROM Char & Class pointers
	ldr r0, [r1]
	ldr r1, [r1, #4]
	
	@ Loading Char & Class Attibutes
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	
	@ Check
	orr r0, r1
	and r0, r2
	
	@ End
	bx lr

.ltorg
.align

EALiterals:
	@ notin
