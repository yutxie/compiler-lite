default rel

global string_length
global main
global print
global toString
global addString__
global println

global N
global b
global resultCount

extern malloc
extern printf
extern __stack_chk_fail
extern __isoc99_scanf

SECTION .text

string_length:
        cmp     byte [rdi], 0
        jz      string_length_1
        mov     eax, 0
string_length_0:  
        add     eax, 1
        movsxd  rdx, eax
        cmp     byte [rdi+rdx], 0
        jnz     string_length_0
        ret
string_length_1:  
        mov     eax, 0
        ret


main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 80
		mov		rdi, 15001
		inc		rdi
		push		15001
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
		mov		r10, rax
		mov		r10, 0
		jmp		loop_cond_0
loop_body_0:
		inc		r10
loop_cond_0:
		cmp		r10, 15001
		jl		loop_body_0
loop_end_0:
		mov		qword [rbp-8], 1
		jmp		loop_cond_1
loop_body_1:
		mov		rbx, qword [rel b]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], 1
		mov		r10, qword [rbp-8]
		inc		qword [rbp-8]
loop_cond_1:
		mov		r8, qword [rel N]
		cmp		qword [rbp-8], r8
		jle		loop_body_1
		jg		loop_end_1
loop_end_1:
		mov		qword [rbp-8], 2
		jmp		loop_cond_2
loop_body_2:
		mov		rbx, qword [rel b]
		mov		rcx, qword [rbp-8]
		cmp		qword [rbx+rcx*8+8], 0
		jnz		if_true_0
		jz		if_false_0
if_true_0:
		mov		r10, 2
		cmp		qword [rbp-8], 3
		jle		if_false_1
		mov		r9, qword [rbp-8]
		mov		qword [rbp-16], r9
		mov		r8, qword [rbp-16]
		sub		r8, 2
		mov		qword [rbp-16], r8
		mov		rbx, qword [rel b]
		mov		rcx, qword [rbp-16]
		cmp		qword [rbx+rcx*8+8], 0
		jnz		if_true_1
		jz		if_false_1
if_true_1:
		mov		r13, qword [rel resultCount]
		inc		qword [rel resultCount]
		mov		r9, qword [rbp-8]
		mov		qword [rbp-24], r9
		mov		r8, qword [rbp-24]
		sub		r8, 2
		mov		qword [rbp-24], r8
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, qword [rbp-24]
		call	toString
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r13, rax
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r13
		mov		rsi, str_const_0
		call	addString__
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r11, rax
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, qword [rbp-8]
		call	toString
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r12, rax
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r11
		mov		rsi, r12
		call	addString__
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-32], rax
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, qword [rbp-32]
		call	println
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-40], rax
		jmp		if_end_1
if_false_1:
		nop
if_end_1:
		jmp		loop_cond_3
loop_body_3:
		mov		r9, qword [rbp-8]
		mov		qword [rbp-48], r9
		mov		r8, qword [rbp-48]
		imul		r8, r10
		mov		qword [rbp-48], r8
		mov		rbx, qword [rel b]
		mov		rcx, qword [rbp-48]
		mov		qword [rbx+rcx*8+8], 0
		mov		qword [rbp-56], r10
		inc		r10
loop_cond_3:
		mov		r14, qword [rbp-8]
		imul		r14, r10
		mov		r8, qword [rel N]
		cmp		r14, r8
		jle		loop_body_3
		jg		loop_end_3
loop_end_3:
		jmp		if_end_0
if_false_0:
		nop
if_end_0:
		mov		r10, qword [rbp-8]
		inc		qword [rbp-8]
loop_cond_2:
		mov		r8, qword [rel N]
		cmp		qword [rbp-8], r8
		jle		loop_body_2
		jg		loop_end_2
loop_end_2:
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, qword [rel resultCount]
		call	toString
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r15, rax
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, str_const_1
		mov		rsi, r15
		call	addString__
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r15, rax
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r15
		call	println
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r15, rax
		mov		rax, 0
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

print:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     rsi, rdi
        mov     rdi, L_257300
        mov     eax, 0
        call    printf
        leave
        ret

toString:
        push    rbx
        mov     ebx, edi
        mov     edi, 20
        call    malloc
        mov     rsi, rax
        test    ebx, ebx
        jns     toString_010
        neg     ebx
        je      toString_008
        mov     r9d, 1
toString_001:  mov     eax, 0
        mov     r8d, 1717986919
toString_002:  lea     edi, [rax+1H]
        movsxd  rcx, eax
        mov     eax, ebx
        imul    r8d
        sar     edx, 2
        mov     eax, ebx
        sar     eax, 31
        sub     edx, eax
        lea     eax, [rdx+rdx*4]
        add     eax, eax
        sub     ebx, eax
        add     ebx, 48
        mov     byte [rsi+rcx], bl
        mov     ebx, edx
        mov     eax, edi
        test    edx, edx
        jnz     toString_002
        test    edi, edi
        jnz     toString_003
        mov     byte [rsi], 48
        test    r9d, r9d
        jnz     toString_004
        mov     edi, 1
        jmp     toString_011

toString_003:  mov     eax, edi
        test    r9d, r9d
        jnz     toString_005
        jmp     toString_006

toString_004:  mov     eax, 1
toString_005:  lea     edi, [rax+1H]
        cdqe
        mov     byte [rsi+rax], 45
toString_006:  lea     ecx, [rdi-1H]
        test    ecx, ecx
        jle     toString_011
        mov     r8d, 0
toString_007:  movsxd  rdx, r8d
        add     rdx, rsi
        movzx   r9d, byte [rdx]
        movsxd  rax, ecx
        add     rax, rsi
        movzx   r10d, byte [rax]
        mov     byte [rdx], r10b
        mov     byte [rax], r9b
        add     r8d, 1
        sub     ecx, 1
        cmp     r8d, ecx
        jl      toString_007
        jmp     toString_011

toString_008:  mov     byte [rax], 48
        mov     eax, 1
        jmp     toString_005

toString_009:  mov     byte [rsi], 48
        mov     edi, 1
        jmp     toString_011

toString_010:  mov     r9d, 0
        test    ebx, ebx
        jne     toString_001
        jmp     toString_009

toString_011:  movsxd  rdi, edi
        mov     byte [rsi+rdi], 0
        mov     rax, rsi
        pop     rbx
        ret


addString__:
        push    r14
        push    r13
        push    r12
        push    rbp
        push    rbx
        mov     r14, rdi
        mov     r13, rsi
        call    string_length
        mov     ebx, eax
        mov     rdi, r13
        call    string_length
        mov     r12d, eax
        lea     ebp, [rbx+rax]
        lea     edi, [rbp+1H]
        movsxd  rdi, edi
        call    malloc
        test    ebx, ebx
        jle     addString___004
        mov     edx, 0
addString___003:  movzx   ecx, byte [r14+rdx]
        mov     byte [rax+rdx], cl
        add     rdx, 1
        cmp     ebx, edx
        jg      addString___003
addString___004:  test    r12d, r12d
        jle     addString___006
        mov     edx, ebx
        mov     rsi, r13
        add     ebx, r12d
addString___005:  movsxd  rcx, edx
        movzx   edi, byte [rsi]
        mov     byte [rax+rcx], dil
        add     edx, 1
        add     rsi, 1
        cmp     edx, ebx
        jnz     addString___005
addString___006:  movsxd  rbp, ebp
        mov     byte [rax+rbp], 0
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        ret


println:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		rsi, L_newline
		call	addString__
		mov		rdi, rax
		call	print
		mov		rsp, rbp
		pop		rbp
		ret


SECTION .data	align=8

N:
		dq 000000000000000AH
b:
		dq 000000000000000AH
resultCount:
		dq 000000000000000AH

SECTION .bbs

SECTION .rodata

str_const_0:
		db " ", 00H
str_const_1:
		db "Total: ", 00H
L_257300:
		db 25H, 73H, 00H
L_newline:
		db 10, 00H
