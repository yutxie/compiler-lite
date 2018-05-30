default rel

global main

extern malloc

SECTION .text

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 128
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		rdi, 1
		call	malloc
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		r15, rax
		mov		r13, 0
		jmp		loop_cond_0
loop_body_0:
		mov		r8, r15
		mov		r9, r13
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		rdi, 1
		call	malloc
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		qword [r8+r9*8+0], rax
		mov		r11, 0
		jmp		loop_cond_1
loop_body_1:
		inc		r11
loop_cond_1:
		cmp		r11, 1
		jl		loop_body_1
loop_end_1:
		inc		r13
loop_cond_0:
		cmp		r13, 1
		jl		loop_body_0
loop_end_0:
		mov		r14, r15
		mov		r8, r14
		mov		r9, 0
		mov		r12, qword [r8+r9*8+0]
		mov		r8, r12
		mov		r9, 0
		mov		qword [r8+r9*8+0], 10
		mov		r8, r14
		mov		r9, 0
		mov		r14, qword [r8+r9*8+0]
		mov		r8, r14
		mov		r9, 0
		mov		r14, qword [r8+r9*8+0]
		add		r14, 20
		mov		rax, r14
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data

SECTION .bbs
