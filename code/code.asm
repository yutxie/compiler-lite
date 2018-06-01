default rel

global string_length
global gcd
global main
global print
global toString
global addString__
global println


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


gcd:
gcd_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		r12, rsi
		mov		r14, rdi
		mov		rax, r14
		cqo
		idiv		r12
		mov		r13, rdx
		cmp		r13, 0
		je		if_true_0
		jne		if_false_0
if_true_0:
		mov		rax, r12
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_0
if_false_0:
		mov		rax, r14
		cqo
		idiv		r12
		mov		r15, rdx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r12
		mov		rsi, r15
		call	gcd
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
if_end_0:
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
		mov		rdi, 10
		mov		rsi, 1
		call	gcd
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
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, 34986
		mov		rsi, 3087
		call	gcd
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
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, 2907
		mov		rsi, 1539
		call	gcd
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


SECTION .bbs

SECTION .rodata

L_257300:
		db 25H, 73H, 00H
L_newline:
		db 10, 00H
