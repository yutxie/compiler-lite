default rel

global main

SECTION .text

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 128
		mov		r15, 10
		cmp		r15, 10
		mov		r15, 20
		jmp		if_end_0
if_false_0:
		mov		r15, 30
if_end_0:
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data

SECTION .bbs
