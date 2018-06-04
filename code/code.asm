default rel

global string_length
global string_ord
global string_substring
global string_parseInt
global main
global square
global gcd
global lcm
global Rand
global RandRange
global init
global build
global pushdown
global update
global query
global print
global toString
global addString__
global println
global getInt
global getString

global _global_b
global _global_now
global _global_t
global _global_a
global _global_n
global _global_m
global _global_p
global _global_op
global _global_L
global _global_flag
global _global_s
global _global_sum
global _global_ans
global _global_aa
global _global_bb
global _global_MOD
global _global_no
global _global_pl
global _global_pr

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
		sub		rsp, 200
		push		r14
		push		r9
		push		r8
		push		r12
		push		r15
		push		r13
		push		r10
		push		r11
		mov		rdi, 500005
		inc		rdi
		imul		rdi, 8
		mov		rdi, rdi
		call	malloc
		mov		r13, rax
		mov		rdi, 500005
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_0
loop_body_0:
		inc		r12
loop_cond_0:
		cmp		r12, 500005
		jl		loop_body_0
loop_end_0:
		mov		qword [rel _global_b], r13
		mov		rdi, 500005
		inc		rdi
		imul		rdi, 8
		mov		rdi, rdi
		call	malloc
		mov		r12, rax
		mov		rdi, 500005
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_1
loop_body_1:
		inc		r13
loop_cond_1:
		cmp		r13, 500005
		jl		loop_body_1
loop_end_1:
		mov		qword [rel _global_now], r12
		mov		rdi, 500005
		inc		rdi
		imul		rdi, 8
		mov		rdi, rdi
		call	malloc
		mov		r13, rax
		mov		rdi, 500005
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_2
loop_body_2:
		inc		r12
loop_cond_2:
		cmp		r12, 500005
		jl		loop_body_2
loop_end_2:
		mov		qword [rel _global_t], r13
		mov		rdi, 200005
		inc		rdi
		imul		rdi, 8
		mov		rdi, rdi
		call	malloc
		mov		r13, rax
		mov		rdi, 200005
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_3
loop_body_3:
		inc		r12
loop_cond_3:
		cmp		r12, 200005
		jl		loop_body_3
loop_end_3:
		mov		qword [rel _global_a], r13
		mov		qword [rel _global_L], 1
		mov		rdi, 500005
		inc		rdi
		imul		rdi, 8
		mov		rdi, rdi
		call	malloc
		mov		r13, rax
		mov		rdi, 500005
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_4
loop_body_4:
		inc		r12
loop_cond_4:
		cmp		r12, 500005
		jl		loop_body_4
loop_end_4:
		mov		qword [rel _global_flag], r13
		mov		rdi, 500005
		inc		rdi
		imul		rdi, 8
		mov		rdi, rdi
		call	malloc
		mov		r13, rax
		mov		rdi, 500005
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_5
loop_body_5:
		mov		rbx, r13
		mov		rcx, r12
		mov		rdi, 80
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
		mov		rdi, rdi
		call	malloc
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 80
		mov		qword [rax+0], rdi
		mov		qword [rbp-8], 0
		jmp		loop_cond_6
loop_body_6:
		inc		qword [rbp-8]
loop_cond_6:
		cmp		qword [rbp-8], 80
		jl		loop_body_6
loop_end_6:
		inc		r12
loop_cond_5:
		cmp		r12, 500005
		jl		loop_body_5
loop_end_5:
		mov		qword [rel _global_s], r13
		mov		rdi, 500005
		inc		rdi
		imul		rdi, 8
		mov		rdi, rdi
		call	malloc
		mov		r12, rax
		mov		rdi, 500005
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_7
loop_body_7:
		inc		r13
loop_cond_7:
		cmp		r13, 500005
		jl		loop_body_7
loop_end_7:
		mov		qword [rel _global_sum], r12
		mov		qword [rel _global_ans], 0
		mov		qword [rel _global_aa], 13131
		mov		qword [rel _global_bb], 5353
		mov		r11, 2
		sal		r11, 14
		sub		r11, 7
		mov		qword [rel _global_MOD], r11
		mov		qword [rel _global_no], 1
		mov		qword [rel _global_pl], 0
		mov		qword [rel _global_pr], 0
		call	getInt
		mov		r11, rax
		mov		qword [rel _global_n], r11
		call	getInt
		mov		r11, rax
		mov		qword [rel _global_m], r11
		call	getInt
		mov		r11, rax
		mov		qword [rel _global_p], r11
		mov		r13, 1
		mov		r13, 1
		jmp		loop_cond_8
loop_body_8:
		mov		rdi, 0
		mov		rsi, qword [rel _global_p]
		call	RandRange
		mov		qword [rbp-16], rax
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		mov		rsi, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], rsi
		inc		r13
loop_cond_8:
		mov		rsi, qword [rel _global_n]
		cmp		r13, rsi
		jle		loop_body_8
		jg		loop_end_8
loop_end_8:
		call	init
		mov		r13, rax
		mov		rdi, 1
		mov		rsi, 1
		mov		rdx, qword [rel _global_n]
		call	build
		mov		r13, rax
		jmp		loop_cond_9
loop_body_9:
		call	Rand
		mov		r14, rax
		mov		rax, r14
		mov		rsi, 2
		cqo
		idiv		rsi
		mov		qword [rbp-24], rdx
		mov		rsi, qword [rbp-24]
		mov		qword [rel _global_op], rsi
		mov		rdi, 1
		mov		rsi, qword [rel _global_n]
		call	RandRange
		mov		r8, rax
		mov		qword [rel _global_pl], r8
		mov		rdi, 1
		mov		rsi, qword [rel _global_n]
		call	RandRange
		mov		qword [rbp-32], rax
		mov		rsi, qword [rbp-32]
		mov		qword [rel _global_pr], rsi
		jmp		loop_cond_10
loop_body_10:
		mov		rdi, 1
		mov		rsi, qword [rel _global_n]
		call	RandRange
		mov		r10, rax
		mov		qword [rel _global_pr], r10
loop_cond_10:
		mov		rsi, qword [rel _global_pl]
		cmp		qword [rel _global_pr], rsi
		jle		loop_body_10
		jg		loop_end_10
loop_end_10:
		cmp		qword [rel _global_op], 0
		je		if_true_0
		jne		if_false_0
if_true_0:
		mov		rdi, 1
		mov		rsi, 1
		mov		rdx, qword [rel _global_n]
		call	update
		mov		r13, rax
		jmp		if_end_0
if_false_0:
		nop
if_end_0:
		cmp		qword [rel _global_op], 1
		je		if_true_1
		jne		if_false_1
if_true_1:
		mov		rdi, 1
		mov		rsi, 1
		mov		rdx, qword [rel _global_n]
		call	query
		mov		r9, rax
		mov		rsi, qword [rel _global_ans]
		mov		qword [rbp-40], rsi
		mov		rdi, qword [rbp-40]
		add		rdi, r9
		mov		qword [rbp-40], rdi
		mov		rax, qword [rbp-40]
		cqo
		idiv		qword [rel _global_MOD]
		mov		r15, rdx
		mov		qword [rel _global_ans], r15
		jmp		if_end_1
if_false_1:
		nop
if_end_1:
		mov		r13, qword [rel _global_m]
		dec		qword [rel _global_m]
loop_cond_9:
		cmp		qword [rel _global_m], 0
		jg		loop_body_9
		jle		loop_end_9
loop_end_9:
		mov		rdi, qword [rel _global_ans]
		call	toString
		mov		qword [rbp-48], rax
		mov		rdi, qword [rbp-48]
		call	print
		mov		r15, rax
		mov		rax, 0
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r8
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r8
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

square:
square_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r14
		push		r15
		mov		r14, rdi
		mov		rax, r14
		cqo
		idiv		qword [rel _global_p]
		mov		r15, rdx
		mov		rax, r14
		cqo
		idiv		qword [rel _global_p]
		mov		r14, rdx
		imul		r15, r14
		mov		rax, r15
		pop		r15
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r15
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

gcd:
gcd_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r14
		push		r12
		push		r15
		push		r13
		mov		r14, rdi
		mov		r13, rsi
		cmp		r13, 0
		je		if_true_2
		jne		if_false_2
if_true_2:
		mov		rax, r14
		pop		r13
		pop		r15
		pop		r12
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_2
if_false_2:
		nop
if_end_2:
		cmp		r14, r13
		jl		if_true_3
		jge		if_false_3
if_true_3:
		mov		rdi, r13
		mov		rsi, r14
		call	gcd
		mov		r15, rax
		mov		rax, r15
		pop		r13
		pop		r15
		pop		r12
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_3
if_false_3:
		mov		rax, r14
		cqo
		idiv		r13
		mov		r12, rdx
		mov		rdi, r13
		mov		rsi, r12
		call	gcd
		mov		r12, rax
		mov		rax, r12
		pop		r13
		pop		r15
		pop		r12
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
if_end_3:
		pop		r13
		pop		r15
		pop		r12
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

lcm:
lcm_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r14
		push		r15
		push		r13
		mov		r14, rdi
		mov		r13, rsi
		mov		rdi, r14
		mov		rsi, r13
		call	gcd
		mov		r15, rax
		mov		rax, r14
		cqo
		idiv		r15
		mov		r15, rax
		imul		r15, r13
		mov		rax, r15
		pop		r13
		pop		r15
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r13
		pop		r15
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

Rand:
Rand_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r14
		push		r12
		push		r15
		push		r13
		push		r10
		push		r11
		mov		r14, 1
		mov		r14, 1
		jmp		loop_cond_11
loop_body_11:
		mov		r12, qword [rel _global_no]
		mov		rsi, qword [rel _global_aa]
		imul		r12, rsi
		mov		r10, r12
		mov		rsi, qword [rel _global_bb]
		add		r10, rsi
		mov		rax, r10
		cqo
		idiv		qword [rel _global_MOD]
		mov		r13, rdx
		mov		qword [rel _global_no], r13
		mov		r11, r14
		inc		r14
loop_cond_11:
		cmp		r14, 3
		jl		loop_body_11
		jge		loop_end_11
loop_end_11:
		cmp		qword [rel _global_no], 0
		jl		if_true_4
		jge		if_false_4
if_true_4:
		mov		r15, qword [rel _global_no]
		neg		r15
		mov		qword [rel _global_no], r15
		jmp		if_end_4
if_false_4:
		nop
if_end_4:
		mov		rax, qword [rel _global_no]
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

RandRange:
RandRange_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r14
		push		r15
		push		r13
		mov		r13, rdi
		mov		r15, rsi
		call	Rand
		mov		r14, rax
		sub		r15, r13
		add		r15, 1
		mov		rax, r14
		cqo
		idiv		r15
		mov		r14, rdx
		mov		r15, r13
		add		r15, r14
		add		r15, 1
		mov		rax, r15
		pop		r13
		pop		r15
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r13
		pop		r15
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

init:
init_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r14
		push		r9
		push		r8
		push		r12
		push		r15
		push		r13
		push		r10
		push		r11
		mov		rdi, 140005
		inc		rdi
		imul		rdi, 8
		mov		rdi, rdi
		call	malloc
		mov		r13, rax
		mov		rdi, 140005
		mov		qword [rax+0], rdi
		mov		r9, 0
		jmp		loop_cond_12
loop_body_12:
		inc		r9
loop_cond_12:
		cmp		r9, 140005
		jl		loop_body_12
loop_end_12:
		mov		r9, 0
		mov		r8, 0
		mov		r9, 2
		jmp		loop_cond_13
loop_body_13:
		mov		rbx, r13
		mov		rcx, r9
		mov		qword [rbx+rcx*8+8], r9
		inc		r9
loop_cond_13:
		mov		rsi, qword [rel _global_p]
		cmp		r9, rsi
		jl		loop_body_13
		jge		loop_end_13
loop_end_13:
		mov		r9, 2
		jmp		loop_cond_14
loop_body_14:
		mov		r8, 1
		jmp		loop_cond_15
loop_body_15:
		mov		rbx, r13
		mov		rcx, r9
		mov		rdi, qword [rbx+rcx*8+8]
		call	square
		mov		r11, rax
		mov		rax, r11
		cqo
		idiv		qword [rel _global_p]
		mov		r10, rdx
		mov		rbx, r13
		mov		rcx, r9
		mov		qword [rbx+rcx*8+8], r10
		inc		r8
loop_cond_15:
		cmp		r8, 15
		jle		loop_body_15
		jg		loop_end_15
loop_end_15:
		inc		r9
loop_cond_14:
		mov		rsi, qword [rel _global_p]
		cmp		r9, rsi
		jl		loop_body_14
		jge		loop_end_14
loop_end_14:
		mov		r9, 2
		jmp		loop_cond_16
loop_body_16:
		mov		rbx, r13
		mov		rcx, r9
		mov		r11, qword [rbx+rcx*8+8]
		mov		r10, 1
		jmp		loop_cond_17
loop_body_17:
		mov		rdi, r11
		call	square
		mov		r14, rax
		mov		rax, r14
		cqo
		idiv		qword [rel _global_p]
		mov		r15, rdx
		mov		r11, r15
		mov		rbx, qword [rel _global_b]
		mov		rcx, r11
		mov		qword [rbx+rcx*8+8], 1
		mov		rbx, r13
		mov		rcx, r9
		mov		rsi, qword [rbx+rcx*8+8]
		cmp		r11, rsi
		je		if_true_5
		jne		if_false_5
if_true_5:
		jmp		loop_end_17
		jmp		if_end_5
if_false_5:
		nop
if_end_5:
		inc		r10
loop_cond_17:
		jmp		loop_body_17
loop_end_17:
		mov		rdi, qword [rel _global_L]
		mov		rsi, r10
		call	lcm
		mov		r12, rax
		mov		qword [rel _global_L], r12
		inc		r9
loop_cond_16:
		mov		rsi, qword [rel _global_p]
		cmp		r9, rsi
		jl		loop_body_16
		jge		loop_end_16
loop_end_16:
		mov		rbx, qword [rel _global_b]
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], 1
		mov		rbx, qword [rel _global_b]
		mov		rcx, 1
		mov		qword [rbx+rcx*8+8], 1
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r8
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

build:
build_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 248
		push		r14
		push		r9
		push		r8
		push		r12
		push		r15
		push		r13
		push		r10
		push		r11
		mov		qword [rbp-8], rdi
		mov		qword [rbp-16], rsi
		mov		qword [rbp-24], rdx
		mov		qword [rbp-32], 0
		mov		rsi, qword [rbp-24]
		cmp		qword [rbp-16], rsi
		je		if_true_6
		jne		if_false_6
if_true_6:
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-40], rsi
		mov		rbx, qword [rel _global_sum]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rel _global_p]
		cmp		qword [rbx+rcx*8+8], rsi
		jl		short_mid_1
		jge		if_false_7
short_mid_1:
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-16]
		cmp		qword [rbx+rcx*8+8], 0
		jge		short_mid_0
		jl		if_false_7
short_mid_0:
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-16]
		mov		rax, qword [rbx+rcx*8+8]
		cqo
		idiv		qword [rel _global_p]
		mov		qword [rbp-48], rdx
		mov		rbx, qword [rel _global_b]
		mov		rcx, qword [rbp-48]
		cmp		qword [rbx+rcx*8+8], 0
		jg		if_true_7
		jle		if_false_7
if_true_7:
		mov		rbx, qword [rel _global_flag]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], 1
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rel _global_s]
		mov		rcx, qword [rbp-8]
		mov		r9, qword [rbx+rcx*8+8]
		mov		rbx, r9
		mov		rcx, 0
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		mov		qword [rbp-32], 1
		jmp		loop_cond_18
loop_body_18:
		mov		rsi, qword [rbp-32]
		mov		qword [rbp-64], rsi
		mov		rdi, qword [rbp-64]
		sub		rdi, 1
		mov		qword [rbp-64], rdi
		mov		rbx, qword [rel _global_s]
		mov		rcx, qword [rbp-8]
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, r11
		mov		rcx, qword [rbp-64]
		mov		rdi, qword [rbx+rcx*8+8]
		call	square
		mov		qword [rbp-72], rax
		mov		rax, qword [rbp-72]
		cqo
		idiv		qword [rel _global_p]
		mov		r15, rdx
		mov		rbx, qword [rel _global_s]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-80], rsi
		mov		rbx, qword [rbp-80]
		mov		rcx, qword [rbp-32]
		mov		qword [rbx+rcx*8+8], r15
		inc		qword [rbp-32]
loop_cond_18:
		mov		rsi, qword [rel _global_L]
		cmp		qword [rbp-32], rsi
		jl		loop_body_18
		jge		loop_end_18
loop_end_18:
		jmp		if_end_7
if_false_7:
		nop
if_end_7:
		mov		rbx, qword [rel _global_now]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], 0
		jmp		if_end_6
if_false_6:
		mov		r13, qword [rbp-8]
		imul		r13, 2
		mov		qword [rbp-88], r13
		mov		r13, qword [rbp-8]
		imul		r13, 2
		add		r13, 1
		mov		r10, r13
		mov		r13, qword [rbp-16]
		mov		rsi, qword [rbp-24]
		add		r13, rsi
		mov		rax, r13
		mov		rsi, 2
		cqo
		idiv		rsi
		mov		r13, rax
		mov		rdi, qword [rbp-88]
		mov		rsi, qword [rbp-16]
		mov		rdx, r13
		call	build
		mov		r15, rax
		add		r13, 1
		mov		rdi, r10
		mov		rsi, r13
		mov		rdx, qword [rbp-24]
		call	build
		mov		r15, rax
		mov		rbx, qword [rel _global_sum]
		mov		rcx, qword [rbp-88]
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_sum]
		mov		rcx, r10
		mov		rsi, qword [rbx+rcx*8+8]
		add		r13, rsi
		mov		rbx, qword [rel _global_sum]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], r13
		mov		rbx, qword [rel _global_flag]
		mov		rcx, qword [rbp-88]
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_flag]
		mov		rcx, r10
		mov		rsi, qword [rbx+rcx*8+8]
		and		r13, rsi
		mov		rbx, qword [rel _global_flag]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], r13
		mov		rbx, qword [rel _global_flag]
		mov		rcx, qword [rbp-8]
		cmp		qword [rbx+rcx*8+8], 0
		jg		if_true_8
		jle		if_false_8
if_true_8:
		mov		qword [rbp-32], 0
		jmp		loop_cond_19
loop_body_19:
		mov		rbx, qword [rel _global_s]
		mov		rcx, qword [rbp-88]
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, qword [rbp-32]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-96], rsi
		mov		rbx, qword [rel _global_s]
		mov		rcx, r10
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		rcx, qword [rbp-32]
		mov		rdi, qword [rbp-96]
		mov		rsi, qword [rbx+rcx*8+8]
		add		rdi, rsi
		mov		qword [rbp-96], rdi
		mov		rbx, qword [rel _global_s]
		mov		rcx, qword [rbp-8]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r8
		mov		rcx, qword [rbp-32]
		mov		rsi, qword [rbp-96]
		mov		qword [rbx+rcx*8+8], rsi
		inc		qword [rbp-32]
loop_cond_19:
		mov		rsi, qword [rel _global_L]
		cmp		qword [rbp-32], rsi
		jl		loop_body_19
		jge		loop_end_19
loop_end_19:
		mov		rbx, qword [rel _global_now]
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], 0
		jmp		if_end_8
if_false_8:
		nop
if_end_8:
		nop
if_end_6:
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r8
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

pushdown:
pushdown_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 152
		push		r14
		push		r12
		push		r15
		push		r13
		push		r11
		mov		r13, rdi
		mov		rbx, qword [rel _global_t]
		mov		rcx, r13
		cmp		qword [rbx+rcx*8+8], 0
		jg		if_true_9
		jle		if_false_9
if_true_9:
		mov		r15, r13
		imul		r15, 2
		mov		r12, r15
		mov		r15, r13
		imul		r15, 2
		add		r15, 1
		mov		rbx, qword [rel _global_now]
		mov		rcx, r12
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_t]
		mov		rcx, r13
		mov		rsi, qword [rbx+rcx*8+8]
		add		r14, rsi
		mov		rax, r14
		cqo
		idiv		qword [rel _global_L]
		mov		r14, rdx
		mov		rbx, qword [rel _global_now]
		mov		rcx, r12
		mov		qword [rbx+rcx*8+8], r14
		mov		rbx, qword [rel _global_s]
		mov		rcx, r12
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_now]
		mov		rcx, r12
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r11
		mov		rcx, r14
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_sum]
		mov		rcx, r12
		mov		qword [rbx+rcx*8+8], r14
		mov		rbx, qword [rel _global_t]
		mov		rcx, r12
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_t]
		mov		rcx, r13
		mov		rsi, qword [rbx+rcx*8+8]
		add		r14, rsi
		mov		rax, r14
		cqo
		idiv		qword [rel _global_L]
		mov		r14, rdx
		mov		rbx, qword [rel _global_t]
		mov		rcx, r12
		mov		qword [rbx+rcx*8+8], r14
		mov		rbx, qword [rel _global_now]
		mov		rcx, r15
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_t]
		mov		rcx, r13
		mov		rsi, qword [rbx+rcx*8+8]
		add		r14, rsi
		mov		rax, r14
		cqo
		idiv		qword [rel _global_L]
		mov		r14, rdx
		mov		rbx, qword [rel _global_now]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r14
		mov		rbx, qword [rel _global_s]
		mov		rcx, r15
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_now]
		mov		rcx, r15
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, r12
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_sum]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r14
		mov		rbx, qword [rel _global_t]
		mov		rcx, r15
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_t]
		mov		rcx, r13
		mov		rsi, qword [rbx+rcx*8+8]
		add		r14, rsi
		mov		rax, r14
		cqo
		idiv		qword [rel _global_L]
		mov		r14, rdx
		mov		rbx, qword [rel _global_t]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r14
		mov		rbx, qword [rel _global_t]
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], 0
		jmp		if_end_9
if_false_9:
		nop
if_end_9:
		pop		r11
		pop		r13
		pop		r15
		pop		r12
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

update:
update_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 296
		push		r14
		push		r9
		push		r8
		push		r12
		push		r15
		push		r13
		push		r10
		push		r11
		mov		qword [rbp-8], rdi
		mov		qword [rbp-16], rsi
		mov		qword [rbp-24], rdx
		mov		rsi, qword [rbp-16]
		cmp		qword [rel _global_pl], rsi
		jle		short_mid_3
		jg		if_false_10
short_mid_3:
		mov		rsi, qword [rbp-24]
		cmp		qword [rel _global_pr], rsi
		jge		short_mid_2
		jl		if_false_10
short_mid_2:
		mov		rbx, qword [rel _global_flag]
		mov		rcx, qword [rbp-8]
		cmp		qword [rbx+rcx*8+8], 0
		jg		if_true_10
		jle		if_false_10
if_true_10:
		mov		rbx, qword [rel _global_now]
		mov		rcx, qword [rbp-8]
		mov		r11, qword [rbx+rcx*8+8]
		add		r11, 1
		mov		rax, r11
		cqo
		idiv		qword [rel _global_L]
		mov		r11, rdx
		mov		rbx, qword [rel _global_now]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], r11
		mov		rbx, qword [rel _global_s]
		mov		rcx, qword [rbp-8]
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_now]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-32], rsi
		mov		rbx, r11
		mov		rcx, qword [rbp-32]
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_sum]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], r11
		mov		rbx, qword [rel _global_t]
		mov		rcx, qword [rbp-8]
		mov		r11, qword [rbx+rcx*8+8]
		add		r11, 1
		mov		rax, r11
		cqo
		idiv		qword [rel _global_L]
		mov		r11, rdx
		mov		rbx, qword [rel _global_t]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], r11
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r8
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_10
if_false_10:
		nop
if_end_10:
		mov		rsi, qword [rbp-24]
		cmp		qword [rbp-16], rsi
		je		if_true_11
		jne		if_false_11
if_true_11:
		mov		rbx, qword [rel _global_sum]
		mov		rcx, qword [rbp-8]
		mov		rdi, qword [rbx+rcx*8+8]
		call	square
		mov		r13, rax
		mov		rax, r13
		cqo
		idiv		qword [rel _global_p]
		mov		r13, rdx
		mov		rbx, qword [rel _global_sum]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], r13
		mov		rbx, qword [rel _global_sum]
		mov		rcx, qword [rbp-8]
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_b]
		mov		rcx, r13
		cmp		qword [rbx+rcx*8+8], 0
		jg		if_true_12
		jle		if_false_12
if_true_12:
		mov		rbx, qword [rel _global_flag]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], 1
		mov		rbx, qword [rel _global_sum]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-40], rsi
		mov		rbx, qword [rel _global_s]
		mov		rcx, qword [rbp-8]
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		rcx, 0
		mov		rsi, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], rsi
		mov		r13, 0
		mov		r13, 1
		jmp		loop_cond_20
loop_body_20:
		mov		qword [rbp-48], r13
		mov		rdi, qword [rbp-48]
		sub		rdi, 1
		mov		qword [rbp-48], rdi
		mov		rbx, qword [rel _global_s]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-56]
		mov		rcx, qword [rbp-48]
		mov		rdi, qword [rbx+rcx*8+8]
		call	square
		mov		qword [rbp-64], rax
		mov		rax, qword [rbp-64]
		cqo
		idiv		qword [rel _global_p]
		mov		qword [rbp-72], rdx
		mov		rbx, qword [rel _global_s]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-80], rsi
		mov		rbx, qword [rbp-80]
		mov		rcx, r13
		mov		rsi, qword [rbp-72]
		mov		qword [rbx+rcx*8+8], rsi
		inc		r13
loop_cond_20:
		mov		rsi, qword [rel _global_L]
		cmp		r13, rsi
		jl		loop_body_20
		jge		loop_end_20
loop_end_20:
		jmp		if_end_12
if_false_12:
		nop
if_end_12:
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r8
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_11
if_false_11:
		nop
if_end_11:
		mov		rbx, qword [rel _global_t]
		mov		rcx, qword [rbp-8]
		cmp		qword [rbx+rcx*8+8], 0
		jg		if_true_13
		jle		if_false_13
if_true_13:
		mov		rdi, qword [rbp-8]
		call	pushdown
		mov		r13, rax
		jmp		if_end_13
if_false_13:
		nop
if_end_13:
		mov		r14, qword [rbp-8]
		imul		r14, 2
		mov		r11, r14
		mov		r14, qword [rbp-8]
		imul		r14, 2
		add		r14, 1
		mov		r13, r14
		mov		r14, qword [rbp-16]
		mov		rsi, qword [rbp-24]
		add		r14, rsi
		mov		rax, r14
		mov		rsi, 2
		cqo
		idiv		rsi
		mov		r14, rax
		cmp		qword [rel _global_pl], r14
		jle		if_true_14
		jg		if_false_14
if_true_14:
		mov		rdi, r11
		mov		rsi, qword [rbp-16]
		mov		rdx, r14
		call	update
		mov		r12, rax
		jmp		if_end_14
if_false_14:
		nop
if_end_14:
		mov		qword [rbp-88], r14
		mov		rdi, qword [rbp-88]
		add		rdi, 1
		mov		qword [rbp-88], rdi
		mov		rsi, qword [rbp-88]
		cmp		qword [rel _global_pr], rsi
		jge		if_true_15
		jl		if_false_15
if_true_15:
		mov		qword [rbp-96], r14
		mov		rdi, qword [rbp-96]
		add		rdi, 1
		mov		qword [rbp-96], rdi
		mov		rdi, r13
		mov		rsi, qword [rbp-96]
		mov		rdx, qword [rbp-24]
		call	update
		mov		r14, rax
		jmp		if_end_15
if_false_15:
		nop
if_end_15:
		mov		rbx, qword [rel _global_sum]
		mov		rcx, r11
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-104], rsi
		mov		rbx, qword [rel _global_sum]
		mov		rcx, r13
		mov		rdi, qword [rbp-104]
		mov		rsi, qword [rbx+rcx*8+8]
		add		rdi, rsi
		mov		qword [rbp-104], rdi
		mov		rbx, qword [rel _global_sum]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbp-104]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rel _global_flag]
		mov		rcx, r11
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-112], rsi
		mov		rbx, qword [rel _global_flag]
		mov		rcx, r13
		mov		rdi, qword [rbp-112]
		mov		rsi, qword [rbx+rcx*8+8]
		and		rdi, rsi
		mov		qword [rbp-112], rdi
		mov		rbx, qword [rel _global_flag]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbp-112]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rel _global_flag]
		mov		rcx, qword [rbp-8]
		cmp		qword [rbx+rcx*8+8], 0
		jg		if_true_16
		jle		if_false_16
if_true_16:
		mov		r14, 0
		mov		r14, 0
		jmp		loop_cond_21
loop_body_21:
		mov		qword [rbp-120], r14
		mov		rbx, qword [rel _global_now]
		mov		rcx, r11
		mov		rdi, qword [rbp-120]
		mov		rsi, qword [rbx+rcx*8+8]
		add		rdi, rsi
		mov		qword [rbp-120], rdi
		mov		rax, qword [rbp-120]
		cqo
		idiv		qword [rel _global_L]
		mov		qword [rbp-128], rdx
		mov		qword [rbp-136], r14
		mov		rbx, qword [rel _global_now]
		mov		rcx, r13
		mov		rdi, qword [rbp-136]
		mov		rsi, qword [rbx+rcx*8+8]
		add		rdi, rsi
		mov		qword [rbp-136], rdi
		mov		rax, qword [rbp-136]
		cqo
		idiv		qword [rel _global_L]
		mov		r9, rdx
		mov		rbx, qword [rel _global_s]
		mov		rcx, r11
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, qword [rbp-128]
		mov		r10, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_s]
		mov		rcx, r13
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-144], rsi
		mov		rbx, qword [rbp-144]
		mov		rcx, r9
		mov		rsi, qword [rbx+rcx*8+8]
		add		r10, rsi
		mov		rbx, qword [rel _global_s]
		mov		rcx, qword [rbp-8]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r8
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r10
		inc		r14
loop_cond_21:
		mov		rsi, qword [rel _global_L]
		cmp		r14, rsi
		jl		loop_body_21
		jge		loop_end_21
loop_end_21:
		mov		rbx, qword [rel _global_now]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], 0
		jmp		if_end_16
if_false_16:
		nop
if_end_16:
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r8
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

query:
query_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 184
		push		r14
		push		r9
		push		r8
		push		r12
		push		r15
		push		r13
		push		r10
		push		r11
		mov		r15, rdi
		mov		r13, rsi
		mov		r11, rdx
		cmp		qword [rel _global_pl], r13
		jle		short_mid_4
		jg		if_false_17
short_mid_4:
		cmp		qword [rel _global_pr], r11
		jge		if_true_17
		jl		if_false_17
if_true_17:
		mov		rbx, qword [rel _global_sum]
		mov		rcx, r15
		mov		rax, qword [rbx+rcx*8+8]
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r8
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_17
if_false_17:
		nop
if_end_17:
		mov		r12, r15
		imul		r12, 2
		mov		qword [rbp-8], r12
		mov		r12, r15
		imul		r12, 2
		add		r12, 1
		mov		r8, r13
		add		r8, r11
		mov		rax, r8
		mov		rsi, 2
		cqo
		idiv		rsi
		mov		r8, rax
		mov		qword [rbp-16], r8
		mov		r8, 0
		mov		rbx, qword [rel _global_t]
		mov		rcx, r15
		cmp		qword [rbx+rcx*8+8], 0
		jg		if_true_18
		jle		if_false_18
if_true_18:
		mov		rdi, r15
		call	pushdown
		mov		r15, rax
		jmp		if_end_18
if_false_18:
		nop
if_end_18:
		mov		rsi, qword [rbp-16]
		cmp		qword [rel _global_pl], rsi
		jle		if_true_19
		jg		if_false_19
if_true_19:
		mov		rdi, qword [rbp-8]
		mov		rsi, r13
		mov		rdx, qword [rbp-16]
		call	query
		mov		qword [rbp-24], rax
		mov		r14, r8
		mov		rsi, qword [rbp-24]
		add		r14, rsi
		mov		rax, r14
		cqo
		idiv		qword [rel _global_MOD]
		mov		r14, rdx
		mov		r8, r14
		jmp		if_end_19
if_false_19:
		nop
if_end_19:
		mov		r10, qword [rbp-16]
		add		r10, 1
		cmp		qword [rel _global_pr], r10
		jge		if_true_20
		jl		if_false_20
if_true_20:
		mov		r9, qword [rbp-16]
		add		r9, 1
		mov		rdi, r12
		mov		rsi, r9
		mov		rdx, r11
		call	query
		mov		qword [rbp-32], rax
		mov		r9, r8
		mov		rsi, qword [rbp-32]
		add		r9, rsi
		mov		rax, r9
		cqo
		idiv		qword [rel _global_MOD]
		mov		r9, rdx
		mov		r8, r9
		jmp		if_end_20
if_false_20:
		nop
if_end_20:
		mov		rax, r8
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r8
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r11
		pop		r10
		pop		r13
		pop		r15
		pop		r12
		pop		r8
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

_global_b:
		dq 0
_global_now:
		dq 0
_global_t:
		dq 0
_global_a:
		dq 0
_global_n:
		dq 0
_global_m:
		dq 0
_global_p:
		dq 0
_global_op:
		dq 0
_global_L:
		dq 0
_global_flag:
		dq 0
_global_s:
		dq 0
_global_sum:
		dq 0
_global_ans:
		dq 0
_global_aa:
		dq 0
_global_bb:
		dq 0
_global_MOD:
		dq 0
_global_no:
		dq 0
_global_pl:
		dq 0
_global_pr:
		dq 0
intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
