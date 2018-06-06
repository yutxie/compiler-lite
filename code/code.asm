default rel

global string_length
global string_ord
global string_substring
global string_parseInt
global main
global init
global Ksm
global Calculate_p
global Euler
global Calculate_q
global Calculate_Ksm
global Calculate_G
global Calculate_Comb
global print
global toString
global addString__
global println
global getInt
global getString

global _global_Mod
global _global_p
global _global_res
global _global_ksm
global _global_prime
global _global_tot
global _global_v
global _global_q
global _global_g
global _global_Sum
global _global_m
global _global_b
global _global_Comb
global _global_C
global _global_M
global _global_N
global _global_fn
global _global_fc
global _global_fm

extern malloc
extern printf
extern puts
extern puts
extern getchar
extern putchar
extern sprintf
extern __stack_chk_fail
extern malloc
extern printf
extern strlen
extern memcpy
extern scanf
SECTION .text

toString:
	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	mov rdx,rdi
	mov rax,0
	mov rdi,stringbuffer
	mov rsi,format1
	call sprintf
	mov rdi,stringbuffer
	call transtring
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

println:
	push	r8
	push	r9
	push	r10
	push	r11
	call puts
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	ret

addString__:
	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	push rsi
	mov rsi,rdi
	mov rdi,stringbuffer
	mov rdx,[rsi-8]
	push rdx
	call memcpy
	pop rdi
	pop rsi
	add rdi,stringbuffer
	mov rdx,[rsi-8]
	add rdx,1
	call memcpy
	mov rdi,stringbuffer
	call transtring
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

getInt:
	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	mov rax,0
	mov rdi,format1
	mov rsi,intbuffer
	call scanf
	mov rax,[intbuffer]
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

string_length:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     dword [rbp-4H], 0
	jmp     Llen_002
Llen_001:  add     dword [rbp-4H], 1
Llen_002:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jnz     Llen_001
	mov     eax, dword [rbp-4H]
	pop     rbp
	ret

string_ord:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     dword [rbp-1CH], esi
	mov     eax, dword [rbp-1CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	movsx   eax, al
	mov     dword [rbp-4H], eax
	mov     eax, dword [rbp-4H]
	pop     rbp
	ret

print:
	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	mov rax,0
	mov rsi,rdi
	mov rdi,format2
	call printf
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

transtring:

	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	call strlen
	push rdi
	mov rdi,rax
	push rdi
	add rdi,9
	call malloc
	pop rdi
	mov [rax],rdi
	add rax,8
	mov rdx,rdi
	add rdx,1
	mov rdi,rax
	pop rsi
	sub rsp,8
	push rax
	call memcpy
	pop rax
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

getString:

	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	mov rax,0
	mov rdi,format2
	mov rsi,stringbuffer
	call scanf
	mov rdi,stringbuffer
	call transtring
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

string_substring:
	push rbp
	mov rbp,rsp
	push	r8
	push	r9
	push	r10
	push	r11
	push rdi
	push rsi
	mov rdi,rdx
	sub rdi,rsi
	add rdi,1
	push rdi
	add rdi,9
	call malloc
	pop rdx
	mov [rax],rdx
	add rax,8
	pop rsi
	pop rdi
	add rsi,rdi
	mov rdi,rax
	push rdx
	push rax
	call memcpy
	pop rax
	pop rdx
	mov qword[rax+rdx],0
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	mov rsp,rbp
	pop rbp
	ret

string_parseInt:
	push    rbp
	mov     rbp, rsp
	push	r8
	push	r9
	push	r10
	push	r11
	sub     rsp, 32
	mov     qword [rbp-18H], rdi
	mov     edi, 256
	call    malloc
	mov     qword [rbp-8H], rax
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Lpar_002
Lpar_001:  add     dword [rbp-10H], 1
Lpar_002:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lpar_004
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lpar_001
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lpar_001
	jmp     Lpar_004
Lpar_003:  mov     edx, dword [rbp-0CH]
	mov     eax, edx
	shl     eax, 2
	add     eax, edx
	add     eax, eax
	mov     ecx, eax
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	movsx   eax, al
	add     eax, ecx
	sub     eax, 48
	mov     dword [rbp-0CH], eax
	add     dword [rbp-10H], 1
Lpar_004:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 47
	jle     Lpar_005
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jle     Lpar_003
Lpar_005:  mov     eax, dword [rbp-0CH]
	pop	r11
	pop	r10
	pop	r9
	pop	r8
	leave
	ret

string_eq:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-0CH], 0
	mov     dword [rbp-8H], 0
	jmp     Leq_002
Leq_001:  add     dword [rbp-0CH], 1
Leq_002:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Leq_004
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Leq_001
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Leq_001
	jmp     Leq_004
Leq_003:  add     dword [rbp-8H], 1
Leq_004:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Leq_005
	mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Leq_003
	mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Leq_003
Leq_005:  mov     eax, dword [rbp-0CH]
	cmp     eax, dword [rbp-8H]
	jz      Leq_006
	mov     eax, 0
	jmp     Leq_010
Leq_006:  mov     dword [rbp-4H], 0
	mov     dword [rbp-4H], 0
	jmp     Leq_009
Leq_007:  mov     eax, dword [rbp-4H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-4H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jz      Leq_008
	mov     eax, 0
	jmp     Leq_010
Leq_008:  add     dword [rbp-4H], 1
Leq_009:  mov     eax, dword [rbp-4H]
	cmp     eax, dword [rbp-0CH]
	jl      Leq_007
	mov     eax, 1
Leq_010:  pop     rbp
	ret

string_s:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Ll_012
Ll_011:  add     dword [rbp-10H], 1
Ll_012:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Ll_014
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Ll_011
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Ll_011
	jmp     Ll_014
Ll_013:  add     dword [rbp-0CH], 1
Ll_014:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Ll_015
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Ll_013
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Ll_013
Ll_015:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Ll_019
Ll_016:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Ll_017
	mov     eax, 1
	jmp     Ll_021
Ll_017:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Ll_018
	mov     eax, 0
	jmp     Ll_021
Ll_018:  add     dword [rbp-8H], 1
Ll_019:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Ll_016
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jl      Ll_020
	mov     eax, 0
	jmp     Ll_021
Ll_020:  mov     eax, 1
Ll_021:  pop     rbp
	ret

string_g:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Lg_023
Lg_022:  add     dword [rbp-10H], 1
Lg_023:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lg_025
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lg_022
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lg_022
	jmp     Lg_025
Lg_024:  add     dword [rbp-0CH], 1
Lg_025:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Lg_026
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Lg_024
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Lg_024
Lg_026:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Lg_030
Lg_027:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Lg_028
	mov     eax, 1
	jmp     Lg_032
Lg_028:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Lg_029
	mov     eax, 0
	jmp     Lg_032
Lg_029:  add     dword [rbp-8H], 1
Lg_030:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Lg_027
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jg      Lg_031
	mov     eax, 0
	jmp     Lg_032
Lg_031:  mov     eax, 1
Lg_032:  pop     rbp
	ret

string_le:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Llege_002
Llege_001:  add     dword [rbp-10H], 1
Llege_002:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_004
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_001
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_001
	jmp     Llege_004
Llege_003:  add     dword [rbp-0CH], 1
Llege_004:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_005
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_003
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_003
Llege_005:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Llege_009
Llege_006:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Llege_007
	mov     eax, 1
	jmp     Llege_011
Llege_007:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Llege_008
	mov     eax, 0
	jmp     Llege_011
Llege_008:  add     dword [rbp-8H], 1
Llege_009:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Llege_006
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jle     Llege_010
	mov     eax, 0
	jmp     Llege_011
	Llege_010:  mov     eax, 1
	Llege_011:  pop     rbp
	ret

string_ge:
	push    rbp
	mov     rbp, rsp
	mov     qword [rbp-18H], rdi
	mov     qword [rbp-20H], rsi
	mov     dword [rbp-10H], 0
	mov     dword [rbp-0CH], 0
	jmp     Llege_013
Llege_012:  add     dword [rbp-10H], 1
Llege_013:  mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_015
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_012
	mov     eax, dword [rbp-10H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_012
	jmp     Llege_015
Llege_014:  add     dword [rbp-0CH], 1
Llege_015:  mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	jz      Llege_016
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	test    al, al
	js      Llege_014
	mov     eax, dword [rbp-0CH]
	movsxd  rdx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rdx
	movzx   eax, byte [rax]
	cmp     al, 57
	jg      Llege_014
Llege_016:  mov     eax, dword [rbp-0CH]
	cmp     dword [rbp-10H], eax
	cmovle  eax, dword [rbp-10H]
	mov     dword [rbp-4H], eax
	mov     dword [rbp-8H], 0
	mov     dword [rbp-8H], 0
	jmp     Llege_020
Llege_017:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jle     Llege_018
	mov     eax, 1
	jmp     Llege_022
Llege_018:  mov     eax, dword [rbp-8H]
	movsxd  rdx, eax
	mov     rax, qword [rbp-18H]
	add     rax, rdx
	movzx   edx, byte [rax]
	mov     eax, dword [rbp-8H]
	movsxd  rcx, eax
	mov     rax, qword [rbp-20H]
	add     rax, rcx
	movzx   eax, byte [rax]
	cmp     dl, al
	jge     Llege_019
	mov     eax, 0
	jmp     Llege_022
Llege_019:  add     dword [rbp-8H], 1
Llege_020:  mov     eax, dword [rbp-8H]
	cmp     eax, dword [rbp-4H]
	jl      Llege_017
	mov     eax, dword [rbp-10H]
	cmp     eax, dword [rbp-0CH]
	jge     Llege_021
	mov     eax, 0
	jmp     Llege_022
Llege_021:  mov     eax, 1
Llege_022:  pop     rbp
	ret

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 208
		push		r11
		push		r15
		push		r12
		push		r10
		push		r13
		push		r14
		push		r9
		push		r8
		call	getInt
		mov		r15, rax
		mov		r12, r15
		call	init
		mov		r15, rax
		mov		rbx, qword [rel _global_fn]
		mov		rcx, 1
		mov		qword [rbx+rcx*8+8], 2
		mov		rbx, qword [rel _global_fc]
		mov		rcx, 1
		mov		qword [rbx+rcx*8+8], 3
		mov		rbx, qword [rel _global_fm]
		mov		rcx, 1
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 1
		mov		qword [rbx+rcx*8+8], 3
		mov		rbx, qword [rel _global_fm]
		mov		rcx, 1
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 2
		mov		qword [rbx+rcx*8+8], 4
		mov		rbx, qword [rel _global_fn]
		mov		rcx, 2
		mov		qword [rbx+rcx*8+8], 3
		mov		rbx, qword [rel _global_fc]
		mov		rcx, 2
		mov		qword [rbx+rcx*8+8], 3
		mov		rbx, qword [rel _global_fm]
		mov		rcx, 2
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 1
		mov		qword [rbx+rcx*8+8], 3
		mov		rbx, qword [rel _global_fm]
		mov		rcx, 2
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 2
		mov		qword [rbx+rcx*8+8], 4
		mov		rbx, qword [rel _global_fm]
		mov		rcx, 2
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 3
		mov		qword [rbx+rcx*8+8], 4
		mov		rbx, qword [rel _global_fn]
		mov		rcx, 3
		mov		qword [rbx+rcx*8+8], 4
		mov		rbx, qword [rel _global_fc]
		mov		rcx, 3
		mov		qword [rbx+rcx*8+8], 4
		mov		rbx, qword [rel _global_fm]
		mov		rcx, 3
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 1
		mov		qword [rbx+rcx*8+8], 5
		mov		rbx, qword [rel _global_fm]
		mov		rcx, 3
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 2
		mov		qword [rbx+rcx*8+8], 7
		mov		rbx, qword [rel _global_fm]
		mov		rcx, 3
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 3
		mov		qword [rbx+rcx*8+8], 8
		mov		rbx, qword [rel _global_fm]
		mov		rcx, 3
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 4
		mov		qword [rbx+rcx*8+8], 9
		mov		qword [rel _global_C], 4
		mov		qword [rel _global_M], 9
		mov		qword [rel _global_N], 4
		mov		qword [rel _global_Mod], 10007
		call	Calculate_G
		mov		r15, rax
		call	Calculate_Comb
		mov		r15, rax
		mov		r9, 1
		jmp		loop_cond_0
loop_body_0:
		mov		rbx, qword [rel _global_fn]
		mov		rcx, r9
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_fc]
		mov		rcx, r9
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-32], rsi
		mov		r13, 1
		jmp		loop_cond_1
loop_body_1:
		mov		rbx, qword [rel _global_fm]
		mov		rcx, r9
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, r13
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_m]
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r15
		inc		r13
loop_cond_1:
		cmp		r13, r14
		jle		loop_body_1
		jg		loop_end_1
loop_end_1:
		cmp		r14, 1
		je		if_true_0
		jne		if_false_0
if_true_0:
		mov		rbx, qword [rel _global_m]
		mov		rcx, 1
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_Comb]
		mov		rcx, r15
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, qword [rbp-32]
		mov		rdi, qword [rbx+rcx*8+8]
		call	toString
		mov		r15, rax
		mov		rdi, r15
		call	println
		mov		r15, rax
		jmp		if_end_0
if_false_0:
		mov		qword [rbp-56], 0
		mov		r10, 0
		mov		r13, 1
		jmp		loop_cond_2
loop_body_2:
		mov		rbx, qword [rel _global_m]
		mov		rcx, 1
		mov		rax, qword [rbx+rcx*8+8]
		cqo
		idiv		r13
		mov		r15, rax
		mov		rbx, qword [rel _global_m]
		mov		rcx, 1
		mov		rax, qword [rbx+rcx*8+8]
		cqo
		idiv		r15
		mov		r15, rax
		mov		qword [rbp-64], 2
		jmp		loop_cond_3
loop_body_3:
		mov		rbx, qword [rel _global_m]
		mov		rcx, qword [rbp-64]
		mov		rax, qword [rbx+rcx*8+8]
		cqo
		idiv		r13
		mov		r11, rax
		mov		rbx, qword [rel _global_m]
		mov		rcx, qword [rbp-64]
		mov		rax, qword [rbx+rcx*8+8]
		cqo
		idiv		r11
		mov		r11, rax
		cmp		r11, r15
		jl		if_true_1
		jge		if_false_1
if_true_1:
		mov		r15, r11
		jmp		if_end_1
if_false_1:
		nop
if_end_1:
		inc		qword [rbp-64]
loop_cond_3:
		cmp		qword [rbp-64], r14
		jle		loop_body_3
		jg		loop_end_3
loop_end_3:
		mov		rbx, qword [rel _global_m]
		mov		rcx, 1
		cmp		qword [rbx+rcx*8+8], r15
		jl		if_true_2
		jge		if_false_2
if_true_2:
		mov		rbx, qword [rel _global_m]
		mov		rcx, 1
		mov		r15, qword [rbx+rcx*8+8]
		jmp		if_end_2
if_false_2:
		nop
if_end_2:
		mov		r13, r15
		mov		rbx, qword [rel _global_b]
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], 1
		mov		qword [rbp-64], 1
		jmp		loop_cond_4
loop_body_4:
		mov		rbx, qword [rel _global_m]
		mov		rcx, qword [rbp-64]
		mov		rax, qword [rbx+rcx*8+8]
		cqo
		idiv		r13
		mov		r15, rax
		mov		rax, r15
		cqo
		idiv		qword [rel _global_Mod]
		mov		r11, rdx
		mov		r15, r11
		add		r15, 1
		mov		r8, r11
		imul		r8, r15
		mov		rax, r8
		mov		rsi, 2
		cqo
		idiv		rsi
		mov		r15, rax
		mov		rax, r15
		cqo
		idiv		qword [rel _global_Mod]
		mov		r15, rdx
		mov		qword [rbp-80], r15
		mov		rbx, qword [rel _global_m]
		mov		rcx, qword [rbp-64]
		mov		r15, qword [rbx+rcx*8+8]
		imul		r15, r11
		mov		rax, r15
		cqo
		idiv		qword [rel _global_Mod]
		mov		r15, rdx
		mov		r8, r15
		mov		r15, 0
		jmp		loop_cond_5
loop_body_5:
		mov		qword [rbp-88], r15
		add		qword [rbp-88], 1
		mov		r11, qword [rel _global_Mod]
		sub		r11, qword [rbp-80]
		mov		rbx, qword [rel _global_b]
		mov		rcx, r15
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-96], rsi
		mov		rdi, qword [rbp-96]
		imul		rdi, r11
		mov		qword [rbp-96], rdi
		mov		rax, qword [rbp-96]
		cqo
		idiv		qword [rel _global_Mod]
		mov		r11, rdx
		mov		rbx, qword [rel _global_res]
		mov		rcx, qword [rbp-88]
		mov		qword [rbx+rcx*8+8], r11
		inc		r15
loop_cond_5:
		mov		rsi, qword [rbp-64]
		cmp		r15, rsi
		jl		loop_body_5
		jge		loop_end_5
loop_end_5:
		mov		rbx, qword [rel _global_res]
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], 0
		mov		r15, 0
		jmp		loop_cond_6
loop_body_6:
		mov		qword [rbp-112], r8
		mov		rbx, qword [rel _global_b]
		mov		rcx, r15
		mov		rdi, qword [rbp-112]
		mov		rsi, qword [rbx+rcx*8+8]
		imul		rdi, rsi
		mov		qword [rbp-112], rdi
		mov		rbx, qword [rel _global_res]
		mov		rcx, r15
		mov		r11, qword [rbx+rcx*8+8]
		add		r11, qword [rbp-112]
		mov		rax, r11
		cqo
		idiv		qword [rel _global_Mod]
		mov		r11, rdx
		mov		rbx, qword [rel _global_res]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r11
		inc		r15
loop_cond_6:
		mov		rsi, qword [rbp-64]
		cmp		r15, rsi
		jl		loop_body_6
		jge		loop_end_6
loop_end_6:
		mov		r15, 0
		jmp		loop_cond_7
loop_body_7:
		mov		rbx, qword [rel _global_res]
		mov		rcx, r15
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_b]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r11
		inc		r15
loop_cond_7:
		mov		rsi, qword [rbp-64]
		cmp		r15, rsi
		jle		loop_body_7
		jg		loop_end_7
loop_end_7:
		inc		qword [rbp-64]
loop_cond_4:
		cmp		qword [rbp-64], r14
		jle		loop_body_4
		jg		loop_end_4
loop_end_4:
		mov		qword [rbp-64], 0
		jmp		loop_cond_8
loop_body_8:
		mov		rbx, qword [rel _global_Sum]
		mov		rcx, qword [rbp-64]
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, r13
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, qword [rbp-32]
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_Sum]
		mov		rcx, qword [rbp-64]
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, r11
		mov		rcx, r10
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, r11
		mov		rcx, qword [rbp-32]
		sub		r15, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_b]
		mov		rcx, qword [rbp-64]
		mov		r11, qword [rbx+rcx*8+8]
		imul		r11, r15
		mov		r15, qword [rbp-56]
		add		r15, r11
		mov		rax, r15
		cqo
		idiv		qword [rel _global_Mod]
		mov		r15, rdx
		mov		qword [rbp-56], r15
		inc		qword [rbp-64]
loop_cond_8:
		cmp		qword [rbp-64], r14
		jle		loop_body_8
		jg		loop_end_8
loop_end_8:
		mov		r10, r13
		inc		r13
loop_cond_2:
		mov		rbx, qword [rel _global_m]
		mov		rcx, 1
		mov		rsi, qword [rbx+rcx*8+8]
		cmp		r13, rsi
		jle		loop_body_2
		jg		loop_end_2
loop_end_2:
		cmp		qword [rbp-56], 0
		jl		if_true_3
		jge		if_false_3
if_true_3:
		mov		rsi, qword [rel _global_Mod]
		add		qword [rbp-56], rsi
		jmp		if_end_3
if_false_3:
		nop
if_end_3:
		mov		rdi, qword [rbp-56]
		call	toString
		mov		r15, rax
		mov		rdi, r15
		call	println
		mov		r15, rax
if_end_0:
		inc		r9
loop_cond_0:
		cmp		r9, r12
		jle		loop_body_0
		jg		loop_end_0
loop_end_0:
		mov		rax, 0
		pop		r8
		pop		r9
		pop		r14
		pop		r13
		pop		r10
		pop		r12
		pop		r15
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r8
		pop		r9
		pop		r14
		pop		r13
		pop		r10
		pop		r12
		pop		r15
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

init:
init_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 304
		push		r11
		push		r15
		push		r12
		push		r10
		push		r13
		push		r14
		push		r9
		push		r8
		mov		qword [rel _global_tot], 0
		mov		qword [rel _global_C], 0
		mov		qword [rel _global_M], 0
		mov		qword [rel _global_N], 0
		mov		rdi, 6
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r8, rax
		mov		rdi, 6
		mov		qword [rax+0], rdi
		mov		qword [rbp-8], 0
		jmp		loop_cond_9
loop_body_9:
		inc		qword [rbp-8]
loop_cond_9:
		cmp		qword [rbp-8], 6
		jl		loop_body_9
loop_end_9:
		mov		qword [rel _global_g], r8
		mov		qword [rbp-16], 0
		jmp		loop_cond_10
loop_body_10:
		mov		rdi, 100001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-24], rax
		mov		rdi, 100001
		mov		qword [rax+0], rdi
		mov		r8, 0
		jmp		loop_cond_11
loop_body_11:
		inc		r8
loop_cond_11:
		cmp		r8, 100001
		jl		loop_body_11
loop_end_11:
		mov		rbx, qword [rel _global_g]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbp-24]
		mov		qword [rbx+rcx*8+8], rsi
		mov		qword [rbp-40], 0
		jmp		loop_cond_12
loop_body_12:
		mov		rdi, 15
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-48], rax
		mov		rdi, 15
		mov		qword [rax+0], rdi
		mov		r8, 0
		jmp		loop_cond_13
loop_body_13:
		inc		r8
loop_cond_13:
		cmp		r8, 15
		jl		loop_body_13
loop_end_13:
		mov		rbx, qword [rel _global_g]
		mov		rcx, qword [rbp-16]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r8
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbp-48]
		mov		qword [rbx+rcx*8+8], rsi
		mov		qword [rbp-56], 0
		jmp		loop_cond_14
loop_body_14:
		mov		rbx, qword [rel _global_g]
		mov		rcx, qword [rbp-16]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r8
		mov		rcx, qword [rbp-40]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r8
		mov		rcx, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-56]
loop_cond_14:
		cmp		qword [rbp-56], 15
		jl		loop_body_14
		jge		loop_end_14
loop_end_14:
		inc		qword [rbp-40]
loop_cond_12:
		cmp		qword [rbp-40], 100001
		jl		loop_body_12
		jge		loop_end_12
loop_end_12:
		inc		qword [rbp-16]
loop_cond_10:
		cmp		qword [rbp-16], 6
		jl		loop_body_10
		jge		loop_end_10
loop_end_10:
		mov		rdi, 6
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-64], rax
		mov		rdi, 6
		mov		qword [rax+0], rdi
		mov		r8, 0
		jmp		loop_cond_15
loop_body_15:
		inc		r8
loop_cond_15:
		cmp		r8, 6
		jl		loop_body_15
loop_end_15:
		mov		rsi, qword [rbp-64]
		mov		qword [rel _global_Sum], rsi
		mov		qword [rbp-16], 0
		jmp		loop_cond_16
loop_body_16:
		mov		rdi, 100001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-72], rax
		mov		rdi, 100001
		mov		qword [rax+0], rdi
		mov		r8, 0
		jmp		loop_cond_17
loop_body_17:
		inc		r8
loop_cond_17:
		cmp		r8, 100001
		jl		loop_body_17
loop_end_17:
		mov		rbx, qword [rel _global_Sum]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbp-72]
		mov		qword [rbx+rcx*8+8], rsi
		mov		qword [rbp-40], 0
		jmp		loop_cond_18
loop_body_18:
		mov		rdi, 15
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r9, rax
		mov		rdi, 15
		mov		qword [rax+0], rdi
		mov		r8, 0
		jmp		loop_cond_19
loop_body_19:
		inc		r8
loop_cond_19:
		cmp		r8, 15
		jl		loop_body_19
loop_end_19:
		mov		rbx, qword [rel _global_Sum]
		mov		rcx, qword [rbp-16]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r8
		mov		rcx, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], r9
		mov		qword [rbp-56], 0
		jmp		loop_cond_20
loop_body_20:
		mov		rbx, qword [rel _global_Sum]
		mov		rcx, qword [rbp-16]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r8
		mov		rcx, qword [rbp-40]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r8
		mov		rcx, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-56]
loop_cond_20:
		cmp		qword [rbp-56], 15
		jl		loop_body_20
		jge		loop_end_20
loop_end_20:
		inc		qword [rbp-40]
loop_cond_18:
		cmp		qword [rbp-40], 100001
		jl		loop_body_18
		jge		loop_end_18
loop_end_18:
		inc		qword [rbp-16]
loop_cond_16:
		cmp		qword [rbp-16], 6
		jl		loop_body_16
		jge		loop_end_16
loop_end_16:
		mov		rdi, 1001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-88], rax
		mov		rdi, 1001
		mov		qword [rax+0], rdi
		mov		r9, 0
		jmp		loop_cond_21
loop_body_21:
		inc		r9
loop_cond_21:
		cmp		r9, 1001
		jl		loop_body_21
loop_end_21:
		mov		rsi, qword [rbp-88]
		mov		qword [rel _global_fm], rsi
		mov		qword [rbp-16], 0
		jmp		loop_cond_22
loop_body_22:
		mov		rdi, 13
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r12, rax
		mov		rdi, 13
		mov		qword [rax+0], rdi
		mov		r9, 0
		jmp		loop_cond_23
loop_body_23:
		inc		r9
loop_cond_23:
		cmp		r9, 13
		jl		loop_body_23
loop_end_23:
		mov		rbx, qword [rel _global_fm]
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], r12
		mov		qword [rbp-40], 0
		jmp		loop_cond_24
loop_body_24:
		mov		rbx, qword [rel _global_fm]
		mov		rcx, qword [rbp-16]
		mov		r9, qword [rbx+rcx*8+8]
		mov		rbx, r9
		mov		rcx, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-40]
loop_cond_24:
		cmp		qword [rbp-40], 13
		jl		loop_body_24
		jge		loop_end_24
loop_end_24:
		inc		qword [rbp-16]
loop_cond_22:
		cmp		qword [rbp-16], 1001
		jl		loop_body_22
		jge		loop_end_22
loop_end_22:
		mov		rdi, 100001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-104], rax
		mov		rdi, 100001
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_25
loop_body_25:
		inc		r12
loop_cond_25:
		cmp		r12, 100001
		jl		loop_body_25
loop_end_25:
		mov		rsi, qword [rbp-104]
		mov		qword [rel _global_ksm], rsi
		mov		qword [rbp-16], 0
		jmp		loop_cond_26
loop_body_26:
		mov		rdi, 21
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-112], rax
		mov		rdi, 21
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_27
loop_body_27:
		inc		r12
loop_cond_27:
		cmp		r12, 21
		jl		loop_body_27
loop_end_27:
		mov		rbx, qword [rel _global_ksm]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbp-112]
		mov		qword [rbx+rcx*8+8], rsi
		mov		qword [rbp-40], 0
		jmp		loop_cond_28
loop_body_28:
		mov		rbx, qword [rel _global_ksm]
		mov		rcx, qword [rbp-16]
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		rcx, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-40]
loop_cond_28:
		cmp		qword [rbp-40], 21
		jl		loop_body_28
		jge		loop_end_28
loop_end_28:
		inc		qword [rbp-16]
loop_cond_26:
		cmp		qword [rbp-16], 100001
		jl		loop_body_26
		jge		loop_end_26
loop_end_26:
		mov		rdi, 21
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r10, rax
		mov		rdi, 21
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_29
loop_body_29:
		inc		r12
loop_cond_29:
		cmp		r12, 21
		jl		loop_body_29
loop_end_29:
		mov		qword [rel _global_p], r10
		mov		qword [rbp-16], 0
		jmp		loop_cond_30
loop_body_30:
		mov		rdi, 21
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-128], rax
		mov		rdi, 21
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_31
loop_body_31:
		inc		r12
loop_cond_31:
		cmp		r12, 21
		jl		loop_body_31
loop_end_31:
		mov		rbx, qword [rel _global_p]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbp-128]
		mov		qword [rbx+rcx*8+8], rsi
		mov		qword [rbp-40], 0
		jmp		loop_cond_32
loop_body_32:
		mov		rbx, qword [rel _global_p]
		mov		rcx, qword [rbp-16]
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		rcx, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-40]
loop_cond_32:
		cmp		qword [rbp-40], 21
		jl		loop_body_32
		jge		loop_end_32
loop_end_32:
		inc		qword [rbp-16]
loop_cond_30:
		cmp		qword [rbp-16], 21
		jl		loop_body_30
		jge		loop_end_30
loop_end_30:
		mov		rdi, 21
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r13, rax
		mov		rdi, 21
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_33
loop_body_33:
		inc		r12
loop_cond_33:
		cmp		r12, 21
		jl		loop_body_33
loop_end_33:
		mov		qword [rel _global_q], r13
		mov		qword [rbp-16], 0
		jmp		loop_cond_34
loop_body_34:
		mov		rdi, 100001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-144], rax
		mov		rdi, 100001
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_35
loop_body_35:
		inc		r13
loop_cond_35:
		cmp		r13, 100001
		jl		loop_body_35
loop_end_35:
		mov		rbx, qword [rel _global_q]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbp-144]
		mov		qword [rbx+rcx*8+8], rsi
		mov		qword [rbp-40], 0
		jmp		loop_cond_36
loop_body_36:
		mov		rbx, qword [rel _global_q]
		mov		rcx, qword [rbp-16]
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-40]
loop_cond_36:
		cmp		qword [rbp-40], 100001
		jl		loop_body_36
		jge		loop_end_36
loop_end_36:
		inc		qword [rbp-16]
loop_cond_34:
		cmp		qword [rbp-16], 21
		jl		loop_body_34
		jge		loop_end_34
loop_end_34:
		mov		rdi, 100001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-160], rax
		mov		rdi, 100001
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_37
loop_body_37:
		inc		r13
loop_cond_37:
		cmp		r13, 100001
		jl		loop_body_37
loop_end_37:
		mov		rsi, qword [rbp-160]
		mov		qword [rel _global_Comb], rsi
		mov		qword [rbp-16], 0
		jmp		loop_cond_38
loop_body_38:
		mov		rdi, 21
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-168], rax
		mov		rdi, 21
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_39
loop_body_39:
		inc		r13
loop_cond_39:
		cmp		r13, 21
		jl		loop_body_39
loop_end_39:
		mov		rbx, qword [rel _global_Comb]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbp-168]
		mov		qword [rbx+rcx*8+8], rsi
		mov		qword [rbp-40], 0
		jmp		loop_cond_40
loop_body_40:
		mov		rbx, qword [rel _global_Comb]
		mov		rcx, qword [rbp-16]
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-40]
loop_cond_40:
		cmp		qword [rbp-40], 21
		jl		loop_body_40
		jge		loop_end_40
loop_end_40:
		inc		qword [rbp-16]
loop_cond_38:
		cmp		qword [rbp-16], 100001
		jl		loop_body_38
		jge		loop_end_38
loop_end_38:
		mov		rdi, 1001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r14, rax
		mov		rdi, 1001
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_41
loop_body_41:
		inc		r13
loop_cond_41:
		cmp		r13, 1001
		jl		loop_body_41
loop_end_41:
		mov		qword [rel _global_fn], r14
		mov		qword [rbp-16], 0
		jmp		loop_cond_42
loop_body_42:
		mov		rbx, qword [rel _global_fn]
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-16]
loop_cond_42:
		cmp		qword [rbp-16], 1001
		jl		loop_body_42
		jge		loop_end_42
loop_end_42:
		mov		rdi, 1001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-192], rax
		mov		rdi, 1001
		mov		qword [rax+0], rdi
		mov		r14, 0
		jmp		loop_cond_43
loop_body_43:
		inc		r14
loop_cond_43:
		cmp		r14, 1001
		jl		loop_body_43
loop_end_43:
		mov		rsi, qword [rbp-192]
		mov		qword [rel _global_fc], rsi
		mov		qword [rbp-16], 0
		jmp		loop_cond_44
loop_body_44:
		mov		rbx, qword [rel _global_fc]
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-16]
loop_cond_44:
		cmp		qword [rbp-16], 1001
		jl		loop_body_44
		jge		loop_end_44
loop_end_44:
		mov		rdi, 1001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-208], rax
		mov		rdi, 1001
		mov		qword [rax+0], rdi
		mov		r14, 0
		jmp		loop_cond_45
loop_body_45:
		inc		r14
loop_cond_45:
		cmp		r14, 1001
		jl		loop_body_45
loop_end_45:
		mov		rsi, qword [rbp-208]
		mov		qword [rel _global_m], rsi
		mov		qword [rbp-16], 0
		jmp		loop_cond_46
loop_body_46:
		mov		rbx, qword [rel _global_m]
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-16]
loop_cond_46:
		cmp		qword [rbp-16], 1001
		jl		loop_body_46
		jge		loop_end_46
loop_end_46:
		mov		rdi, 1001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r11, rax
		mov		rdi, 1001
		mov		qword [rax+0], rdi
		mov		r14, 0
		jmp		loop_cond_47
loop_body_47:
		inc		r14
loop_cond_47:
		cmp		r14, 1001
		jl		loop_body_47
loop_end_47:
		mov		qword [rel _global_res], r11
		mov		qword [rbp-16], 0
		jmp		loop_cond_48
loop_body_48:
		mov		rbx, qword [rel _global_res]
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-16]
loop_cond_48:
		cmp		qword [rbp-16], 1001
		jl		loop_body_48
		jge		loop_end_48
loop_end_48:
		mov		rdi, 1001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-232], rax
		mov		rdi, 1001
		mov		qword [rax+0], rdi
		mov		r14, 0
		jmp		loop_cond_49
loop_body_49:
		inc		r14
loop_cond_49:
		cmp		r14, 1001
		jl		loop_body_49
loop_end_49:
		mov		rsi, qword [rbp-232]
		mov		qword [rel _global_b], rsi
		mov		qword [rbp-16], 0
		jmp		loop_cond_50
loop_body_50:
		mov		rbx, qword [rel _global_b]
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-16]
loop_cond_50:
		cmp		qword [rbp-16], 1001
		jl		loop_body_50
		jge		loop_end_50
loop_end_50:
		mov		rdi, 100001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		qword [rbp-248], rax
		mov		rdi, 100001
		mov		qword [rax+0], rdi
		mov		r14, 0
		jmp		loop_cond_51
loop_body_51:
		inc		r14
loop_cond_51:
		cmp		r14, 100001
		jl		loop_body_51
loop_end_51:
		mov		rsi, qword [rbp-248]
		mov		qword [rel _global_v], rsi
		mov		qword [rbp-16], 0
		jmp		loop_cond_52
loop_body_52:
		mov		rbx, qword [rel _global_v]
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-16]
loop_cond_52:
		cmp		qword [rbp-16], 100001
		jl		loop_body_52
		jge		loop_end_52
loop_end_52:
		mov		rdi, 100001
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		mov		r15, rax
		mov		rdi, 100001
		mov		qword [rax+0], rdi
		mov		r14, 0
		jmp		loop_cond_53
loop_body_53:
		inc		r14
loop_cond_53:
		cmp		r14, 100001
		jl		loop_body_53
loop_end_53:
		mov		qword [rel _global_prime], r15
		mov		qword [rbp-16], 0
		jmp		loop_cond_54
loop_body_54:
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], 0
		inc		qword [rbp-16]
loop_cond_54:
		cmp		qword [rbp-16], 100001
		jl		loop_body_54
		jge		loop_end_54
loop_end_54:
		pop		r8
		pop		r9
		pop		r14
		pop		r13
		pop		r10
		pop		r12
		pop		r15
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

Ksm:
Ksm_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r15
		push		r12
		push		r13
		push		r14
		mov		r14, rdi
		mov		r13, rsi
		cmp		r13, 0
		je		if_true_4
		jne		if_false_4
if_true_4:
		mov		rax, 1
		pop		r14
		pop		r13
		pop		r12
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_4
if_false_4:
		nop
if_end_4:
		cmp		r13, 1
		je		if_true_5
		jne		if_false_5
if_true_5:
		mov		rax, r14
		cqo
		idiv		qword [rel _global_Mod]
		mov		r15, rdx
		mov		rax, r15
		pop		r14
		pop		r13
		pop		r12
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_5
if_false_5:
		nop
if_end_5:
		mov		r15, r13
		sar		r15, 1
		mov		rdi, r14
		mov		rsi, r15
		call	Ksm
		mov		r15, rax
		mov		r12, r15
		mov		rax, r13
		mov		rsi, 2
		cqo
		idiv		rsi
		mov		r15, rdx
		cmp		r15, 1
		je		if_true_6
		jne		if_false_6
if_true_6:
		mov		r15, r12
		imul		r15, r12
		mov		rax, r15
		cqo
		idiv		qword [rel _global_Mod]
		mov		r15, rdx
		imul		r15, r14
		mov		rax, r15
		cqo
		idiv		qword [rel _global_Mod]
		mov		r15, rdx
		mov		rax, r15
		pop		r14
		pop		r13
		pop		r12
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_6
if_false_6:
		mov		r15, r12
		imul		r15, r12
		mov		rax, r15
		cqo
		idiv		qword [rel _global_Mod]
		mov		r15, rdx
		mov		rax, r15
		pop		r14
		pop		r13
		pop		r12
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret
if_end_6:
		pop		r14
		pop		r13
		pop		r12
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

Calculate_p:
Calculate_p_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r11
		push		r15
		push		r12
		push		r10
		push		r13
		push		r14
		mov		rbx, qword [rel _global_p]
		mov		rcx, 0
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], 1
		mov		rbx, qword [rel _global_p]
		mov		rcx, 1
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 1
		mov		qword [rbx+rcx*8+8], 1
		mov		r14, qword [rel _global_Mod]
		sub		r14, 1
		mov		rbx, qword [rel _global_p]
		mov		rcx, 1
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], r14
		mov		r12, 2
		jmp		loop_cond_55
loop_body_55:
		mov		r15, qword [rel _global_Mod]
		sub		r15, 2
		mov		rdi, r12
		mov		rsi, r15
		call	Ksm
		mov		r15, rax
		mov		r14, 0
		jmp		loop_cond_56
loop_body_56:
		mov		r10, r14
		add		r10, 1
		mov		r13, r12
		sub		r13, 1
		mov		rbx, qword [rel _global_p]
		mov		rcx, r13
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_p]
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r10
		mov		qword [rbx+rcx*8+8], r11
		inc		r14
loop_cond_56:
		cmp		r14, r12
		jl		loop_body_56
		jge		loop_end_56
loop_end_56:
		mov		r14, 0
		jmp		loop_cond_57
loop_body_57:
		mov		r13, r12
		sub		r13, 1
		mov		rbx, qword [rel _global_p]
		mov		rcx, r13
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		r13, qword [rbx+rcx*8+8]
		imul		r13, r12
		mov		rax, r13
		cqo
		idiv		qword [rel _global_Mod]
		mov		r11, rdx
		mov		rbx, qword [rel _global_p]
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		r13, qword [rbx+rcx*8+8]
		sub		r13, r11
		add		r13, qword [rel _global_Mod]
		imul		r13, r15
		mov		rax, r13
		cqo
		idiv		qword [rel _global_Mod]
		mov		r13, rdx
		mov		rbx, qword [rel _global_p]
		mov		rcx, r12
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, r11
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r13
		inc		r14
loop_cond_57:
		cmp		r14, r12
		jle		loop_body_57
		jg		loop_end_57
loop_end_57:
		inc		r12
loop_cond_55:
		mov		r15, qword [rel _global_C]
		sub		r15, 2
		cmp		r12, r15
		jle		loop_body_55
		jg		loop_end_55
loop_end_55:
		pop		r14
		pop		r13
		pop		r10
		pop		r12
		pop		r15
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

Euler:
Euler_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r11
		push		r15
		push		r12
		push		r10
		push		r13
		push		r14
		push		r9
		mov		r11, rdi
		mov		qword [rel _global_tot], 0
		mov		rbx, qword [rel _global_q]
		mov		rcx, r11
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 1
		mov		qword [rbx+rcx*8+8], 1
		mov		r15, 0
		jmp		loop_cond_58
loop_body_58:
		mov		rbx, qword [rel _global_v]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], 0
		inc		r15
loop_cond_58:
		cmp		r15, 100001
		jl		loop_body_58
		jge		loop_end_58
loop_end_58:
		mov		r15, 2
		jmp		loop_cond_59
loop_body_59:
		mov		rbx, qword [rel _global_v]
		mov		rcx, r15
		cmp		qword [rbx+rcx*8+8], 0
		je		if_true_7
		jne		if_false_7
if_true_7:
		inc		qword [rel _global_tot]
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rel _global_tot]
		mov		qword [rbx+rcx*8+8], r15
		mov		rbx, qword [rel _global_ksm]
		mov		rcx, r15
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, r11
		mov		r14, qword [rbx+rcx*8+8]
		add		r14, qword [rel _global_Mod]
		sub		r14, 1
		mov		rax, r14
		cqo
		idiv		qword [rel _global_Mod]
		mov		r13, rdx
		mov		rbx, qword [rel _global_q]
		mov		rcx, r11
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r13
		jmp		if_end_7
if_false_7:
		nop
if_end_7:
		mov		r13, 1
		jmp		loop_cond_60
loop_body_60:
		mov		rbx, qword [rel _global_prime]
		mov		rcx, r13
		mov		r14, qword [rbx+rcx*8+8]
		imul		r14, r15
		mov		rbx, qword [rel _global_v]
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], 1
		mov		rbx, qword [rel _global_prime]
		mov		rcx, r13
		mov		rax, r15
		cqo
		idiv		qword [rbx+rcx*8+8]
		mov		r14, rdx
		cmp		r14, 0
		je		if_true_8
		jne		if_false_8
if_true_8:
		mov		r14, r15
		mov		rbx, qword [rel _global_prime]
		mov		rcx, r13
		imul		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_q]
		mov		rcx, r11
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		rcx, r15
		mov		r10, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_prime]
		mov		rcx, r13
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_ksm]
		mov		rcx, r12
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		rcx, r11
		imul		r10, qword [rbx+rcx*8+8]
		mov		rax, r10
		cqo
		idiv		qword [rel _global_Mod]
		mov		r12, rdx
		mov		rbx, qword [rel _global_q]
		mov		rcx, r11
		mov		r10, qword [rbx+rcx*8+8]
		mov		rbx, r10
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r12
		jmp		loop_end_60
		jmp		if_end_8
if_false_8:
		mov		r10, r15
		mov		rbx, qword [rel _global_prime]
		mov		rcx, r13
		imul		r10, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_q]
		mov		rcx, r11
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, r15
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_q]
		mov		rcx, r11
		mov		r9, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_prime]
		mov		rcx, r13
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, r9
		mov		rcx, r12
		imul		r14, qword [rbx+rcx*8+8]
		mov		rax, r14
		cqo
		idiv		qword [rel _global_Mod]
		mov		r14, rdx
		mov		rbx, qword [rel _global_q]
		mov		rcx, r11
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		rcx, r10
		mov		qword [rbx+rcx*8+8], r14
if_end_8:
		inc		r13
loop_cond_60:
		mov		rsi, qword [rel _global_tot]
		cmp		r13, rsi
		jle		short_mid_0
		jg		loop_end_60
short_mid_0:
		mov		rbx, qword [rel _global_prime]
		mov		rcx, r13
		mov		r14, qword [rbx+rcx*8+8]
		imul		r14, r15
		mov		rsi, qword [rel _global_M]
		cmp		r14, rsi
		jle		loop_body_60
		jg		loop_end_60
loop_end_60:
		inc		r15
loop_cond_59:
		mov		rsi, qword [rel _global_M]
		cmp		r15, rsi
		jle		loop_body_59
		jg		loop_end_59
loop_end_59:
		pop		r9
		pop		r14
		pop		r13
		pop		r10
		pop		r12
		pop		r15
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

Calculate_q:
Calculate_q_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r15
		push		r14
		mov		r14, 0
		jmp		loop_cond_61
loop_body_61:
		mov		rdi, r14
		call	Euler
		mov		r15, rax
		inc		r14
loop_cond_61:
		mov		r15, qword [rel _global_C]
		sub		r15, 2
		cmp		r14, r15
		jle		loop_body_61
		jg		loop_end_61
loop_end_61:
		pop		r14
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

Calculate_Ksm:
Calculate_Ksm_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r15
		push		r12
		push		r13
		push		r14
		mov		r13, 1
		jmp		loop_cond_62
loop_body_62:
		mov		rbx, qword [rel _global_ksm]
		mov		rcx, r13
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], 1
		mov		r12, 1
		jmp		loop_cond_63
loop_body_63:
		mov		r15, r12
		sub		r15, 1
		mov		rbx, qword [rel _global_ksm]
		mov		rcx, r13
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, r15
		mov		r15, qword [rbx+rcx*8+8]
		imul		r15, r13
		mov		rax, r15
		cqo
		idiv		qword [rel _global_Mod]
		mov		r15, rdx
		mov		rbx, qword [rel _global_ksm]
		mov		rcx, r13
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, r12
		mov		qword [rbx+rcx*8+8], r15
		inc		r12
loop_cond_63:
		mov		r15, qword [rel _global_C]
		sub		r15, 2
		cmp		r12, r15
		jle		loop_body_63
		jg		loop_end_63
loop_end_63:
		inc		r13
loop_cond_62:
		mov		rsi, qword [rel _global_M]
		cmp		r13, rsi
		jle		loop_body_62
		jg		loop_end_62
loop_end_62:
		pop		r14
		pop		r13
		pop		r12
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

Calculate_G:
Calculate_G_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r11
		push		r15
		push		r12
		push		r13
		push		r14
		call	Calculate_Ksm
		mov		r15, rax
		call	Calculate_p
		mov		r15, rax
		call	Calculate_q
		mov		r15, rax
		mov		r14, 1
		jmp		loop_cond_64
loop_body_64:
		mov		r12, 2
		jmp		loop_cond_65
loop_body_65:
		mov		r15, 0
		jmp		loop_cond_66
loop_body_66:
		mov		r13, r12
		sub		r13, 2
		mov		rbx, qword [rel _global_p]
		mov		rcx, r13
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r15
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_q]
		mov		rcx, r15
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		imul		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_g]
		mov		rcx, 0
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		add		r13, r11
		mov		rax, r13
		cqo
		idiv		qword [rel _global_Mod]
		mov		r11, rdx
		mov		rbx, qword [rel _global_g]
		mov		rcx, 0
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r12
		mov		qword [rbx+rcx*8+8], r11
		inc		r15
loop_cond_66:
		mov		r13, r12
		sub		r13, 2
		cmp		r15, r13
		jle		loop_body_66
		jg		loop_end_66
loop_end_66:
		mov		r15, 1
		jmp		loop_cond_67
loop_body_67:
		mov		r13, r15
		sub		r13, 1
		mov		rbx, qword [rel _global_g]
		mov		rcx, r13
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		imul		r13, r14
		mov		rax, r13
		cqo
		idiv		qword [rel _global_Mod]
		mov		r11, rdx
		mov		rbx, qword [rel _global_g]
		mov		rcx, r15
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r12
		mov		qword [rbx+rcx*8+8], r11
		inc		r15
loop_cond_67:
		mov		rsi, qword [rel _global_N]
		cmp		r15, rsi
		jle		loop_body_67
		jg		loop_end_67
loop_end_67:
		inc		r12
loop_cond_65:
		mov		rsi, qword [rel _global_C]
		cmp		r12, rsi
		jle		loop_body_65
		jg		loop_end_65
loop_end_65:
		inc		r14
loop_cond_64:
		mov		rsi, qword [rel _global_M]
		cmp		r14, rsi
		jle		loop_body_64
		jg		loop_end_64
loop_end_64:
		mov		r15, 0
		jmp		loop_cond_68
loop_body_68:
		mov		r14, 2
		jmp		loop_cond_69
loop_body_69:
		mov		r12, 1
		jmp		loop_cond_70
loop_body_70:
		mov		r13, r12
		sub		r13, 1
		mov		rbx, qword [rel _global_Sum]
		mov		rcx, r15
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, r11
		mov		rcx, r13
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_g]
		mov		rcx, r15
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		add		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_Sum]
		mov		rcx, r15
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r11
		mov		rbx, qword [rel _global_Sum]
		mov		rcx, r15
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		rsi, qword [rel _global_Mod]
		cmp		qword [rbx+rcx*8+8], rsi
		jge		if_true_9
		jl		if_false_9
if_true_9:
		mov		rbx, qword [rel _global_Sum]
		mov		rcx, r15
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		r11, qword [rbx+rcx*8+8]
		sub		r11, qword [rel _global_Mod]
		mov		rbx, qword [rel _global_Sum]
		mov		rcx, r15
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r11
		jmp		if_end_9
if_false_9:
		nop
if_end_9:
		inc		r12
loop_cond_70:
		mov		rsi, qword [rel _global_M]
		cmp		r12, rsi
		jle		loop_body_70
		jg		loop_end_70
loop_end_70:
		inc		r14
loop_cond_69:
		mov		rsi, qword [rel _global_C]
		cmp		r14, rsi
		jle		loop_body_69
		jg		loop_end_69
loop_end_69:
		inc		r15
loop_cond_68:
		mov		rsi, qword [rel _global_N]
		cmp		r15, rsi
		jle		loop_body_68
		jg		loop_end_68
loop_end_68:
		pop		r14
		pop		r13
		pop		r12
		pop		r15
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

Calculate_Comb:
Calculate_Comb_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r11
		push		r15
		push		r12
		push		r10
		push		r13
		push		r14
		mov		r12, 0
		jmp		loop_cond_71
loop_body_71:
		mov		rbx, qword [rel _global_Comb]
		mov		rcx, r12
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], 1
		inc		r12
loop_cond_71:
		mov		rsi, qword [rel _global_M]
		cmp		r12, rsi
		jle		loop_body_71
		jg		loop_end_71
loop_end_71:
		mov		r12, 1
		jmp		loop_cond_72
loop_body_72:
		mov		r14, 1
		jmp		loop_cond_73
loop_body_73:
		mov		r15, r12
		sub		r15, 1
		mov		r13, r12
		sub		r13, 1
		mov		r11, r14
		sub		r11, 1
		mov		rbx, qword [rel _global_Comb]
		mov		rcx, r15
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, r14
		mov		r10, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_Comb]
		mov		rcx, r13
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, r11
		add		r10, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_Comb]
		mov		rcx, r12
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r10
		mov		rbx, qword [rel _global_Comb]
		mov		rcx, r12
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, r14
		mov		rsi, qword [rel _global_Mod]
		cmp		qword [rbx+rcx*8+8], rsi
		jge		if_true_10
		jl		if_false_10
if_true_10:
		mov		rbx, qword [rel _global_Comb]
		mov		rcx, r12
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, r14
		mov		r15, qword [rbx+rcx*8+8]
		sub		r15, qword [rel _global_Mod]
		mov		rbx, qword [rel _global_Comb]
		mov		rcx, r12
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r15
		jmp		if_end_10
if_false_10:
		nop
if_end_10:
		inc		r14
loop_cond_73:
		mov		rsi, qword [rel _global_C]
		cmp		r14, rsi
		jle		loop_body_73
		jg		loop_end_73
loop_end_73:
		inc		r12
loop_cond_72:
		mov		rsi, qword [rel _global_M]
		cmp		r12, rsi
		jle		loop_body_72
		jg		loop_end_72
loop_end_72:
		pop		r14
		pop		r13
		pop		r10
		pop		r12
		pop		r15
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

_global_Mod:
		dq 0
_global_p:
		dq 0
_global_res:
		dq 0
_global_ksm:
		dq 0
_global_prime:
		dq 0
_global_tot:
		dq 0
_global_v:
		dq 0
_global_q:
		dq 0
_global_g:
		dq 0
_global_Sum:
		dq 0
_global_m:
		dq 0
_global_b:
		dq 0
_global_Comb:
		dq 0
_global_C:
		dq 0
_global_M:
		dq 0
_global_N:
		dq 0
_global_fn:
		dq 0
_global_fc:
		dq 0
_global_fm:
		dq 0
intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
