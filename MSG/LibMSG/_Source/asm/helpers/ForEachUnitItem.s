.thumb

.macro _blh to, reg=r3
	ldr \reg, =\to
	mov lr, \reg
	.short 0xF800
.endm

.macro _swap reg1, reg2
	eor \reg1, \reg2 @ r1a = r1 ^ r2
	eor \reg2, \reg1 @ r2a = r2 ^ r1a = r2 ^ (r1 ^ r2) = r1
	eor \reg1, \reg2 @ r1b = r1a ^ r2a = (r1 ^ r2) ^ r1 = r2
.endm

.equ Continue, EALiterals+0x00

.equ FE8U_GetUnitItemCount, 0x080179D8

@ Routine size = 0xC + Getter Routine
ForEachItem:
	push {r4-r6, lr}
	
	mov r6, r0 @ current stat, swapped with item count later
	
	mov r4, r1 @ unit struct
	mov r5, #0 @ Counter
	
	mov r0, r4
	_blh FE8U_GetUnitItemCount @ GetUnitItemCount
	
	_swap r0, r6
	
StartItemLoop:
	cmp r5, r6
	beq End @ Branch if we are at the item count
	
	lsl r2, r5, #1 @ r1 = r5*2
	add r2, #0x1E @ r1 = item slot offset
	
	ldrh r2, [r4, r2] @ Item
	mov r1, r4
	
	@ r0 is the result of the last call
	
	bl Continue
	
	add r5, #1
	b StartItemLoop

End:
	pop {r4-r6}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ Insert Getter
