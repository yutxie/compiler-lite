default rel

global main

extern malloc

SECTION .text

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 128
		mov		rdi, 1
		call	malloc
		mov		r14, rax
		mov		r13, 0
		jmp		loop_cond_0
loop_body_0:
		nop
loop_cond_0:
		cmp		r13, 1
loop_end_0:
		mov		r15, r14
		mov		r8, r15
		mov		r9, 0
		mov		qword [r8+0], 10
		mov		r8, r15
		mov		r9, 0
		mov		r15, qword [r8+0]
		add		r15, 20
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data

SECTION .bbs
