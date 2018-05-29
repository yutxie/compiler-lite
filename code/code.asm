default rel

global main

SECTION .text

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 128
		mov		r11, 20
		mov		r15, 0
		mov		r12, 1
		jmp		loop_cond_0
loop_body_0:
		mov		r13, r15
		add		r13, r12
		mov		r15, r13
		mov		r14, r12
		add		r14, 1
		mov		r12, r14
loop_cond_0:
		cmp		r12, r11
		jle		loop_body_0
loop_end_0:
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data

SECTION .bbs
