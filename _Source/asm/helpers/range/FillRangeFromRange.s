.thumb

.equ FE8U_FillRangeMap, 0x0801AABC

FillRangeMapFromRange: @ r0 = x, r1 = y, r2 = min, r3 = max
	push {r4-r7, lr}
	
	ldr r7, =FE8U_FillRangeMap
	
	mov r4, r2 @ r4 = min, use for later
	
	@ [r5, r6] = [x, y]
	mov r5, r0
	mov r6, r1
	
	mov r2, r3 @ range = max
	mov r3, #1 @ fill = 1
	
	mov lr, r7
	.short 0xF800
	
	@ [r0, r1] = [x, y]
	mov r0, r5
	mov r1, r6
	
	mov r2, r4 @ range = min
	
	mov r3, #1
	neg r3, r3 @ fill = -1
	
	mov lr, r7
	.short 0xF800
	
	pop {r4-r7}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ notin
