default rel

global foo
global main



extern malloc

SECTION .text

foo:
foo_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 8
		mov		r15, qword [rbp+16]
		mov		r13, r9
		mov		r12, r8
		mov		r11, rcx
		mov		qword [rbp-8], rdx
		mov		r14, rsi
		mov		r10, rdi
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, 5
		mov		rsi, 6
		mov		rdx, 7
		mov		rcx, 8
		mov		r8, 9
		mov		r9, 10
		push	0
		call	foo
		pop		r8
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r15, rax
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data	align=8


SECTION .bbs
