default rel

global main

extern malloc

SECTION .text

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 128
		mov		r15, 5
		mov		r13, 0
		cmp		r13, 0
		je		if_false_0
		mov		rax, r15
		cqo
		idiv		r13
		mov		r14, rax
		cmp		r14, 1
		je		if_false_0
		mov		r14, 10
		jmp		if_end_0
if_false_0:
		mov		r14, 20
if_end_0:
		cmp		r14, 10
		mov		r12, 1
		mov		r12, 1
		cmove		r12, r12
		mov		rax, r15
		cqo
		idiv		r13
		mov		r11, rax
		cmp		r11, 0
		mov		r11, 1
		mov		r11, 1
		cmove		r11, r11
		and		r12, r11
		cmp		r15, 5
		mov		r11, 1
		mov		r11, 1
		cmove		r11, r11
		and		r12, r11
		cmp		r12, 0
		cmp		r14, 10
		mov		r12, 1
		mov		r12, 1
		cmove		r12, r12
		mov		rax, r15
		cqo
		idiv		r13
		mov		r11, rax
		cmp		r11, 0
		mov		r11, 1
		mov		r11, 1
		cmove		r11, r11
		and		r12, r11
		cmp		r15, 5
		mov		r11, 1
		mov		r11, 1
		cmove		r11, r11
		and		r12, r11
		not		r12
		cmp		r12, 0
		jz		if_false_1
		mov		r14, 30
		jmp		if_end_1
if_false_1:
		nop
if_end_1:
		mov		rax, r14
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data

SECTION .bbs
