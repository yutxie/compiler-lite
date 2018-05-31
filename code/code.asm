default rel

global main



extern malloc

SECTION .text

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		rdi, 1
		inc		rdi
		push		1
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		call	malloc
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rdi
		mov		qword [rax+0], rdi
		mov		r14, rax
		mov		r13, 0
		jmp		loop_cond_0
loop_body_0:
		inc		r13
loop_cond_0:
		cmp		r13, 1
		jl		loop_body_0
loop_end_0:
		mov		r15, r14
		mov		rbx, r15
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], 20
		mov		rbx, r15
		mov		rcx, 0
		mov		r15, qword [rbx+rcx*8+8]
		add		r15, 10
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data	align=8


SECTION .bbs
