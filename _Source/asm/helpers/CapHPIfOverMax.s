.thumb

.equ MaxHPGetter, EALiterals+0x00

CapHPIfOverMax:
	push {r4-r5, lr}
	
	@ Saving Current HP & Unit Struct Ptr
	mov r4, r0
	mov r5, r1
	
	@ Preparing thumb bit in lr
	mov r3, #1
	mov lr, r3
	
	@ Preparing Max Hp Getter call
	mov r0, r1
	ldr r3, MaxHPGetter
	
	@ lr = pc + 2op + 1
	add lr, pc
	
	@ Calling Max Hp Getter
	bx r3
	
	@ moving values around (r0 being current HP is important)
	mov r3, r0 @ r3 = max hp
	mov r0, r4 @ r0 = cur hp
	
	@ Goto End if ((cur hp) <= (max hp))
	cmp r0, r3
	ble End
	
	@ r1 = offset of current hp in Unit Struct
	mov r1, #0x13
	
	@ r2 = base current hp
	ldsb r2, [r5, r1]
	
	sub r2, r0 @ r2 = (base current hp) - (current hp) = 0 - (current hp bonus)
	add r2, r3 @ r2 = (max hp) - (current hp bonus)
	
	@ storing arranged current hp
	strb r2, [r5, r1]
	
	@ r0 = max hp
	mov r0, r3
	
End:
	pop {r4-r5}
	
	pop {r1}
	bx r1

.ltorg
.align

EALiterals:
	@ POIN Max HP Getter
