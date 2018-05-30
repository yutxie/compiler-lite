default rel

global main

extern malloc

SECTION .text

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 136
		mov		r12, 5
		mov		r13, 10
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		rdi, r13
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
		mov		r14, 0
		jmp		loop_cond_0
loop_body_0:
		inc		r14
loop_cond_0:
		cmp		r14, r13
		jl		loop_body_0
loop_end_0:
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		rdi, r12
		call	malloc
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		r14, rax
		mov		r11, 0
		jmp		loop_cond_1
loop_body_1:
		inc		r11
loop_cond_1:
		cmp		r11, r12
		jl		loop_body_1
loop_end_1:
		mov		qword [rbp-8], r14
		mov		r14, 0
		mov		r11, 0
		jmp		loop_cond_2
loop_body_2:
		inc		r14
		mov		r8, qword [rbp-8]
		mov		r9, r11
		mov		qword [r8+r9*8+0], r14
		inc		r11
loop_cond_2:
		cmp		r11, r12
		jl		loop_body_2
loop_end_2:
		mov		r11, 0
		jmp		loop_cond_3
loop_body_3:
		inc		r14
		mov		r8, r15
		mov		r9, r11
		mov		qword [r8+r9*8+0], r14
		inc		r11
loop_cond_3:
		cmp		r11, r12
		jl		loop_body_3
loop_end_3:
		mov		r11, r12
		jmp		loop_cond_4
loop_body_4:
		inc		r14
		mov		r8, r15
		mov		r9, r11
		mov		qword [r8+r9*8+0], r14
		inc		r11
loop_cond_4:
		cmp		r11, r13
		jl		loop_body_4
loop_end_4:
		mov		r15, 0
		mov		r14, 0
		jmp		loop_cond_5
loop_body_5:
		mov		r10, r15
		mov		r8, qword [rbp-8]
		mov		r9, r14
		mov		r9, qword [r8+r9*8+0]
		add		r10, r9
		mov		r15, r10
		inc		r14
loop_cond_5:
		cmp		r14, r12
		jl		loop_body_5
loop_end_5:
		mov		r8, qword [rbp-8]
		mov		r9, 0
		mov		rax, qword [r8+r9*8+0]
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data

SECTION .bbs
