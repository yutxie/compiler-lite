
string_length:
        cmp     byte [rdi], 0
        jz      L_002
        mov     eax, 0
L_001:  add     rax, 1
        cmp     byte [rdi+rax], 0
        jnz     L_001

        ret

L_002:  mov     eax, 0
        ret


string_ord:
        movzx   eax, byte [rdi+rsi]
        ret


print:
        sub     rsp, 8
        mov     rdx, rdi
        mov     esi, L_016
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
        jle     L_004
        mov     edx, 0
L_003:  movzx   ecx, byte [r14+rdx]
        mov     byte [rax+rdx], cl
        add     rdx, 1
        cmp     rbx, rdx
        jnz     L_003
L_004:  test    rbp, rbp
        jle     L_006
        mov     edx, 0
        add     rbx, rax
L_005:  movzx   ecx, byte [r12+rdx]
        mov     byte [rbx+rdx], cl
        add     rdx, 1
        cmp     rbp, rdx
        jnz     L_005
L_006:  mov     byte [rax+r13], 0
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
        jns     L_007
        neg     rbx
        mov     r8d, 1
L_007:  test    rbx, rbx
        jnz     L_008
        mov     byte [rcx], 48
        mov     eax, 1
        jmp     L_014

L_008:  test    rbx, rbx
        jle     L_013
        mov     esi, 0
        mov     rdi, qword 6666666666666667H
L_009:  add     rsi, 1
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
        jg      L_009
        test    r8, r8
        jz      L_011
        mov     rax, rsi
L_010:  lea     rsi, [rax+1H]
        mov     byte [rcx+rax], 45
L_011:  lea     rax, [rsi-1H]
        test    rax, rax
        jle     L_015
        mov     edx, 0
L_012:  movzx   edi, byte [rcx+rdx]
        movzx   r8d, byte [rcx+rax]
        mov     byte [rcx+rdx], r8b
        mov     byte [rcx+rax], dil
        add     rdx, 1
        sub     rax, 1
        cmp     rdx, rax
        jl      L_012
        jmp     L_015

L_013:  mov     eax, 0
L_014:  test    r8, r8
        jnz     L_010
        mov     rsi, rax
L_015:  mov     byte [rcx+rsi], 0
        mov     rax, rcx
        pop     rbx
        ret

