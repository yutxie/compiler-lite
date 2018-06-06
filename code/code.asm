default rel

global A_A
global A_Optimizer
global string_length
global string_ord
global string_substring
global string_parseInt
global main
global restore
global quicksort
global calc
global mergesort
global heapsort
global print
global toString
global addString__
global println
global getInt
global getString

global _global_N
global _global_n
global _global_a
global _global_bak
global _global_a_left
global _global_a_right
global _global_heap
global _global_i1
global _global_i2
global _global_i3
global _global_i4
global _global_i5
global _global_i6
global _global_i7
global _global_i8
global _global_i9
global _global_i10
global _global_i11
global _global_i12
global _global_i13
global _global_i14

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

A_A:
A_A_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 488
		push		r12
		push		r15
		push		r9
		push		r13
		push		r10
		push		r8
		push		r14
		push		r11
		mov		qword [rbp-8], rdi
		mov		rdi, 2
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
		mov		qword [rbp-16], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		r10, 0
		jmp		loop_cond_0
loop_body_0:
		mov		rbx, qword [rbp-16]
		mov		rcx, r10
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-24], 0
		jmp		loop_cond_1
loop_body_1:
		mov		rbx, qword [rbp-16]
		mov		rcx, r10
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-32], rsi
		mov		rbx, qword [rbp-32]
		mov		rcx, qword [rbp-24]
		mov		rdi, 3
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 3
		mov		qword [rax+0], rdi
		mov		qword [rbp-40], 0
		jmp		loop_cond_2
loop_body_2:
		mov		rbx, qword [rbp-16]
		mov		rcx, r10
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-48], rsi
		mov		rbx, qword [rbp-48]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-56]
		mov		rcx, qword [rbp-40]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		r9, 0
		jmp		loop_cond_3
loop_body_3:
		mov		rbx, qword [rbp-16]
		mov		rcx, r10
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-64], rsi
		mov		rbx, qword [rbp-64]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-72], rsi
		mov		rbx, qword [rbp-72]
		mov		rcx, r9
		mov		rdi, 3
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 3
		mov		qword [rax+0], rdi
		mov		qword [rbp-80], 0
		jmp		loop_cond_4
loop_body_4:
		mov		rbx, qword [rbp-16]
		mov		rcx, r10
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-88], rsi
		mov		rbx, qword [rbp-88]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-96], rsi
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-104], rsi
		mov		rbx, qword [rbp-104]
		mov		rcx, r9
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-112], rsi
		mov		rbx, qword [rbp-112]
		mov		rcx, qword [rbp-80]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-120], 0
		jmp		loop_cond_5
loop_body_5:
		mov		rbx, qword [rbp-16]
		mov		rcx, r10
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-128], rsi
		mov		rbx, qword [rbp-128]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-136], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-144], rsi
		mov		rbx, qword [rbp-144]
		mov		rcx, r9
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-152], rsi
		mov		rbx, qword [rbp-152]
		mov		rcx, qword [rbp-80]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-160], rsi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-120]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-168], 0
		jmp		loop_cond_6
loop_body_6:
		mov		rbx, qword [rbp-16]
		mov		rcx, r10
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-176], rsi
		mov		rbx, qword [rbp-176]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-184], rsi
		mov		rbx, qword [rbp-184]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-192], rsi
		mov		rbx, qword [rbp-192]
		mov		rcx, r9
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, r11
		mov		rcx, qword [rbp-80]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-200], rsi
		mov		rbx, qword [rbp-200]
		mov		rcx, qword [rbp-120]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r8
		mov		rcx, qword [rbp-168]
		mov		rdi, 3
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 3
		mov		qword [rax+0], rdi
		mov		qword [rbp-208], 0
		jmp		loop_cond_7
loop_body_7:
		mov		rbx, qword [rbp-16]
		mov		rcx, r10
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-216], rsi
		mov		rbx, qword [rbp-216]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-224], rsi
		mov		rbx, qword [rbp-224]
		mov		rcx, r9
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, qword [rbp-80]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-232], rsi
		mov		rbx, qword [rbp-232]
		mov		rcx, qword [rbp-120]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-240], rsi
		mov		rbx, qword [rbp-240]
		mov		rcx, qword [rbp-168]
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, qword [rbp-208]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-248], 0
		jmp		loop_cond_8
loop_body_8:
		mov		rbx, qword [rbp-16]
		mov		rcx, r10
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-256], rsi
		mov		rbx, qword [rbp-256]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-264], rsi
		mov		rbx, qword [rbp-264]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-272], rsi
		mov		rbx, qword [rbp-272]
		mov		rcx, r9
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-280], rsi
		mov		rbx, qword [rbp-280]
		mov		rcx, qword [rbp-80]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-288], rsi
		mov		rbx, qword [rbp-288]
		mov		rcx, qword [rbp-120]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-296], rsi
		mov		rbx, qword [rbp-296]
		mov		rcx, qword [rbp-168]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-304], rsi
		mov		rbx, qword [rbp-304]
		mov		rcx, qword [rbp-208]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-312], rsi
		mov		rbx, qword [rbp-312]
		mov		rcx, qword [rbp-248]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-320], 0
		jmp		loop_cond_9
loop_body_9:
		inc		qword [rbp-320]
loop_cond_9:
		cmp		qword [rbp-320], 2
		jl		loop_body_9
loop_end_9:
		inc		qword [rbp-248]
loop_cond_8:
		cmp		qword [rbp-248], 2
		jl		loop_body_8
loop_end_8:
		inc		qword [rbp-208]
loop_cond_7:
		cmp		qword [rbp-208], 3
		jl		loop_body_7
loop_end_7:
		inc		qword [rbp-168]
loop_cond_6:
		cmp		qword [rbp-168], 2
		jl		loop_body_6
loop_end_6:
		inc		qword [rbp-120]
loop_cond_5:
		cmp		qword [rbp-120], 2
		jl		loop_body_5
loop_end_5:
		inc		qword [rbp-80]
loop_cond_4:
		cmp		qword [rbp-80], 3
		jl		loop_body_4
loop_end_4:
		inc		r9
loop_cond_3:
		cmp		r9, 2
		jl		loop_body_3
loop_end_3:
		inc		qword [rbp-40]
loop_cond_2:
		cmp		qword [rbp-40], 3
		jl		loop_body_2
loop_end_2:
		inc		qword [rbp-24]
loop_cond_1:
		cmp		qword [rbp-24], 2
		jl		loop_body_1
loop_end_1:
		inc		r10
loop_cond_0:
		cmp		r10, 2
		jl		loop_body_0
loop_end_0:
		mov		rbx, qword [rbp-8]
		mov		rsi, qword [rbp-16]
		mov		qword [rbx+8], rsi
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret

A_Optimizer:
A_Optimizer_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 2128
		push		r12
		push		r15
		push		r9
		push		r13
		push		r10
		push		r8
		push		r14
		push		r11
		mov		r15, rdi
		mov		rdi, 2
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
		mov		qword [rbp-8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-16], 0
		jmp		loop_cond_10
loop_body_10:
		mov		rbx, qword [rbp-8]
		mov		rcx, qword [rbp-16]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-24], 0
		jmp		loop_cond_11
loop_body_11:
		mov		rbx, qword [rbp-8]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-32], rsi
		mov		rbx, qword [rbp-32]
		mov		rcx, qword [rbp-24]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-40], 0
		jmp		loop_cond_12
loop_body_12:
		mov		rbx, qword [rbp-8]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-48], rsi
		mov		rbx, qword [rbp-48]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-56]
		mov		rcx, qword [rbp-40]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		r8, 0
		jmp		loop_cond_13
loop_body_13:
		mov		rbx, qword [rbp-8]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-64], rsi
		mov		rbx, qword [rbp-64]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-72], rsi
		mov		rbx, qword [rbp-72]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-80], rsi
		mov		rbx, qword [rbp-80]
		mov		rcx, r8
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-88], 0
		jmp		loop_cond_14
loop_body_14:
		mov		rbx, qword [rbp-8]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-96], rsi
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-104], rsi
		mov		rbx, qword [rbp-104]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-112], rsi
		mov		rbx, qword [rbp-112]
		mov		rcx, r8
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-120], rsi
		mov		rbx, qword [rbp-120]
		mov		rcx, qword [rbp-88]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-128], 0
		jmp		loop_cond_15
loop_body_15:
		mov		rbx, qword [rbp-8]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-136], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-24]
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, r11
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-144], rsi
		mov		rbx, qword [rbp-144]
		mov		rcx, r8
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-152], rsi
		mov		rbx, qword [rbp-152]
		mov		rcx, qword [rbp-88]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-160], rsi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-128]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-168], 0
		jmp		loop_cond_16
loop_body_16:
		mov		rbx, qword [rbp-8]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-176], rsi
		mov		rbx, qword [rbp-176]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-184], rsi
		mov		rbx, qword [rbp-184]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-192], rsi
		mov		rbx, qword [rbp-192]
		mov		rcx, r8
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-200], rsi
		mov		rbx, qword [rbp-200]
		mov		rcx, qword [rbp-88]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-208], rsi
		mov		rbx, qword [rbp-208]
		mov		rcx, qword [rbp-128]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-216], rsi
		mov		rbx, qword [rbp-216]
		mov		rcx, qword [rbp-168]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-224], 0
		jmp		loop_cond_17
loop_body_17:
		mov		rbx, qword [rbp-8]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-232], rsi
		mov		rbx, qword [rbp-232]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-240], rsi
		mov		rbx, qword [rbp-240]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-248], rsi
		mov		rbx, qword [rbp-248]
		mov		rcx, r8
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-256], rsi
		mov		rbx, qword [rbp-256]
		mov		rcx, qword [rbp-88]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-264], rsi
		mov		rbx, qword [rbp-264]
		mov		rcx, qword [rbp-128]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-272], rsi
		mov		rbx, qword [rbp-272]
		mov		rcx, qword [rbp-168]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-280], rsi
		mov		rbx, qword [rbp-280]
		mov		rcx, qword [rbp-224]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-288], 0
		jmp		loop_cond_18
loop_body_18:
		mov		rbx, qword [rbp-8]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-296], rsi
		mov		rbx, qword [rbp-296]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-304], rsi
		mov		rbx, qword [rbp-304]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-312], rsi
		mov		rbx, qword [rbp-312]
		mov		rcx, r8
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-320], rsi
		mov		rbx, qword [rbp-320]
		mov		rcx, qword [rbp-88]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-328], rsi
		mov		rbx, qword [rbp-328]
		mov		rcx, qword [rbp-128]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-336], rsi
		mov		rbx, qword [rbp-336]
		mov		rcx, qword [rbp-168]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-344], rsi
		mov		rbx, qword [rbp-344]
		mov		rcx, qword [rbp-224]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-352], rsi
		mov		rbx, qword [rbp-352]
		mov		rcx, qword [rbp-288]
		mov		rdi, 2
		inc		rdi
		imul		rdi, 8
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 2
		mov		qword [rax+0], rdi
		mov		qword [rbp-360], 0
		jmp		loop_cond_19
loop_body_19:
		inc		qword [rbp-360]
loop_cond_19:
		cmp		qword [rbp-360], 2
		jl		loop_body_19
loop_end_19:
		inc		qword [rbp-288]
loop_cond_18:
		cmp		qword [rbp-288], 2
		jl		loop_body_18
loop_end_18:
		inc		qword [rbp-224]
loop_cond_17:
		cmp		qword [rbp-224], 2
		jl		loop_body_17
loop_end_17:
		inc		qword [rbp-168]
loop_cond_16:
		cmp		qword [rbp-168], 2
		jl		loop_body_16
loop_end_16:
		inc		qword [rbp-128]
loop_cond_15:
		cmp		qword [rbp-128], 2
		jl		loop_body_15
loop_end_15:
		inc		qword [rbp-88]
loop_cond_14:
		cmp		qword [rbp-88], 2
		jl		loop_body_14
loop_end_14:
		inc		r8
loop_cond_13:
		cmp		r8, 2
		jl		loop_body_13
loop_end_13:
		inc		qword [rbp-40]
loop_cond_12:
		cmp		qword [rbp-40], 2
		jl		loop_body_12
loop_end_12:
		inc		qword [rbp-24]
loop_cond_11:
		cmp		qword [rbp-24], 2
		jl		loop_body_11
loop_end_11:
		inc		qword [rbp-16]
loop_cond_10:
		cmp		qword [rbp-16], 2
		jl		loop_body_10
loop_end_10:
		mov		r8, qword [rbp-8]
		mov		qword [rbp-368], 0
		mov		r11, 1
		jmp		loop_cond_20
loop_body_20:
		mov		qword [rbp-376], 123
		mov		rdi, qword [rbp-376]
		add		rdi, r11
		mov		qword [rbp-376], rdi
		mov		rbx, r8
		mov		rcx, 0
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-384], rsi
		mov		rbx, qword [rbp-384]
		mov		rcx, 1
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-392], rsi
		mov		rbx, qword [rbp-392]
		mov		rcx, 0
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-400], rsi
		mov		rbx, qword [rbp-400]
		mov		rcx, 1
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-408], rsi
		mov		rbx, qword [rbp-408]
		mov		rcx, 0
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-416], rsi
		mov		rbx, qword [rbp-416]
		mov		rcx, 1
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-424], rsi
		mov		rbx, qword [rbp-424]
		mov		rcx, 0
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-432], rsi
		mov		rbx, qword [rbp-432]
		mov		rcx, 1
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-440], rsi
		mov		rbx, qword [rbp-440]
		mov		rcx, 0
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-448], rsi
		mov		rbx, qword [rbp-448]
		mov		rcx, 1
		mov		rsi, qword [rbp-376]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-368]
		mov		qword [rbp-456], rsi
		mov		rbx, r8
		mov		rcx, 0
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, 1
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-464], rsi
		mov		rbx, qword [rbp-464]
		mov		rcx, 0
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-472], rsi
		mov		rbx, qword [rbp-472]
		mov		rcx, 1
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-480], rsi
		mov		rbx, qword [rbp-480]
		mov		rcx, 0
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-488], rsi
		mov		rbx, qword [rbp-488]
		mov		rcx, 1
		mov		r9, qword [rbx+rcx*8+8]
		mov		rbx, r9
		mov		rcx, 0
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-496], rsi
		mov		rbx, qword [rbp-496]
		mov		rcx, 1
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-504], rsi
		mov		rbx, qword [rbp-504]
		mov		rcx, 0
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-512], rsi
		mov		rbx, qword [rbp-512]
		mov		rcx, 1
		mov		rdi, qword [rbp-456]
		mov		rsi, qword [rbx+rcx*8+8]
		add		rdi, rsi
		mov		qword [rbp-456], rdi
		mov		rsi, qword [rbp-456]
		mov		qword [rbp-368], rsi
		inc		r11
loop_cond_20:
		cmp		r11, 1000
		jle		loop_body_20
		jg		loop_end_20
loop_end_20:
		mov		rdi, qword [rbp-368]
		call	toString
		mov		qword [rbp-520], rax
		mov		rdi, qword [rbp-520]
		call	println
		mov		r14, rax
		mov		r11, 1
		jmp		loop_cond_21
loop_body_21:
		mov		rax, 9876
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-528], rdx
		mov		rsi, qword [rbp-528]
		mov		qword [rbp-536], rsi
		mov		rdi, qword [rbp-536]
		imul		rdi, 2345
		mov		qword [rbp-536], rdi
		mov		rax, qword [rbp-536]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-544], rdx
		mov		rsi, qword [rbp-544]
		mov		qword [rbp-552], rsi
		mov		rdi, qword [rbp-552]
		imul		rdi, 2345
		mov		qword [rbp-552], rdi
		mov		rax, qword [rbp-552]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-560], rdx
		mov		rsi, qword [rbp-560]
		mov		qword [rbp-568], rsi
		mov		rdi, qword [rbp-568]
		imul		rdi, 2345
		mov		qword [rbp-568], rdi
		mov		rax, qword [rbp-568]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-576], rdx
		mov		rsi, qword [rbp-576]
		mov		qword [rbp-584], rsi
		mov		rdi, qword [rbp-584]
		imul		rdi, 2345
		mov		qword [rbp-584], rdi
		mov		rax, qword [rbp-584]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-592], rdx
		mov		rsi, qword [rbp-592]
		mov		qword [rbp-600], rsi
		mov		rdi, qword [rbp-600]
		imul		rdi, 2345
		mov		qword [rbp-600], rdi
		mov		rax, qword [rbp-600]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-608], rdx
		mov		rsi, qword [rbp-608]
		mov		qword [rbp-616], rsi
		mov		rdi, qword [rbp-616]
		imul		rdi, 2345
		mov		qword [rbp-616], rdi
		mov		rax, qword [rbp-616]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-624], rdx
		mov		rsi, qword [rbp-624]
		mov		qword [rbp-632], rsi
		mov		rdi, qword [rbp-632]
		imul		rdi, 2345
		mov		qword [rbp-632], rdi
		mov		rax, qword [rbp-632]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-640], rdx
		mov		rsi, qword [rbp-640]
		mov		qword [rbp-648], rsi
		mov		rdi, qword [rbp-648]
		imul		rdi, 2345
		mov		qword [rbp-648], rdi
		mov		rax, qword [rbp-648]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-656], rdx
		mov		rsi, qword [rbp-656]
		mov		qword [rbp-664], rsi
		mov		rdi, qword [rbp-664]
		imul		rdi, 2345
		mov		qword [rbp-664], rdi
		mov		rax, qword [rbp-664]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-672], rdx
		mov		rsi, qword [rbp-672]
		mov		qword [rbp-680], rsi
		mov		rdi, qword [rbp-680]
		imul		rdi, 2345
		mov		qword [rbp-680], rdi
		mov		rax, qword [rbp-680]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-688], rdx
		mov		rsi, qword [rbp-688]
		mov		qword [rbp-696], rsi
		mov		rdi, qword [rbp-696]
		imul		rdi, 2345
		mov		qword [rbp-696], rdi
		mov		rax, qword [rbp-696]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-704], rdx
		mov		rsi, qword [rbp-704]
		mov		qword [rbp-712], rsi
		mov		rdi, qword [rbp-712]
		imul		rdi, 2345
		mov		qword [rbp-712], rdi
		mov		rax, qword [rbp-712]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-720], rdx
		mov		rsi, qword [rbp-720]
		mov		qword [rbp-728], rsi
		mov		rdi, qword [rbp-728]
		imul		rdi, 2345
		mov		qword [rbp-728], rdi
		mov		rax, qword [rbp-728]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-736], rdx
		mov		rsi, qword [rbp-736]
		mov		qword [rbp-744], rsi
		mov		rdi, qword [rbp-744]
		imul		rdi, 2345
		mov		qword [rbp-744], rdi
		mov		rax, qword [rbp-744]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-752], rdx
		mov		rsi, qword [rbp-752]
		mov		qword [rbp-760], rsi
		mov		rdi, qword [rbp-760]
		imul		rdi, 2345
		mov		qword [rbp-760], rdi
		mov		rax, qword [rbp-760]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-768], rdx
		mov		rsi, qword [rbp-768]
		mov		qword [rbp-776], rsi
		mov		rdi, qword [rbp-776]
		imul		rdi, 2345
		mov		qword [rbp-776], rdi
		mov		rax, qword [rbp-776]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-784], rdx
		mov		rsi, qword [rbp-784]
		mov		qword [rbp-792], rsi
		mov		rdi, qword [rbp-792]
		imul		rdi, 2345
		mov		qword [rbp-792], rdi
		mov		rax, qword [rbp-792]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-800], rdx
		mov		rsi, qword [rbp-800]
		mov		qword [rbp-808], rsi
		mov		rdi, qword [rbp-808]
		imul		rdi, 2345
		mov		qword [rbp-808], rdi
		mov		rax, qword [rbp-808]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-816], rdx
		mov		rsi, qword [rbp-816]
		mov		qword [rbp-824], rsi
		mov		rdi, qword [rbp-824]
		imul		rdi, 2345
		mov		qword [rbp-824], rdi
		mov		rax, qword [rbp-824]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-832], rdx
		mov		rsi, qword [rbp-832]
		mov		qword [rbp-840], rsi
		mov		rdi, qword [rbp-840]
		imul		rdi, 2345
		mov		qword [rbp-840], rdi
		mov		rax, qword [rbp-840]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-848], rdx
		mov		rsi, qword [rbp-848]
		mov		qword [rbp-856], rsi
		mov		rdi, qword [rbp-856]
		imul		rdi, 2345
		mov		qword [rbp-856], rdi
		mov		rax, qword [rbp-856]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-864], rdx
		mov		rsi, qword [rbp-864]
		mov		qword [rbp-872], rsi
		mov		rdi, qword [rbp-872]
		imul		rdi, 2345
		mov		qword [rbp-872], rdi
		mov		rax, qword [rbp-872]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-880], rdx
		mov		rsi, qword [rbp-880]
		mov		qword [rbp-888], rsi
		mov		rdi, qword [rbp-888]
		imul		rdi, 2345
		mov		qword [rbp-888], rdi
		mov		rax, qword [rbp-888]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-896], rdx
		mov		rsi, qword [rbp-896]
		mov		qword [rbp-904], rsi
		mov		rdi, qword [rbp-904]
		imul		rdi, 2345
		mov		qword [rbp-904], rdi
		mov		rax, qword [rbp-904]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-912], rdx
		mov		rsi, qword [rbp-912]
		mov		qword [rbp-920], rsi
		mov		rdi, qword [rbp-920]
		imul		rdi, 2345
		mov		qword [rbp-920], rdi
		mov		rax, qword [rbp-920]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-928], rdx
		mov		rsi, qword [rbp-928]
		mov		qword [rbp-936], rsi
		mov		rdi, qword [rbp-936]
		imul		rdi, 2345
		mov		qword [rbp-936], rdi
		mov		rax, qword [rbp-936]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-944], rdx
		mov		rsi, qword [rbp-944]
		mov		qword [rbp-952], rsi
		mov		rdi, qword [rbp-952]
		imul		rdi, 2345
		mov		qword [rbp-952], rdi
		mov		rax, qword [rbp-952]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-960], rdx
		mov		rsi, qword [rbp-960]
		mov		qword [rbp-968], rsi
		mov		rdi, qword [rbp-968]
		imul		rdi, 2345
		mov		qword [rbp-968], rdi
		mov		rax, qword [rbp-968]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-976], rdx
		mov		rsi, qword [rbp-976]
		mov		qword [rbp-984], rsi
		mov		rdi, qword [rbp-984]
		imul		rdi, 2345
		mov		qword [rbp-984], rdi
		mov		rax, qword [rbp-984]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-992], rdx
		mov		rsi, qword [rbp-992]
		mov		qword [rbp-1000], rsi
		mov		rdi, qword [rbp-1000]
		imul		rdi, 2345
		mov		qword [rbp-1000], rdi
		mov		rax, qword [rbp-1000]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1008], rdx
		mov		rsi, qword [rbp-1008]
		mov		qword [rbp-1016], rsi
		mov		rdi, qword [rbp-1016]
		imul		rdi, 2345
		mov		qword [rbp-1016], rdi
		mov		rax, qword [rbp-1016]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1024], rdx
		mov		rsi, qword [rbp-1024]
		mov		qword [rbp-1032], rsi
		mov		rdi, qword [rbp-1032]
		imul		rdi, 2345
		mov		qword [rbp-1032], rdi
		mov		rax, qword [rbp-1032]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1040], rdx
		mov		rsi, qword [rbp-1040]
		mov		qword [rbp-1048], rsi
		mov		rdi, qword [rbp-1048]
		imul		rdi, 2345
		mov		qword [rbp-1048], rdi
		mov		rax, qword [rbp-1048]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1056], rdx
		mov		rsi, qword [rbp-1056]
		mov		qword [rbp-1064], rsi
		mov		rdi, qword [rbp-1064]
		imul		rdi, 2345
		mov		qword [rbp-1064], rdi
		mov		rax, qword [rbp-1064]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1072], rdx
		mov		rsi, qword [rbp-1072]
		mov		qword [rbp-1080], rsi
		mov		rdi, qword [rbp-1080]
		imul		rdi, 2345
		mov		qword [rbp-1080], rdi
		mov		rax, qword [rbp-1080]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1088], rdx
		mov		rsi, qword [rbp-1088]
		mov		qword [rbp-1096], rsi
		mov		rdi, qword [rbp-1096]
		imul		rdi, 2345
		mov		qword [rbp-1096], rdi
		mov		rax, qword [rbp-1096]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1104], rdx
		mov		rsi, qword [rbp-1104]
		mov		qword [rbp-1112], rsi
		mov		rdi, qword [rbp-1112]
		imul		rdi, 2345
		mov		qword [rbp-1112], rdi
		mov		rax, qword [rbp-1112]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1120], rdx
		mov		rsi, qword [rbp-1120]
		mov		qword [rbp-1128], rsi
		mov		rdi, qword [rbp-1128]
		imul		rdi, 2345
		mov		qword [rbp-1128], rdi
		mov		rax, qword [rbp-1128]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1136], rdx
		mov		rsi, qword [rbp-1136]
		mov		qword [rbp-1144], rsi
		mov		rdi, qword [rbp-1144]
		imul		rdi, 2345
		mov		qword [rbp-1144], rdi
		mov		rax, qword [rbp-1144]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1152], rdx
		mov		rsi, qword [rbp-1152]
		mov		qword [rbp-1160], rsi
		mov		rdi, qword [rbp-1160]
		imul		rdi, 2345
		mov		qword [rbp-1160], rdi
		mov		rax, qword [rbp-1160]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1168], rdx
		mov		r12, qword [rbp-1168]
		imul		r12, 2345
		mov		rax, r12
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1176], rdx
		mov		rsi, qword [rbp-1176]
		mov		qword [rbp-1184], rsi
		mov		rdi, qword [rbp-1184]
		imul		rdi, 2345
		mov		qword [rbp-1184], rdi
		mov		rax, qword [rbp-1184]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1192], rdx
		mov		rsi, qword [rbp-1192]
		mov		qword [rbp-1200], rsi
		mov		rdi, qword [rbp-1200]
		imul		rdi, 2345
		mov		qword [rbp-1200], rdi
		mov		rax, qword [rbp-1200]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1208], rdx
		mov		rsi, qword [rbp-1208]
		mov		qword [rbp-1216], rsi
		mov		rdi, qword [rbp-1216]
		imul		rdi, 2345
		mov		qword [rbp-1216], rdi
		mov		rax, qword [rbp-1216]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1224], rdx
		mov		rsi, qword [rbp-1224]
		mov		qword [rbp-1232], rsi
		mov		rdi, qword [rbp-1232]
		imul		rdi, 2345
		mov		qword [rbp-1232], rdi
		mov		rax, qword [rbp-1232]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1240], rdx
		mov		rsi, qword [rbp-1240]
		mov		qword [rbp-1248], rsi
		mov		rdi, qword [rbp-1248]
		imul		rdi, 2345
		mov		qword [rbp-1248], rdi
		mov		rax, qword [rbp-1248]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1256], rdx
		mov		rsi, qword [rbp-1256]
		mov		qword [rbp-1264], rsi
		mov		rdi, qword [rbp-1264]
		imul		rdi, 2345
		mov		qword [rbp-1264], rdi
		mov		rax, qword [rbp-1264]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1272], rdx
		mov		rsi, qword [rbp-1272]
		mov		qword [rbp-1280], rsi
		mov		rdi, qword [rbp-1280]
		imul		rdi, 2345
		mov		qword [rbp-1280], rdi
		mov		rax, qword [rbp-1280]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1288], rdx
		mov		rsi, qword [rbp-1288]
		mov		qword [rbp-1296], rsi
		mov		rdi, qword [rbp-1296]
		imul		rdi, 2345
		mov		qword [rbp-1296], rdi
		mov		rax, qword [rbp-1296]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1304], rdx
		mov		rsi, qword [rbp-1304]
		mov		qword [rbp-1312], rsi
		mov		rdi, qword [rbp-1312]
		imul		rdi, 2345
		mov		qword [rbp-1312], rdi
		mov		rax, qword [rbp-1312]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1320], rdx
		mov		rsi, qword [rbp-1320]
		mov		qword [rbp-1328], rsi
		mov		rdi, qword [rbp-1328]
		imul		rdi, 2345
		mov		qword [rbp-1328], rdi
		mov		rax, qword [rbp-1328]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1336], rdx
		mov		rsi, qword [rbp-1336]
		mov		qword [rbp-1344], rsi
		mov		rdi, qword [rbp-1344]
		imul		rdi, 2345
		mov		qword [rbp-1344], rdi
		mov		rax, qword [rbp-1344]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1352], rdx
		mov		rsi, qword [rbp-1352]
		mov		qword [rbp-1360], rsi
		mov		rdi, qword [rbp-1360]
		imul		rdi, 2345
		mov		qword [rbp-1360], rdi
		mov		rax, qword [rbp-1360]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1368], rdx
		mov		rsi, qword [rbp-1368]
		mov		qword [rbp-1376], rsi
		mov		rdi, qword [rbp-1376]
		imul		rdi, 2345
		mov		qword [rbp-1376], rdi
		mov		rax, qword [rbp-1376]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1384], rdx
		mov		rsi, qword [rbp-1384]
		mov		qword [rbp-1392], rsi
		mov		rdi, qword [rbp-1392]
		imul		rdi, 2345
		mov		qword [rbp-1392], rdi
		mov		rax, qword [rbp-1392]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1400], rdx
		mov		rsi, qword [rbp-1400]
		mov		qword [rbp-1408], rsi
		mov		rdi, qword [rbp-1408]
		imul		rdi, 2345
		mov		qword [rbp-1408], rdi
		mov		rax, qword [rbp-1408]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1416], rdx
		mov		rsi, qword [rbp-1416]
		mov		qword [rbp-1424], rsi
		mov		rdi, qword [rbp-1424]
		imul		rdi, 2345
		mov		qword [rbp-1424], rdi
		mov		rax, qword [rbp-1424]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1432], rdx
		mov		rsi, qword [rbp-1432]
		mov		qword [rbp-1440], rsi
		mov		rdi, qword [rbp-1440]
		imul		rdi, 2345
		mov		qword [rbp-1440], rdi
		mov		rax, qword [rbp-1440]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1448], rdx
		mov		rsi, qword [rbp-1448]
		mov		qword [rbp-1456], rsi
		mov		rdi, qword [rbp-1456]
		imul		rdi, 2345
		mov		qword [rbp-1456], rdi
		mov		rax, qword [rbp-1456]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1464], rdx
		mov		rsi, qword [rbp-1464]
		mov		qword [rbp-1472], rsi
		mov		rdi, qword [rbp-1472]
		imul		rdi, 2345
		mov		qword [rbp-1472], rdi
		mov		rax, qword [rbp-1472]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1480], rdx
		mov		rsi, qword [rbp-1480]
		mov		qword [rbp-1488], rsi
		mov		rdi, qword [rbp-1488]
		imul		rdi, 2345
		mov		qword [rbp-1488], rdi
		mov		rax, qword [rbp-1488]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		r15, rdx
		mov		qword [rbp-1496], r15
		mov		rdi, qword [rbp-1496]
		imul		rdi, 2345
		mov		qword [rbp-1496], rdi
		mov		rax, qword [rbp-1496]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1504], rdx
		mov		rsi, qword [rbp-1504]
		mov		qword [rbp-1512], rsi
		mov		rdi, qword [rbp-1512]
		imul		rdi, 2345
		mov		qword [rbp-1512], rdi
		mov		rax, qword [rbp-1512]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1520], rdx
		mov		rsi, qword [rbp-1520]
		mov		qword [rbp-1528], rsi
		mov		rdi, qword [rbp-1528]
		imul		rdi, 2345
		mov		qword [rbp-1528], rdi
		mov		rax, qword [rbp-1528]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1536], rdx
		mov		rsi, qword [rbp-1536]
		mov		qword [rbp-1544], rsi
		mov		rdi, qword [rbp-1544]
		imul		rdi, 2345
		mov		qword [rbp-1544], rdi
		mov		rax, qword [rbp-1544]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1552], rdx
		mov		rsi, qword [rbp-1552]
		mov		qword [rbp-1560], rsi
		mov		rdi, qword [rbp-1560]
		imul		rdi, 2345
		mov		qword [rbp-1560], rdi
		mov		rax, qword [rbp-1560]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1568], rdx
		mov		rsi, qword [rbp-1568]
		mov		qword [rbp-1576], rsi
		mov		rdi, qword [rbp-1576]
		imul		rdi, 2345
		mov		qword [rbp-1576], rdi
		mov		rax, qword [rbp-1576]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1584], rdx
		mov		rsi, qword [rbp-1584]
		mov		qword [rbp-1592], rsi
		mov		rdi, qword [rbp-1592]
		imul		rdi, 2345
		mov		qword [rbp-1592], rdi
		mov		rax, qword [rbp-1592]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1600], rdx
		mov		rsi, qword [rbp-1600]
		mov		qword [rbp-1608], rsi
		mov		rdi, qword [rbp-1608]
		imul		rdi, 2345
		mov		qword [rbp-1608], rdi
		mov		rax, qword [rbp-1608]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1616], rdx
		mov		rsi, qword [rbp-1616]
		mov		qword [rbp-1624], rsi
		mov		rdi, qword [rbp-1624]
		imul		rdi, 2345
		mov		qword [rbp-1624], rdi
		mov		rax, qword [rbp-1624]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1632], rdx
		mov		rsi, qword [rbp-1632]
		mov		qword [rbp-1640], rsi
		mov		rdi, qword [rbp-1640]
		imul		rdi, 2345
		mov		qword [rbp-1640], rdi
		mov		rax, qword [rbp-1640]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1648], rdx
		mov		rsi, qword [rbp-1648]
		mov		qword [rbp-1656], rsi
		mov		rdi, qword [rbp-1656]
		imul		rdi, 2345
		mov		qword [rbp-1656], rdi
		mov		rax, qword [rbp-1656]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1664], rdx
		mov		r13, qword [rbp-1664]
		imul		r13, 2345
		mov		rax, r13
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1672], rdx
		mov		rsi, qword [rbp-1672]
		mov		qword [rbp-1680], rsi
		mov		rdi, qword [rbp-1680]
		imul		rdi, 2345
		mov		qword [rbp-1680], rdi
		mov		rax, qword [rbp-1680]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1688], rdx
		mov		rsi, qword [rbp-1688]
		mov		qword [rbp-1696], rsi
		mov		rdi, qword [rbp-1696]
		imul		rdi, 2345
		mov		qword [rbp-1696], rdi
		mov		rax, qword [rbp-1696]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1704], rdx
		mov		rsi, qword [rbp-1704]
		mov		qword [rbp-1712], rsi
		mov		rdi, qword [rbp-1712]
		imul		rdi, 2345
		mov		qword [rbp-1712], rdi
		mov		rax, qword [rbp-1712]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1720], rdx
		mov		rsi, qword [rbp-1720]
		mov		qword [rbp-1728], rsi
		mov		rdi, qword [rbp-1728]
		imul		rdi, 2345
		mov		qword [rbp-1728], rdi
		mov		rax, qword [rbp-1728]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1736], rdx
		mov		rsi, qword [rbp-1736]
		mov		qword [rbp-1744], rsi
		mov		rdi, qword [rbp-1744]
		imul		rdi, 2345
		mov		qword [rbp-1744], rdi
		mov		rax, qword [rbp-1744]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1752], rdx
		mov		rsi, qword [rbp-1752]
		mov		qword [rbp-1760], rsi
		mov		rdi, qword [rbp-1760]
		imul		rdi, 2345
		mov		qword [rbp-1760], rdi
		mov		rax, qword [rbp-1760]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1768], rdx
		mov		rsi, qword [rbp-1768]
		mov		qword [rbp-1776], rsi
		mov		rdi, qword [rbp-1776]
		imul		rdi, 2345
		mov		qword [rbp-1776], rdi
		mov		rax, qword [rbp-1776]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1784], rdx
		mov		rsi, qword [rbp-1784]
		mov		qword [rbp-1792], rsi
		mov		rdi, qword [rbp-1792]
		imul		rdi, 2345
		mov		qword [rbp-1792], rdi
		mov		rax, qword [rbp-1792]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1800], rdx
		mov		rsi, qword [rbp-1800]
		mov		qword [rbp-1808], rsi
		mov		rdi, qword [rbp-1808]
		imul		rdi, 2345
		mov		qword [rbp-1808], rdi
		mov		rax, qword [rbp-1808]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1816], rdx
		mov		rsi, qword [rbp-1816]
		mov		qword [rbp-1824], rsi
		mov		rdi, qword [rbp-1824]
		imul		rdi, 2345
		mov		qword [rbp-1824], rdi
		mov		rax, qword [rbp-1824]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1832], rdx
		mov		rsi, qword [rbp-1832]
		mov		qword [rbp-1840], rsi
		mov		rdi, qword [rbp-1840]
		imul		rdi, 2345
		mov		qword [rbp-1840], rdi
		mov		rax, qword [rbp-1840]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1848], rdx
		mov		rsi, qword [rbp-1848]
		mov		qword [rbp-1856], rsi
		mov		rdi, qword [rbp-1856]
		imul		rdi, 2345
		mov		qword [rbp-1856], rdi
		mov		rax, qword [rbp-1856]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1864], rdx
		mov		rsi, qword [rbp-1864]
		mov		qword [rbp-1872], rsi
		mov		rdi, qword [rbp-1872]
		imul		rdi, 2345
		mov		qword [rbp-1872], rdi
		mov		rax, qword [rbp-1872]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1880], rdx
		mov		rsi, qword [rbp-1880]
		mov		qword [rbp-1888], rsi
		mov		rdi, qword [rbp-1888]
		imul		rdi, 2345
		mov		qword [rbp-1888], rdi
		mov		rax, qword [rbp-1888]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1896], rdx
		mov		rsi, qword [rbp-1896]
		mov		qword [rbp-1904], rsi
		mov		rdi, qword [rbp-1904]
		imul		rdi, 2345
		mov		qword [rbp-1904], rdi
		mov		rax, qword [rbp-1904]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1912], rdx
		mov		rsi, qword [rbp-1912]
		mov		qword [rbp-1920], rsi
		mov		rdi, qword [rbp-1920]
		imul		rdi, 2345
		mov		qword [rbp-1920], rdi
		mov		rax, qword [rbp-1920]
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1928], rdx
		mov		r10, qword [rbp-1928]
		imul		r10, 2345
		mov		rax, r10
		mov		rsi, 1234
		cqo
		idiv		rsi
		mov		qword [rbp-1936], rdx
		mov		rax, qword [rbp-1936]
		mov		rsi, 11
		cqo
		idiv		rsi
		mov		qword [rbp-1944], rdx
		mov		rsi, qword [rbp-368]
		mov		qword [rbp-1952], rsi
		mov		rdi, qword [rbp-1952]
		mov		rsi, qword [rbp-1944]
		add		rdi, rsi
		mov		qword [rbp-1952], rdi
		mov		rsi, qword [rbp-1952]
		mov		qword [rbp-368], rsi
		inc		r11
loop_cond_21:
		cmp		r11, 1000000
		jle		loop_body_21
		jg		loop_end_21
loop_end_21:
		mov		rdi, qword [rbp-368]
		call	toString
		mov		qword [rbp-1960], rax
		mov		rdi, qword [rbp-1960]
		call	println
		mov		r15, rax
		mov		r11, 1
		jmp		loop_cond_22
loop_body_22:
		inc		r11
loop_cond_22:
		cmp		r11, 200000000
		jle		loop_body_22
		jg		loop_end_22
loop_end_22:
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 232
		push		r12
		push		r15
		push		r9
		push		r13
		push		r10
		push		r8
		push		r14
		push		r11
		mov		qword [rel _global_N], 100000
		mov		rdi, 100000
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
		mov		rdi, 100000
		mov		qword [rax+0], rdi
		mov		qword [rbp-8], 0
		jmp		loop_cond_23
loop_body_23:
		inc		qword [rbp-8]
loop_cond_23:
		mov		rsi, qword [rel _global_N]
		cmp		qword [rbp-8], rsi
		jl		loop_body_23
loop_end_23:
		mov		qword [rel _global_a], r13
		mov		rdi, qword [rel _global_N]
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
		mov		qword [rbp-16], rax
		mov		rdi, qword [rel _global_N]
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_24
loop_body_24:
		inc		r13
loop_cond_24:
		mov		rsi, qword [rel _global_N]
		cmp		r13, rsi
		jl		loop_body_24
loop_end_24:
		mov		rsi, qword [rbp-16]
		mov		qword [rel _global_bak], rsi
		mov		rdi, qword [rel _global_N]
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
		mov		rdi, qword [rel _global_N]
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_25
loop_body_25:
		inc		r13
loop_cond_25:
		mov		rsi, qword [rel _global_N]
		cmp		r13, rsi
		jl		loop_body_25
loop_end_25:
		mov		qword [rel _global_a_left], r9
		mov		rdi, qword [rel _global_N]
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
		mov		rdi, qword [rel _global_N]
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_26
loop_body_26:
		inc		r13
loop_cond_26:
		mov		rsi, qword [rel _global_N]
		cmp		r13, rsi
		jl		loop_body_26
loop_end_26:
		mov		qword [rel _global_a_right], r8
		mov		rdi, qword [rel _global_N]
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
		mov		rdi, qword [rel _global_N]
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_27
loop_body_27:
		inc		r13
loop_cond_27:
		mov		rsi, qword [rel _global_N]
		cmp		r13, rsi
		jl		loop_body_27
loop_end_27:
		mov		rsi, qword [rbp-24]
		mov		qword [rel _global_heap], rsi
		call	getInt
		mov		qword [rbp-32], rax
		mov		rsi, qword [rbp-32]
		mov		qword [rel _global_n], rsi
		call	getInt
		mov		qword [rbp-40], rax
		mov		r13, qword [rbp-40]
		mov		r9, 1
		jmp		loop_cond_28
loop_body_28:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r9
		mov		qword [rbx+rcx*8+8], r9
		cmp		r9, r13
		jle		if_true_0
		jg		if_false_0
if_true_0:
		mov		r15, r13
		add		r15, 1
		mov		r10, r15
		sub		r10, r9
		mov		rbx, qword [rel _global_a]
		mov		rcx, r9
		mov		qword [rbx+rcx*8+8], r10
		jmp		if_end_0
if_false_0:
		nop
if_end_0:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r9
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rel _global_bak]
		mov		rcx, r9
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		inc		r9
loop_cond_28:
		mov		rsi, qword [rel _global_n]
		cmp		r9, rsi
		jle		loop_body_28
		jg		loop_end_28
loop_end_28:
		mov		r11, qword [rel _global_n]
		add		r11, 1
		mov		rdi, 1
		mov		rsi, r11
		call	quicksort
		mov		r14, rax
		call	restore
		mov		r15, rax
		call	calc
		mov		r12, rax
		mov		qword [rbp-72], r12
		call	restore
		mov		r15, rax
		mov		r12, r11
		mov		rdi, 1
		mov		rsi, r12
		call	mergesort
		mov		r12, rax
		call	restore
		mov		r15, rax
		call	heapsort
		mov		r11, rax
		mov		rdi, r14
		call	toString
		mov		r14, rax
		mov		rdi, r14
		call	println
		mov		r15, rax
		mov		rdi, qword [rbp-72]
		call	toString
		mov		r14, rax
		mov		rdi, r14
		call	println
		mov		r15, rax
		mov		rdi, r12
		call	toString
		mov		r14, rax
		mov		rdi, r14
		call	println
		mov		r15, rax
		mov		rdi, r11
		call	toString
		mov		r14, rax
		mov		rdi, r14
		call	println
		mov		r15, rax
		mov		rdi, 1
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
		mov		qword [rbp-80], rax
		mov		rdi, 1
		mov		qword [rax+0], rdi
		mov		rdi, qword [rbp-80]
		call	A_Optimizer
		mov		r15, rax
		mov		rax, 0
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret

restore:
restore_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 168
		push		r15
		push		r14
		mov		r14, 1
		jmp		loop_cond_29
loop_body_29:
		mov		rbx, qword [rel _global_bak]
		mov		rcx, r14
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r15
		inc		r14
loop_cond_29:
		mov		rsi, qword [rel _global_n]
		cmp		r14, rsi
		jle		loop_body_29
		jg		loop_end_29
loop_end_29:
		pop		r14
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

quicksort:
quicksort_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 272
		push		r12
		push		r15
		push		r9
		push		r13
		push		r10
		push		r8
		push		r14
		push		r11
		mov		r9, rdi
		mov		r12, rsi
		mov		qword [rbp-8], 0
		mov		rbx, qword [rel _global_a]
		mov		rcx, r9
		mov		r14, qword [rbx+rcx*8+8]
		mov		qword [rbp-24], 0
		mov		qword [rbp-32], 0
		mov		qword [rbp-40], r9
		mov		rdi, qword [rbp-40]
		add		rdi, 1
		mov		qword [rbp-40], rdi
		mov		rsi, qword [rbp-40]
		mov		qword [rbp-48], rsi
		jmp		loop_cond_30
loop_body_30:
		inc		qword [rbp-8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-48]
		cmp		qword [rbx+rcx*8+8], r14
		jl		if_true_1
		jge		if_false_1
if_true_1:
		mov		r15, qword [rbp-24]
		inc		qword [rbp-24]
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-48]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a_left]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r8
		jmp		if_end_1
if_false_1:
		mov		rsi, qword [rbp-32]
		mov		qword [rbp-64], rsi
		inc		qword [rbp-32]
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-48]
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a_right]
		mov		rcx, qword [rbp-64]
		mov		qword [rbx+rcx*8+8], r11
if_end_1:
		inc		qword [rbp-48]
loop_cond_30:
		cmp		qword [rbp-48], r12
		jl		loop_body_30
		jge		loop_end_30
loop_end_30:
		mov		r15, r9
		mov		qword [rbp-48], 0
		jmp		loop_cond_31
loop_body_31:
		mov		r10, r15
		inc		r15
		mov		rbx, qword [rel _global_a_left]
		mov		rcx, qword [rbp-48]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-80], rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, r10
		mov		rsi, qword [rbp-80]
		mov		qword [rbx+rcx*8+8], rsi
		inc		qword [rbp-48]
loop_cond_31:
		mov		rsi, qword [rbp-24]
		cmp		qword [rbp-48], rsi
		jl		loop_body_31
		jge		loop_end_31
loop_end_31:
		mov		qword [rbp-88], r15
		inc		r15
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-88]
		mov		qword [rbx+rcx*8+8], r14
		mov		qword [rbp-48], 0
		jmp		loop_cond_32
loop_body_32:
		mov		r13, r15
		inc		r15
		mov		rbx, qword [rel _global_a_right]
		mov		rcx, qword [rbp-48]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-96], rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		mov		rsi, qword [rbp-96]
		mov		qword [rbx+rcx*8+8], rsi
		inc		qword [rbp-48]
loop_cond_32:
		mov		rsi, qword [rbp-32]
		cmp		qword [rbp-48], rsi
		jl		loop_body_32
		jge		loop_end_32
loop_end_32:
		cmp		qword [rbp-24], 1
		jg		if_true_2
		jle		if_false_2
if_true_2:
		mov		qword [rbp-104], r9
		mov		rdi, qword [rbp-104]
		mov		rsi, qword [rbp-24]
		add		rdi, rsi
		mov		qword [rbp-104], rdi
		mov		rdi, r9
		mov		rsi, qword [rbp-104]
		call	quicksort
		mov		qword [rbp-112], rax
		mov		r9, qword [rbp-8]
		mov		rsi, qword [rbp-112]
		add		r9, rsi
		mov		qword [rbp-8], r9
		jmp		if_end_2
if_false_2:
		nop
if_end_2:
		cmp		qword [rbp-32], 1
		jg		if_true_3
		jle		if_false_3
if_true_3:
		mov		qword [rbp-120], r12
		mov		rdi, qword [rbp-120]
		mov		rsi, qword [rbp-32]
		sub		rdi, rsi
		mov		qword [rbp-120], rdi
		mov		rdi, qword [rbp-120]
		mov		rsi, r12
		call	quicksort
		mov		qword [rbp-128], rax
		mov		r12, qword [rbp-8]
		mov		rsi, qword [rbp-128]
		add		r12, rsi
		mov		qword [rbp-8], r12
		jmp		if_end_3
if_false_3:
		nop
if_end_3:
		mov		rax, qword [rbp-8]
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret

calc:
calc_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 184
		push		r12
		push		r15
		push		r9
		push		r13
		push		r10
		push		r8
		push		r14
		push		r11
		mov		r13, 1
		jmp		loop_cond_33
loop_body_33:
		mov		r12, r13
		sub		r12, 1
		mov		rbx, qword [rel _global_a_left]
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r12
		mov		r9, r13
		add		r9, 1
		mov		rbx, qword [rel _global_a_right]
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r9
		inc		r13
loop_cond_33:
		mov		rsi, qword [rel _global_n]
		cmp		r13, rsi
		jle		loop_body_33
		jg		loop_end_33
loop_end_33:
		mov		r12, 0
		mov		r13, qword [rel _global_n]
		jmp		loop_cond_34
loop_body_34:
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-32], rsi
		mov		rbx, qword [rel _global_a_left]
		mov		rcx, qword [rbp-32]
		mov		r10, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a_right]
		mov		rcx, r8
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a_right]
		mov		rcx, r10
		mov		qword [rbx+rcx*8+8], r14
		mov		rbx, qword [rel _global_a_left]
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r10
		mov		qword [rbp-40], r12
		mov		rdi, qword [rbp-40]
		add		rdi, r14
		mov		qword [rbp-40], rdi
		mov		r11, qword [rbp-40]
		sub		r11, r10
		mov		r15, r11
		sub		r15, 2
		mov		r12, r15
		dec		r13
loop_cond_34:
		cmp		r13, 1
		jge		loop_body_34
		jl		loop_end_34
loop_end_34:
		mov		rax, r12
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret

mergesort:
mergesort_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 304
		push		r12
		push		r15
		push		r9
		push		r13
		push		r10
		push		r8
		push		r14
		push		r11
		mov		r15, rdi
		mov		r14, rsi
		mov		qword [rbp-8], r15
		mov		rdi, qword [rbp-8]
		add		rdi, 1
		mov		qword [rbp-8], rdi
		cmp		qword [rbp-8], r14
		je		if_true_4
		jne		if_false_4
if_true_4:
		mov		rax, 0
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_4
if_false_4:
		nop
if_end_4:
		mov		r9, r15
		add		r9, r14
		sar		r9, 1
		mov		qword [rbp-16], r9
		mov		qword [rbp-24], 0
		mov		rdi, r15
		mov		rsi, qword [rbp-16]
		call	mergesort
		mov		r9, rax
		mov		r8, qword [rbp-24]
		add		r8, r9
		mov		qword [rbp-24], r8
		mov		rdi, qword [rbp-16]
		mov		rsi, r14
		call	mergesort
		mov		r9, rax
		mov		r8, qword [rbp-24]
		add		r8, r9
		mov		qword [rbp-24], r8
		mov		qword [rbp-32], 0
		mov		r8, 0
		mov		r9, r15
		jmp		loop_cond_35
loop_body_35:
		mov		rsi, qword [rbp-32]
		mov		qword [rbp-40], rsi
		inc		qword [rbp-32]
		mov		rbx, qword [rel _global_a]
		mov		rcx, r9
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rel _global_a_left]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		inc		r9
loop_cond_35:
		mov		rsi, qword [rbp-16]
		cmp		r9, rsi
		jl		loop_body_35
		jge		loop_end_35
loop_end_35:
		mov		r9, qword [rbp-16]
		jmp		loop_cond_36
loop_body_36:
		mov		qword [rbp-72], r8
		inc		r8
		mov		rbx, qword [rel _global_a]
		mov		rcx, r9
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-80], rsi
		mov		rbx, qword [rel _global_a_right]
		mov		rcx, qword [rbp-72]
		mov		rsi, qword [rbp-80]
		mov		qword [rbx+rcx*8+8], rsi
		inc		r9
loop_cond_36:
		cmp		r9, r14
		jl		loop_body_36
		jge		loop_end_36
loop_end_36:
		mov		r9, 0
		mov		qword [rbp-96], 0
		mov		qword [rbp-104], r15
		jmp		loop_cond_37
loop_body_37:
		inc		qword [rbp-24]
		mov		rbx, qword [rel _global_a_right]
		mov		rcx, qword [rbp-96]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-112], rsi
		mov		rbx, qword [rel _global_a_left]
		mov		rcx, r9
		mov		rsi, qword [rbp-112]
		cmp		qword [rbx+rcx*8+8], rsi
		jl		if_true_5
		jge		if_false_5
if_true_5:
		mov		rsi, qword [rbp-104]
		mov		qword [rbp-120], rsi
		inc		qword [rbp-104]
		mov		qword [rbp-128], r9
		inc		r9
		mov		rbx, qword [rel _global_a_left]
		mov		rcx, qword [rbp-128]
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-120]
		mov		qword [rbx+rcx*8+8], r15
		jmp		if_end_5
if_false_5:
		mov		r11, qword [rbp-104]
		inc		qword [rbp-104]
		mov		r10, qword [rbp-96]
		inc		qword [rbp-96]
		mov		rbx, qword [rel _global_a_right]
		mov		rcx, r10
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-136], rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, r11
		mov		rsi, qword [rbp-136]
		mov		qword [rbx+rcx*8+8], rsi
if_end_5:
		nop
loop_cond_37:
		mov		rsi, qword [rbp-32]
		cmp		r9, rsi
		jl		short_mid_0
		jge		loop_end_37
short_mid_0:
		cmp		qword [rbp-96], r8
		jl		loop_body_37
		jge		loop_end_37
loop_end_37:
		jmp		loop_cond_38
loop_body_38:
		mov		r13, qword [rbp-104]
		inc		qword [rbp-104]
		mov		r12, r9
		inc		r9
		mov		rbx, qword [rel _global_a_left]
		mov		rcx, r12
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r14
loop_cond_38:
		mov		rsi, qword [rbp-32]
		cmp		r9, rsi
		jl		loop_body_38
		jge		loop_end_38
loop_end_38:
		jmp		loop_cond_39
loop_body_39:
		mov		rsi, qword [rbp-104]
		mov		qword [rbp-144], rsi
		inc		qword [rbp-104]
		mov		rsi, qword [rbp-96]
		mov		qword [rbp-152], rsi
		inc		qword [rbp-96]
		mov		rbx, qword [rel _global_a_right]
		mov		rcx, qword [rbp-152]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-160], rsi
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-144]
		mov		rsi, qword [rbp-160]
		mov		qword [rbx+rcx*8+8], rsi
loop_cond_39:
		cmp		qword [rbp-96], r8
		jl		loop_body_39
		jge		loop_end_39
loop_end_39:
		mov		rax, qword [rbp-24]
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret

heapsort:
heapsort_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 296
		push		r12
		push		r15
		push		r9
		push		r13
		push		r10
		push		r8
		push		r14
		push		r11
		mov		r8, 0
		mov		qword [rbp-8], 1
		jmp		loop_cond_40
loop_body_40:
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-24], rsi
		mov		rbx, qword [rel _global_heap]
		mov		rcx, qword [rbp-8]
		mov		rsi, qword [rbp-24]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-40], rsi
		jmp		loop_cond_41
loop_body_41:
		inc		r8
		mov		rsi, qword [rbp-40]
		mov		qword [rbp-48], rsi
		mov		rdi, qword [rbp-48]
		sar		rdi, 1
		mov		qword [rbp-48], rdi
		mov		rbx, qword [rel _global_heap]
		mov		rcx, qword [rbp-48]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rel _global_heap]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbp-56]
		cmp		qword [rbx+rcx*8+8], rsi
		jg		if_true_6
		jle		if_false_6
if_true_6:
		jmp		loop_end_41
		jmp		if_end_6
if_false_6:
		nop
if_end_6:
		mov		rbx, qword [rel _global_heap]
		mov		rcx, qword [rbp-40]
		mov		r10, qword [rbx+rcx*8+8]
		mov		r15, qword [rbp-40]
		sar		r15, 1
		mov		rbx, qword [rel _global_heap]
		mov		rcx, r15
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-64], rsi
		mov		rbx, qword [rel _global_heap]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbp-64]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-40]
		mov		qword [rbp-72], rsi
		mov		rdi, qword [rbp-72]
		sar		rdi, 1
		mov		qword [rbp-72], rdi
		mov		rbx, qword [rel _global_heap]
		mov		rcx, qword [rbp-72]
		mov		qword [rbx+rcx*8+8], r10
		mov		rsi, qword [rbp-40]
		mov		qword [rbp-80], rsi
		mov		rdi, qword [rbp-80]
		sar		rdi, 1
		mov		qword [rbp-80], rdi
		mov		rsi, qword [rbp-80]
		mov		qword [rbp-40], rsi
loop_cond_41:
		cmp		qword [rbp-40], 1
		jne		loop_body_41
		je		loop_end_41
loop_end_41:
		inc		qword [rbp-8]
loop_cond_40:
		mov		rsi, qword [rel _global_n]
		cmp		qword [rbp-8], rsi
		jle		loop_body_40
		jg		loop_end_40
loop_end_40:
		mov		rsi, qword [rel _global_n]
		mov		qword [rbp-88], rsi
		mov		qword [rbp-8], 1
		jmp		loop_cond_42
loop_body_42:
		mov		rbx, qword [rel _global_heap]
		mov		rcx, 1
		mov		r9, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_a]
		mov		rcx, qword [rbp-8]
		mov		qword [rbx+rcx*8+8], r9
		mov		r14, qword [rbp-88]
		dec		qword [rbp-88]
		mov		rbx, qword [rel _global_heap]
		mov		rcx, r14
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-96], rsi
		mov		rbx, qword [rel _global_heap]
		mov		rcx, 1
		mov		rsi, qword [rbp-96]
		mov		qword [rbx+rcx*8+8], rsi
		mov		qword [rbp-104], 1
		jmp		loop_cond_43
loop_body_43:
		mov		rsi, qword [rbp-104]
		mov		qword [rbp-112], rsi
		mov		rdi, qword [rbp-112]
		sal		rdi, 1
		mov		qword [rbp-112], rdi
		mov		rsi, qword [rbp-112]
		mov		qword [rbp-120], rsi
		mov		rsi, qword [rbp-120]
		mov		qword [rbp-128], rsi
		mov		rdi, qword [rbp-128]
		add		rdi, 1
		mov		qword [rbp-128], rdi
		mov		r13, qword [rbp-128]
		mov		r15, qword [rbp-120]
		mov		rsi, qword [rbp-88]
		cmp		r13, rsi
		jle		if_true_7
		jg		if_false_7
if_true_7:
		inc		r8
		mov		rbx, qword [rel _global_heap]
		mov		rcx, qword [rbp-120]
		mov		r12, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_heap]
		mov		rcx, r13
		cmp		qword [rbx+rcx*8+8], r12
		jl		if_true_8
		jge		if_false_8
if_true_8:
		mov		r15, r13
		jmp		if_end_8
if_false_8:
		nop
if_end_8:
		jmp		if_end_7
if_false_7:
		nop
if_end_7:
		inc		r8
		mov		rbx, qword [rel _global_heap]
		mov		rcx, r15
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-136], rsi
		mov		rbx, qword [rel _global_heap]
		mov		rcx, qword [rbp-104]
		mov		rsi, qword [rbp-136]
		cmp		qword [rbx+rcx*8+8], rsi
		jl		if_true_9
		jge		if_false_9
if_true_9:
		jmp		loop_end_43
		jmp		if_end_9
if_false_9:
		nop
if_end_9:
		mov		rbx, qword [rel _global_heap]
		mov		rcx, qword [rbp-104]
		mov		r10, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_heap]
		mov		rcx, r15
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-144], rsi
		mov		rbx, qword [rel _global_heap]
		mov		rcx, qword [rbp-104]
		mov		rsi, qword [rbp-144]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rel _global_heap]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r10
		mov		r10, qword [rbp-104]
		mov		qword [rbp-104], r15
loop_cond_43:
		mov		r11, qword [rbp-104]
		sal		r11, 1
		mov		rsi, qword [rbp-88]
		cmp		r11, rsi
		jle		loop_body_43
		jg		loop_end_43
loop_end_43:
		inc		qword [rbp-8]
loop_cond_42:
		mov		rsi, qword [rel _global_n]
		cmp		qword [rbp-8], rsi
		jle		loop_body_42
		jg		loop_end_42
loop_end_42:
		mov		rax, r8
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r11
		pop		r14
		pop		r8
		pop		r10
		pop		r13
		pop		r9
		pop		r15
		pop		r12
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

_global_N:
		dq 0
_global_n:
		dq 0
_global_a:
		dq 0
_global_bak:
		dq 0
_global_a_left:
		dq 0
_global_a_right:
		dq 0
_global_heap:
		dq 0
_global_i1:
		dq 0
_global_i2:
		dq 0
_global_i3:
		dq 0
_global_i4:
		dq 0
_global_i5:
		dq 0
_global_i6:
		dq 0
_global_i7:
		dq 0
_global_i8:
		dq 0
_global_i9:
		dq 0
_global_i10:
		dq 0
_global_i11:
		dq 0
_global_i12:
		dq 0
_global_i13:
		dq 0
_global_i14:
		dq 0
intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
