default rel

global main

extern malloc

SECTION .text

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 128
		mov		r12, 5
		mov		r14, 0
		cmp		r14, 0
		je		short_false_0
		mov		rax, r12
		cqo
		idiv		r14
		mov		r10, rax
		cmp		r10, 1
		jne		short_true_0
		je		short_false_0
short_true_0:
		mov		r10, 1
		jmp		short_end_0
short_false_0:
		mov		r10, 0
short_end_0:
		mov		r15, r10
		cmp		r15, 0
		jnz		if_true_0
		jz		if_false_0
if_true_0:
		mov		r15, 10
		jmp		if_end_0
if_false_0:
		mov		r15, 20
if_end_0:
		cmp		r15, 10
		jne		short_true_1
		mov		rax, r12
		cqo
		idiv		r14
		mov		r11, rax
		cmp		r11, 0
		jne		short_true_1
		cmp		r12, 5
		je		short_false_1
		jne		short_true_1
short_true_1:
		mov		r14, 1
		jmp		short_end_1
short_false_1:
		mov		r14, 0
short_end_1:
		mov		r13, r14
		cmp		r13, 0
		jnz		if_true_1
		jz		if_false_1
if_true_1:
		mov		r15, 30
		jmp		if_end_1
if_false_1:
		nop
if_end_1:
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data

SECTION .bbs
