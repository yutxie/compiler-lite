default rel

global main

global x

extern malloc

SECTION .text

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 136
		mov		qword [rel x], 10
		mov		qword [rel x], 20
		mov		rax, qword [rel x]
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .data	align=8

x:
		dq 000000000000000AH

SECTION .bbs

