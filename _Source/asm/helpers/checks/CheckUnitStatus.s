.thumb

CheckUnitStatus:
	@ Loading status data byte
	ldr r0, [r1, #0x30]
	
	@ Loading status id
	mov r3, #0xF
	and r0, r3
	
	cmp r0, r2
	bne ReturnFalse
	
	mov r0, #42
	b End
	
ReturnFalse:
	mov r0, #0
	
End:
	bx lr

.ltorg
.align

EALiterals:
	@ notin
