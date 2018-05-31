default rel

global tak
global main



extern malloc

SECTION .text

tak:
tak_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 240
		mov		r9, qword [rbp-24]
		mov		qword [rbp-48], r9
		mov		r9, qword [rbp-16]
		mov		qword [rbp-40], r9
		mov		r9, qword [rbp-8]
		mov		qword [rbp-32], r9
		mov		r8, qword [rbp-32]
		cmp		qword [rbp-40], r8
		jl		if_true_0
		jge		if_false_0
if_true_0:
		mov		r9, qword [rbp-32]
		mov		qword [rbp-56], r9
		mov		r8, qword [rbp-56]
		sub		r8, 1
		mov		qword [rbp-56], r8
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		r8, qword [rbp-56]
		mov		qword [rsp-24], r8
		mov		r8, qword [rbp-40]
		mov		qword [rsp-32], r8
		mov		r8, qword [rbp-48]
		mov		qword [rsp-40], r8
		call	tak
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		qword [rbp-64], rax
		mov		r9, qword [rbp-40]
		mov		qword [rbp-72], r9
		mov		r8, qword [rbp-72]
		sub		r8, 1
		mov		qword [rbp-72], r8
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		r8, qword [rbp-72]
		mov		qword [rsp-24], r8
		mov		r8, qword [rbp-48]
		mov		qword [rsp-32], r8
		mov		r8, qword [rbp-32]
		mov		qword [rsp-40], r8
		call	tak
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		qword [rbp-80], rax
		mov		r9, qword [rbp-48]
		mov		qword [rbp-88], r9
		mov		r8, qword [rbp-88]
		sub		r8, 1
		mov		qword [rbp-88], r8
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		r8, qword [rbp-88]
		mov		qword [rsp-24], r8
		mov		r8, qword [rbp-32]
		mov		qword [rsp-32], r8
		mov		r8, qword [rbp-40]
		mov		qword [rsp-40], r8
		call	tak
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		qword [rbp-96], rax
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		r8, qword [rbp-64]
		mov		qword [rsp-24], r8
		mov		r8, qword [rbp-80]
		mov		qword [rsp-32], r8
		mov		r8, qword [rbp-96]
		mov		qword [rsp-40], r8
		call	tak
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		qword [rbp-104], rax
		mov		qword [rbp-112], 1
		mov		r8, qword [rbp-112]
		mov		r9, qword [rbp-104]
		add		r8, r9
		mov		qword [rbp-112], r8
		mov		rax, qword [rbp-112]
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_0
if_false_0:
		mov		rax, qword [rbp-48]
		mov		rsp, rbp
		pop		rbp
		ret
if_end_0:
		mov		rsp, rbp
		pop		rbp
		ret

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 136
		mov		qword [rsp+0], r8
		mov		qword [rsp+8], r9
		mov		qword [rsp+16], r10
		mov		qword [rsp+24], r11
		mov		qword [rsp+32], r12
		mov		qword [rsp+40], r13
		mov		qword [rsp+48], r14
		mov		qword [rsp+56], r15
		mov		qword [rsp-24], 18
		mov		qword [rsp-32], 12
		mov		qword [rsp-40], 6
		call	tak
		mov		r8, qword [rsp+0]
		mov		r9, qword [rsp+8]
		mov		r10, qword [rsp+16]
		mov		r11, qword [rsp+24]
		mov		r12, qword [rsp+32]
		mov		r13, qword [rsp+40]
		mov		r14, qword [rsp+48]
		mov		r15, qword [rsp+56]
		mov		qword [rbp-8], rax
		mov		rax, qword [rbp-8]
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data	align=8


SECTION .bbs
