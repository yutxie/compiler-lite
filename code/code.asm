default rel

global main

extern malloc

SECTION .text

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 192
		mov		qword [rbp-8], 1
		mov		r15, 2
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		rdi, r15
		call	malloc
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		r11, rax
		mov		r10, 0
		jmp		loop_cond_0
loop_body_0:
		inc		r10
loop_cond_0:
		cmp		r10, r15
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
		mov		rdi, 2
		call	malloc
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		qword [rbp-16], rax
		mov		r10, 0
		jmp		loop_cond_1
loop_body_1:
		inc		r10
loop_cond_1:
		cmp		r10, 2
		jl		loop_body_1
loop_end_1:
		mov		r9, qword [rbp-16]
		mov		qword [rbp-24], r9
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		rdi, qword [rbp-8]
		call	malloc
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		r10, rax
		mov		qword [rbp-32], 0
		jmp		loop_cond_2
loop_body_2:
		inc		qword [rbp-32]
loop_cond_2:
		mov		r8, qword [rbp-8]
		cmp		qword [rbp-32], r8
		jl		loop_body_2
loop_end_2:
		mov		qword [rbp-40], r10
		mov		rbx, qword [rbp-24]
		mov		rcx, 0
		mov		r9, qword [rbp-40]
		mov		qword [rbx+rcx*8+0], r9
		mov		rbx, qword [rbp-24]
		mov		rcx, 1
		mov		qword [rbx+rcx*8+0], r11
		mov		qword [rbp-48], 0
		mov		qword [rbp-56], 0
		jmp		loop_cond_3
loop_body_3:
		mov		r10, 0
		jmp		loop_cond_4
loop_body_4:
		inc		qword [rbp-48]
		mov		rbx, qword [rbp-24]
		mov		rcx, qword [rbp-56]
		mov		r14, qword [rbx+rcx*8+0]
		mov		rbx, r14
		mov		rcx, r10
		mov		r9, qword [rbp-48]
		mov		qword [rbx+rcx*8+0], r9
		inc		r10
loop_cond_4:
		mov		r8, qword [rbp-8]
		cmp		r10, r8
		jl		loop_body_4
		jge		loop_end_4
loop_end_4:
		inc		qword [rbp-56]
loop_cond_3:
		cmp		qword [rbp-56], 2
		jl		loop_body_3
		jge		loop_end_3
loop_end_3:
		mov		r10, qword [rbp-8]
		jmp		loop_cond_5
loop_body_5:
		inc		qword [rbp-48]
		mov		rbx, qword [rbp-24]
		mov		rcx, 1
		mov		r13, qword [rbx+rcx*8+0]
		mov		rbx, r13
		mov		rcx, r10
		mov		r9, qword [rbp-48]
		mov		qword [rbx+rcx*8+0], r9
		inc		r10
loop_cond_5:
		cmp		r10, r15
		jl		loop_body_5
		jge		loop_end_5
loop_end_5:
		mov		r14, 0
		mov		qword [rbp-56], 0
		jmp		loop_cond_6
loop_body_6:
		mov		qword [rbp-64], r14
		mov		rbx, qword [rbp-40]
		mov		rcx, qword [rbp-56]
		mov		r8, qword [rbp-64]
		mov		r9, qword [rbx+rcx*8+0]
		add		r8, r9
		mov		qword [rbp-64], r8
		mov		r14, qword [rbp-64]
		inc		qword [rbp-56]
loop_cond_6:
		mov		r8, qword [rbp-8]
		cmp		qword [rbp-56], r8
		jl		loop_body_6
		jge		loop_end_6
loop_end_6:
		mov		qword [rbp-56], 0
		jmp		loop_cond_7
loop_body_7:
		mov		r12, r14
		mov		rbx, r11
		mov		rcx, qword [rbp-56]
		mov		r9, qword [rbx+rcx*8+0]
		add		r12, r9
		mov		r14, r12
		inc		qword [rbp-56]
loop_cond_7:
		cmp		qword [rbp-56], r15
		jl		loop_body_7
		jge		loop_end_7
loop_end_7:
		mov		rax, r14
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data

SECTION .bbs
