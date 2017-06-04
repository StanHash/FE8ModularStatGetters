.thumb

.macro _blh to, reg=r3
	ldr \reg, =\to
	mov lr, \reg
	.short 0xF800
.endm

.equ FE8U_RangeMapRows,  0x0202E4E4
.equ FE8U_ClearMap,      0x080197E4

ClearRange:
	push {lr}
	
	ldr r0, =FE8U_RangeMapRows @ pointer to range map rows
	ldr r0, [r0]
	
	mov r1, #0 @ Clear with 0
	
	_blh FE8U_ClearMap
	
	pop {r1}
	bx r1

.ltorg
.align
