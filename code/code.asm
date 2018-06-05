default rel

global string_length
global string_ord
global string_substring
global string_parseInt
global main
global random
global initialize
global swap
global pd
global show
global win
global merge
global move
global print
global toString
global addString__
global println
global getInt
global getString

global _global_n
global _global_h
global _global_now
global _global_a
global _global_A
global _global_M
global _global_Q
global _global_R
global _global_seed

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
		sub		rsp, 224
		push		r9
		push		r8
		push		r11
		push		r10
		push		r15
		push		r13
		push		r12
		push		r14
		mov		qword [rel _global_A], 48271
		mov		qword [rel _global_M], 2147483647
		mov		qword [rel _global_seed], 1
		mov		qword [rbp-8], 0
		mov		qword [rbp-16], 0
		mov		qword [rbp-24], 0
		mov		r8, 3
		mov		r8, 21
		mov		r8, 21
		mov		r8, 210
		mov		qword [rel _global_n], 210
		mov		qword [rel _global_h], 0
		mov		rdi, 100
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
		mov		rdi, 100
		mov		qword [rax+0], rdi
		mov		qword [rbp-32], 0
		jmp		loop_cond_0
loop_body_0:
		inc		qword [rbp-32]
loop_cond_0:
		cmp		qword [rbp-32], 100
		jl		loop_body_0
loop_end_0:
		mov		qword [rel _global_a], r8
		mov		rax, qword [rel _global_M]
		cqo
		idiv		qword [rel _global_A]
		mov		qword [rbp-40], rax
		mov		rsi, qword [rbp-40]
		mov		qword [rel _global_Q], rsi
		mov		rax, qword [rel _global_M]
		cqo
		idiv		qword [rel _global_A]
		mov		qword [rbp-48], rdx
		mov		rsi, qword [rbp-48]
		mov		qword [rel _global_R], rsi
		mov		rdi, qword [rel _global_n]
		call	pd
		mov		qword [rbp-56], rax
		cmp		qword [rbp-56], 0
		jnz		if_false_0
		jz		if_true_0
if_true_0:
		mov		rdi, str_const_0
		call	println
		mov		r8, rax
		mov		rax, 1
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		pop		r10
		pop		r11
		pop		r8
		pop		r9
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_0
if_false_0:
		nop
if_end_0:
		mov		rdi, str_const_1
		call	println
		mov		r9, rax
		mov		rdi, 3654898
		call	initialize
		mov		r9, rax
		call	random
		mov		r9, rax
		mov		rax, r9
		mov		rsi, 10
		cqo
		idiv		rsi
		mov		r9, rdx
		add		r9, 1
		mov		qword [rel _global_now], r9
		mov		rdi, qword [rel _global_now]
		call	toString
		mov		r9, rax
		mov		rdi, r9
		call	println
		mov		r9, rax
		jmp		loop_cond_1
loop_body_1:
		call	random
		mov		r15, rax
		mov		rax, r15
		mov		rsi, 10
		cqo
		idiv		rsi
		mov		qword [rbp-64], rdx
		mov		r10, qword [rbp-64]
		add		r10, 1
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], r10
		jmp		loop_cond_2
loop_body_2:
		call	random
		mov		qword [rbp-72], rax
		mov		rax, qword [rbp-72]
		mov		rsi, 10
		cqo
		idiv		rsi
		mov		qword [rbp-80], rdx
		mov		rsi, qword [rbp-80]
		mov		qword [rbp-88], rsi
		mov		rdi, qword [rbp-88]
		add		rdi, 1
		mov		qword [rbp-88], rdi
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbp-88]
		mov		qword [rbx+rcx*8+8], rsi
loop_cond_2:
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-96], rsi
		mov		rdi, qword [rbp-96]
		mov		rsi, qword [rbp-16]
		add		rdi, rsi
		mov		qword [rbp-96], rdi
		mov		rsi, qword [rel _global_n]
		cmp		qword [rbp-96], rsi
		jg		loop_body_2
		jle		loop_end_2
loop_end_2:
		mov		rsi, qword [rbp-16]
		mov		qword [rbp-104], rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-8]
		mov		rdi, qword [rbp-104]
		mov		rsi, qword [rbx+rcx*8+8]
		add		rdi, rsi
		mov		qword [rbp-104], rdi
		mov		rsi, qword [rbp-104]
		mov		qword [rbp-16], rsi
		inc		qword [rbp-8]
loop_cond_1:
		mov		rsi, qword [rel _global_now]
		mov		qword [rbp-112], rsi
		mov		rdi, qword [rbp-112]
		sub		rdi, 1
		mov		qword [rbp-112], rdi
		mov		rsi, qword [rbp-112]
		cmp		qword [rbp-8], rsi
		jl		loop_body_1
		jge		loop_end_1
loop_end_1:
		mov		r13, qword [rel _global_now]
		sub		r13, 1
		mov		r14, qword [rel _global_n]
		mov		rsi, qword [rbp-16]
		sub		r14, rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r14
		call	show
		mov		r15, rax
		call	merge
		mov		r15, rax
		jmp		loop_cond_3
loop_body_3:
		inc		qword [rbp-24]
		mov		rdi, qword [rbp-24]
		call	toString
		mov		r12, rax
		mov		rdi, str_const_2
		mov		rsi, r12
		call	addString__
		mov		qword [rbp-120], rax
		mov		rdi, qword [rbp-120]
		mov		rsi, str_const_3
		call	addString__
		mov		r11, rax
		mov		rdi, r11
		call	println
		mov		r15, rax
		call	move
		mov		r15, rax
		call	merge
		mov		r15, rax
		call	show
		mov		r15, rax
loop_cond_3:
		call	win
		mov		qword [rbp-128], rax
		cmp		qword [rbp-128], 0
		jnz		loop_end_3
		jz		loop_body_3
loop_end_3:
		mov		rdi, qword [rbp-24]
		call	toString
		mov		qword [rbp-136], rax
		mov		rdi, str_const_4
		mov		rsi, qword [rbp-136]
		call	addString__
		mov		qword [rbp-144], rax
		mov		rdi, qword [rbp-144]
		mov		rsi, str_const_5
		call	addString__
		mov		qword [rbp-152], rax
		mov		rdi, qword [rbp-152]
		call	println
		mov		r15, rax
		mov		rax, 0
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		pop		r10
		pop		r11
		pop		r8
		pop		r9
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		pop		r10
		pop		r11
		pop		r8
		pop		r9
		mov		rsp, rbp
		pop		rbp
		ret

random:
random_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 72
		push		r15
		push		r13
		push		r12
		push		r14
		mov		rax, qword [rel _global_seed]
		cqo
		idiv		qword [rel _global_Q]
		mov		r14, rdx
		mov		r15, qword [rel _global_A]
		imul		r15, r14
		mov		rax, qword [rel _global_seed]
		cqo
		idiv		qword [rel _global_Q]
		mov		r14, rax
		mov		r12, qword [rel _global_R]
		imul		r12, r14
		sub		r15, r12
		cmp		r15, 0
		jge		if_true_1
		jl		if_false_1
if_true_1:
		mov		qword [rel _global_seed], r15
		jmp		if_end_1
if_false_1:
		mov		r13, r15
		mov		rsi, qword [rel _global_M]
		add		r13, rsi
		mov		qword [rel _global_seed], r13
if_end_1:
		mov		rax, qword [rel _global_seed]
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

initialize:
initialize_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 72
		push		r15
		mov		r15, rdi
		mov		qword [rel _global_seed], r15
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

swap:
swap_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 72
		push		r15
		push		r13
		push		r12
		push		r14
		mov		r13, rdi
		mov		r15, rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, r15
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r14
		mov		rbx, qword [rel _global_a]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r12
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

pd:
pd_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 72
		push		r15
		push		r13
		push		r12
		push		r14
		mov		r13, rdi
		jmp		loop_cond_4
loop_body_4:
		mov		r14, qword [rel _global_h]
		add		r14, 1
		mov		r15, qword [rel _global_h]
		imul		r15, r14
		mov		rax, r15
		mov		rsi, 2
		cqo
		idiv		rsi
		mov		r12, rax
		cmp		r13, r12
		je		if_true_2
		jne		if_false_2
if_true_2:
		mov		rax, 1
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_2
if_false_2:
		nop
if_end_2:
		inc		qword [rel _global_h]
loop_cond_4:
		cmp		qword [rel _global_h], r13
		jle		loop_body_4
		jg		loop_end_4
loop_end_4:
		mov		rax, 0
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

show:
show_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 72
		push		r15
		push		r13
		push		r12
		push		r14
		mov		r12, 0
		jmp		loop_cond_5
loop_body_5:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r12
		mov		rdi, qword [rbx+rcx*8+8]
		call	toString
		mov		r13, rax
		mov		rdi, r13
		mov		rsi, str_const_6
		call	addString__
		mov		r15, rax
		mov		rdi, r15
		call	print
		mov		r14, rax
		inc		r12
loop_cond_5:
		mov		rsi, qword [rel _global_now]
		cmp		r12, rsi
		jl		loop_body_5
		jge		loop_end_5
loop_end_5:
		mov		rdi, str_const_7
		call	println
		mov		r15, rax
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

win:
win_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 80
		push		r9
		push		r8
		push		r11
		push		r10
		push		r15
		push		r13
		push		r12
		push		r14
		mov		rdi, 100
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
		mov		rdi, 100
		mov		qword [rax+0], rdi
		mov		r9, 0
		jmp		loop_cond_6
loop_body_6:
		inc		r9
loop_cond_6:
		cmp		r9, 100
		jl		loop_body_6
loop_end_6:
		mov		r9, r13
		mov		rsi, qword [rel _global_h]
		cmp		qword [rel _global_now], rsi
		jne		if_true_3
		je		if_false_3
if_true_3:
		mov		rax, 0
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		pop		r10
		pop		r11
		pop		r8
		pop		r9
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_3
if_false_3:
		nop
if_end_3:
		mov		r13, 0
		jmp		loop_cond_7
loop_body_7:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r9
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r14
		inc		r13
loop_cond_7:
		mov		rsi, qword [rel _global_now]
		cmp		r13, rsi
		jl		loop_body_7
		jge		loop_end_7
loop_end_7:
		mov		r14, 0
		jmp		loop_cond_8
loop_body_8:
		mov		qword [rbp-8], r14
		mov		rdi, qword [rbp-8]
		add		rdi, 1
		mov		qword [rbp-8], rdi
		mov		r13, qword [rbp-8]
		jmp		loop_cond_9
loop_body_9:
		mov		rbx, r9
		mov		rcx, r13
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r9
		mov		rcx, r14
		cmp		qword [rbx+rcx*8+8], r8
		jg		if_true_4
		jle		if_false_4
if_true_4:
		mov		rbx, r9
		mov		rcx, r14
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r9
		mov		rcx, r13
		mov		r10, qword [rbx+rcx*8+8]
		mov		rbx, r9
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r10
		mov		rbx, r9
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r15
		jmp		if_end_4
if_false_4:
		nop
if_end_4:
		inc		r13
loop_cond_9:
		mov		rsi, qword [rel _global_now]
		cmp		r13, rsi
		jl		loop_body_9
		jge		loop_end_9
loop_end_9:
		inc		r14
loop_cond_8:
		mov		r11, qword [rel _global_now]
		sub		r11, 1
		cmp		r14, r11
		jl		loop_body_8
		jge		loop_end_8
loop_end_8:
		mov		r14, 0
		jmp		loop_cond_10
loop_body_10:
		mov		r12, r14
		add		r12, 1
		mov		rbx, r9
		mov		rcx, r14
		cmp		qword [rbx+rcx*8+8], r12
		jne		if_true_5
		je		if_false_5
if_true_5:
		mov		rax, 0
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		pop		r10
		pop		r11
		pop		r8
		pop		r9
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_5
if_false_5:
		nop
if_end_5:
		inc		r14
loop_cond_10:
		mov		rsi, qword [rel _global_now]
		cmp		r14, rsi
		jl		loop_body_10
		jge		loop_end_10
loop_end_10:
		mov		rax, 1
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		pop		r10
		pop		r11
		pop		r8
		pop		r9
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		pop		r10
		pop		r11
		pop		r8
		pop		r9
		mov		rsp, rbp
		pop		rbp
		ret

merge:
merge_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 72
		push		r15
		push		r13
		push		r12
		push		r14
		mov		r13, 0
		jmp		loop_cond_11
loop_body_11:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		cmp		qword [rbx+rcx*8+8], 0
		je		if_true_6
		jne		if_false_6
if_true_6:
		mov		r15, r13
		add		r15, 1
		mov		r12, r15
		jmp		loop_cond_12
loop_body_12:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r12
		cmp		qword [rbx+rcx*8+8], 0
		jne		if_true_7
		je		if_false_7
if_true_7:
		mov		rdi, r13
		mov		rsi, r12
		call	swap
		mov		r14, rax
		jmp		loop_end_12
		jmp		if_end_7
if_false_7:
		nop
if_end_7:
		inc		r12
loop_cond_12:
		mov		rsi, qword [rel _global_now]
		cmp		r12, rsi
		jl		loop_body_12
		jge		loop_end_12
loop_end_12:
		jmp		if_end_6
if_false_6:
		nop
if_end_6:
		inc		r13
loop_cond_11:
		mov		rsi, qword [rel _global_now]
		cmp		r13, rsi
		jl		loop_body_11
		jge		loop_end_11
loop_end_11:
		mov		r13, 0
		jmp		loop_cond_13
loop_body_13:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		cmp		qword [rbx+rcx*8+8], 0
		je		if_true_8
		jne		if_false_8
if_true_8:
		mov		qword [rel _global_now], r13
		jmp		loop_end_13
		jmp		if_end_8
if_false_8:
		nop
if_end_8:
		inc		r13
loop_cond_13:
		mov		rsi, qword [rel _global_now]
		cmp		r13, rsi
		jl		loop_body_13
		jge		loop_end_13
loop_end_13:
		pop		r14
		pop		r12
		pop		r13
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

move:
move_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 72
		push		r15
		push		r14
		mov		r14, 0
		jmp		loop_cond_14
loop_body_14:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r14
		dec		qword [rbx+rcx*8+8]
		mov		r15, r14
		add		r15, 1
		mov		r14, r15
loop_cond_14:
		mov		rsi, qword [rel _global_now]
		cmp		r14, rsi
		jl		loop_body_14
		jge		loop_end_14
loop_end_14:
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rel _global_now]
		mov		rsi, qword [rel _global_now]
		mov		qword [rbx+rcx*8+8], rsi
		mov		r15, qword [rel _global_now]
		inc		qword [rel _global_now]
		pop		r14
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

_global_n:
		dq 0
_global_h:
		dq 0
_global_now:
		dq 0
_global_a:
		dq 0
_global_A:
		dq 0
_global_M:
		dq 0
_global_Q:
		dq 0
_global_R:
		dq 0
_global_seed:
		dq 0
	dq	79
str_const_0:
	db	83, 111, 114, 114, 121, 44, 32, 116, 104, 101, 32, 110, 117, 109, 98, 101, 114, 32, 110, 32, 109, 117, 115, 116, 32, 98, 101, 32, 97, 32, 110, 117, 109, 98, 101, 114, 32, 115, 46, 116, 46, 32, 116, 104, 101, 114, 101, 32, 101, 120, 105, 115, 116, 115, 32, 105, 32, 115, 97, 116, 105, 115, 102, 121, 105, 110, 103, 32, 110, 61, 49, 43, 50, 43, 46, 46, 46, 43, 105, 0

	dq	12
str_const_1:
	db	76, 101, 116, 39, 115, 32, 115, 116, 97, 114, 116, 33, 0

	dq	5
str_const_2:
	db	115, 116, 101, 112, 32, 0

	dq	1
str_const_3:
	db	58, 0

	dq	7
str_const_4:
	db	84, 111, 116, 97, 108, 58, 32, 0

	dq	8
str_const_5:
	db	32, 115, 116, 101, 112, 40, 115, 41, 0

	dq	1
str_const_6:
	db	32, 0

	dq	0
str_const_7:
	db	0

intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
