.thumb

CheckUnitStatus:
	@ Loading status data byte
	ldr r0, [r1, #0x30]
	
	@ Loading status id
	mov r3, #0xF
	and r0, r3
	
	@ r0 = 0 only if status == r2
	sub r0, r2
	bx lr

.ltorg
.align

EALiterals:
	@ notin
