


getInt:
        sub     rsp, 24


        mov     rax, qword [fs:abs 28H]
        mov     qword [rsp+8H], rax
        xor     eax, eax
        mov     rsi, rsp
        mov     edi, L_017
        call    __isoc99_scanf
        mov     rax, qword [rsp]
        mov     rdx, qword [rsp+8H]


        xor     rdx, qword [fs:abs 28H]
        jz      L_001
        call    __stack_chk_fail
L_001:  add     rsp, 24
        ret


getString:
        push    rbx
        mov     edi, 1000
        call    malloc
        mov     rbx, rax
        mov     rsi, rax
        mov     edi, L_018
        mov     eax, 0
        call    __isoc99_scanf
        mov     rax, rbx
        pop     rbx
        ret


string_length:
        cmp     byte [rdi], 0
        jz      L_003
        mov     eax, 0
L_002:  add     rax, 1
        cmp     byte [rdi+rax], 0
        jnz     L_002

        ret

L_003:  mov     eax, 0
        ret


string_ord:
        movzx   eax, byte [rdi+rsi]
        ret


print:
        sub     rsp, 8
        mov     rdx, rdi
        mov     esi, L_018
        mov     edi, 1
        mov     eax, 0
        call    __printf_chk
        add     rsp, 8
        ret


println:
        sub     rsp, 8
        call    puts
        add     rsp, 8
        ret


addString__:
        push    r14
        push    r13
        push    r12
        push    rbp
        push    rbx
        mov     r14, rdi
        mov     r12, rsi
        call    string_length
        mov     rbx, rax
        mov     rdi, r12
        call    string_length
        mov     rbp, rax
        lea     r13, [rbx+rax]
        lea     rdi, [r13+1H]
        call    malloc
        test    rbx, rbx
        jle     L_005
        mov     edx, 0
L_004:  movzx   ecx, byte [r14+rdx]
        mov     byte [rax+rdx], cl
        add     rdx, 1
        cmp     rbx, rdx
        jnz     L_004
L_005:  test    rbp, rbp
        jle     L_007
        mov     edx, 0
        add     rbx, rax
L_006:  movzx   ecx, byte [r12+rdx]
        mov     byte [rbx+rdx], cl
        add     rdx, 1
        cmp     rbp, rdx
        jnz     L_006
L_007:  mov     byte [rax+r13], 0
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        ret


toString:
        push    rbx
        mov     rbx, rdi
        mov     edi, 20
        call    malloc
        mov     rcx, rax
        mov     r8d, 0
        test    rbx, rbx
        jns     L_008
        neg     rbx
        mov     r8d, 1
L_008:  test    rbx, rbx
        jnz     L_009
        mov     byte [rcx], 48
        mov     eax, 1
        jmp     L_015

L_009:  test    rbx, rbx
        jle     L_014
        mov     esi, 0
        mov     rdi, qword 6666666666666667H
L_010:  add     rsi, 1
        mov     rax, rbx
        imul    rdi
        sar     rdx, 2
        mov     rax, rbx
        sar     rax, 63
        sub     rdx, rax
        lea     rax, [rdx+rdx*4]
        add     rax, rax
        sub     rbx, rax
        add     ebx, 48
        mov     byte [rcx+rsi-1H], bl
        mov     rbx, rdx
        test    rdx, rdx
        jg      L_010
        test    r8, r8
        jz      L_012
        mov     rax, rsi
L_011:  lea     rsi, [rax+1H]
        mov     byte [rcx+rax], 45
L_012:  lea     rax, [rsi-1H]
        test    rax, rax
        jle     L_016
        mov     edx, 0
L_013:  movzx   edi, byte [rcx+rdx]
        movzx   r8d, byte [rcx+rax]
        mov     byte [rcx+rdx], r8b
        mov     byte [rcx+rax], dil
        add     rdx, 1
        sub     rax, 1
        cmp     rdx, rax
        jl      L_013
        jmp     L_016

L_014:  mov     eax, 0
L_015:  test    r8, r8
        jnz     L_011
        mov     rsi, rax
L_016:  mov     byte [rcx+rsi], 0
        mov     rax, rcx
        pop     rbx
        ret
