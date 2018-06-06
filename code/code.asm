default rel

global vector_init
global vector_getDim
global vector_dot
global vector_scalarInPlaceMultiply
global vector_add
global vector_set
global vector_tostring
global vector_copy
global string_length
global string_ord
global string_substring
global string_parseInt
global main
global print
global toString
global addString__
global println
global getInt
global getString


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

vector_init:
vector_init_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r11
		push		r13
		push		r15
		push		r12
		push		r14
		mov		r12, rdi
		mov		r15, rsi
		cmp		r15, 0
		je		if_true_0
		jne		if_false_0
if_true_0:
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_0
if_false_0:
		nop
if_end_0:
		mov		rbx, r15
		mov		rcx, -1
		mov		r13, qword [rbx+rcx*8+8]
		mov		rdi, r13
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
		mov		rdi, r13
		mov		qword [rax+0], rdi
		mov		r11, 0
		jmp		loop_cond_0
loop_body_0:
		inc		r11
loop_cond_0:
		cmp		r11, r13
		jl		loop_body_0
loop_end_0:
		mov		rbx, r12
		mov		qword [rbx+8], r14
		mov		r13, 0
		jmp		loop_cond_1
loop_body_1:
		mov		rbx, r15
		mov		rcx, r13
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		r14, qword [rbx+8]
		mov		rbx, r14
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r11
		inc		r13
loop_cond_1:
		mov		rbx, r15
		mov		rcx, -1
		mov		r14, qword [rbx+rcx*8+8]
		cmp		r13, r14
		jl		loop_body_1
		jge		loop_end_1
loop_end_1:
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

vector_getDim:
vector_getDim_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r15
		mov		r15, rdi
		mov		rbx, r15
		cmp		qword [rbx+8], 0
		je		if_true_1
		jne		if_false_1
if_true_1:
		mov		rax, 0
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_1
if_false_1:
		nop
if_end_1:
		mov		rbx, r15
		mov		r15, qword [rbx+8]
		mov		rbx, r15
		mov		rcx, -1
		mov		r15, qword [rbx+rcx*8+8]
		mov		rax, r15
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r15
		mov		rsp, rbp
		pop		rbp
		ret

vector_dot:
vector_dot_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r11
		push		r13
		push		r15
		push		r12
		push		r14
		mov		r15, rdi
		mov		r11, rsi
		mov		r12, 0
		mov		r14, 0
		jmp		loop_cond_2
loop_body_2:
		mov		rbx, r15
		mov		r14, qword [rbx+8]
		mov		rbx, r14
		mov		rcx, r12
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r11
		mov		r13, qword [rbx+8]
		mov		rbx, r13
		mov		rcx, r12
		imul		r14, qword [rbx+rcx*8+8]
		inc		r12
loop_cond_2:
		mov		rdi, r15
		call	vector_getDim
		mov		r13, rax
		cmp		r12, r13
		jl		loop_body_2
		jge		loop_end_2
loop_end_2:
		mov		rax, r14
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

vector_scalarInPlaceMultiply:
vector_scalarInPlaceMultiply_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r11
		push		r13
		push		r15
		push		r12
		push		r14
		mov		r12, rdi
		mov		r11, rsi
		mov		rbx, r12
		cmp		qword [rbx+8], 0
		je		if_true_2
		jne		if_false_2
if_true_2:
		mov		rax, 0
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_2
if_false_2:
		nop
if_end_2:
		mov		r14, 0
		jmp		loop_cond_3
loop_body_3:
		mov		r15, r11
		mov		rbx, r12
		mov		r13, qword [rbx+8]
		mov		rbx, r13
		mov		rcx, r14
		imul		r15, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		r13, qword [rbx+8]
		mov		rbx, r13
		mov		rcx, r14
		mov		qword [rbx+rcx*8+8], r15
		inc		r14
loop_cond_3:
		mov		rdi, r12
		call	vector_getDim
		mov		r15, rax
		cmp		r14, r15
		jl		loop_body_3
		jge		loop_end_3
loop_end_3:
		mov		rax, r12
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

vector_add:
vector_add_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r11
		push		r13
		push		r15
		push		r12
		push		r14
		push		r10
		mov		r12, rdi
		mov		r11, rsi
		mov		rdi, r12
		call	vector_getDim
		mov		r13, rax
		mov		rdi, r11
		call	vector_getDim
		mov		r14, rax
		cmp		r13, r14
		jne		if_true_3
		je		short_mid_0
short_mid_0:
		mov		rdi, r12
		call	vector_getDim
		mov		r14, rax
		cmp		r14, 0
		je		if_true_3
		jne		if_false_3
if_true_3:
		mov		rax, 0
		pop		r10
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_3
if_false_3:
		nop
if_end_3:
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
		mov		r10, rax
		mov		rdi, 1
		mov		qword [rax+0], rdi
		mov		r14, r10
		mov		rdi, r12
		call	vector_getDim
		mov		r10, rax
		mov		rdi, r10
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
		mov		rdi, r10
		mov		qword [rax+0], rdi
		mov		r13, 0
		jmp		loop_cond_4
loop_body_4:
		inc		r13
loop_cond_4:
		cmp		r13, r10
		jl		loop_body_4
loop_end_4:
		mov		rbx, r14
		mov		qword [rbx+8], r15
		mov		r13, 0
		jmp		loop_cond_5
loop_body_5:
		mov		rbx, r12
		mov		r15, qword [rbx+8]
		mov		rbx, r15
		mov		rcx, r13
		mov		r10, qword [rbx+rcx*8+8]
		mov		rbx, r11
		mov		r15, qword [rbx+8]
		mov		rbx, r15
		mov		rcx, r13
		add		r10, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		r15, qword [rbx+8]
		mov		rbx, r15
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r10
		inc		r13
loop_cond_5:
		mov		rdi, r12
		call	vector_getDim
		mov		r15, rax
		cmp		r13, r15
		jl		loop_body_5
		jge		loop_end_5
loop_end_5:
		mov		rax, r14
		pop		r10
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r10
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

vector_set:
vector_set_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r13
		push		r15
		push		r12
		push		r14
		mov		r14, rdi
		mov		r12, rsi
		mov		r13, rdx
		mov		rdi, r14
		call	vector_getDim
		mov		r15, rax
		cmp		r15, r12
		jl		if_true_4
		jge		if_false_4
if_true_4:
		mov		rax, 0
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_4
if_false_4:
		nop
if_end_4:
		mov		rbx, r14
		mov		r15, qword [rbx+8]
		mov		rbx, r15
		mov		rcx, r12
		mov		qword [rbx+rcx*8+8], r13
		mov		rax, 1
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		mov		rsp, rbp
		pop		rbp
		ret

vector_tostring:
vector_tostring_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r13
		push		r15
		push		r12
		push		r14
		mov		r13, rdi
		mov		r14, str_const_0
		mov		rdi, r13
		call	vector_getDim
		mov		r15, rax
		cmp		r15, 0
		jg		if_true_5
		jle		if_false_5
if_true_5:
		mov		rbx, r13
		mov		r15, qword [rbx+8]
		mov		rbx, r15
		mov		rcx, 0
		mov		rdi, qword [rbx+rcx*8+8]
		call	toString
		mov		r15, rax
		mov		rdi, r14
		mov		rsi, r15
		call	addString__
		mov		r15, rax
		mov		r14, r15
		jmp		if_end_5
if_false_5:
		nop
if_end_5:
		mov		r12, 1
		jmp		loop_cond_6
loop_body_6:
		mov		rdi, r14
		mov		rsi, str_const_1
		call	addString__
		mov		r15, rax
		mov		rbx, r13
		mov		r14, qword [rbx+8]
		mov		rbx, r14
		mov		rcx, r12
		mov		rdi, qword [rbx+rcx*8+8]
		call	toString
		mov		r14, rax
		mov		rdi, r15
		mov		rsi, r14
		call	addString__
		mov		r15, rax
		mov		r14, r15
		inc		r12
loop_cond_6:
		mov		rdi, r13
		call	vector_getDim
		mov		r15, rax
		cmp		r12, r15
		jl		loop_body_6
		jge		loop_end_6
loop_end_6:
		mov		rdi, r14
		mov		rsi, str_const_2
		call	addString__
		mov		r15, rax
		mov		r14, r15
		mov		rax, r14
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		mov		rsp, rbp
		pop		rbp
		ret

vector_copy:
vector_copy_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r11
		push		r13
		push		r15
		push		r12
		push		r14
		mov		r13, rdi
		mov		r15, rsi
		cmp		r15, 0
		je		if_true_6
		jne		if_false_6
if_true_6:
		mov		rax, 0
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_6
if_false_6:
		nop
if_end_6:
		mov		rdi, r15
		call	vector_getDim
		mov		r14, rax
		cmp		r14, 0
		je		if_true_7
		jne		if_false_7
if_true_7:
		mov		rbx, r13
		mov		qword [rbx+8], 0
		jmp		if_end_7
if_false_7:
		mov		rdi, r15
		call	vector_getDim
		mov		r14, rax
		mov		rdi, r14
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
		mov		rdi, r14
		mov		qword [rax+0], rdi
		mov		r12, 0
		jmp		loop_cond_7
loop_body_7:
		inc		r12
loop_cond_7:
		cmp		r12, r14
		jl		loop_body_7
loop_end_7:
		mov		rbx, r13
		mov		qword [rbx+8], r11
		mov		r12, 0
		jmp		loop_cond_8
loop_body_8:
		mov		rbx, r15
		mov		r14, qword [rbx+8]
		mov		rbx, r14
		mov		rcx, r12
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		r11, qword [rbx+8]
		mov		rbx, r11
		mov		rcx, r12
		mov		qword [rbx+rcx*8+8], r14
		inc		r12
loop_cond_8:
		mov		rdi, r13
		call	vector_getDim
		mov		r14, rax
		cmp		r12, r14
		jl		loop_body_8
		jge		loop_end_8
loop_end_8:
		nop
if_end_7:
		mov		rax, 1
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r11
		push		r13
		push		r15
		push		r12
		push		r14
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
		mov		r15, rax
		mov		rdi, 1
		mov		qword [rax+0], rdi
		mov		rdi, 10
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
		mov		rdi, 10
		mov		qword [rax+0], rdi
		mov		r14, 0
		jmp		loop_cond_9
loop_body_9:
		inc		r14
loop_cond_9:
		cmp		r14, 10
		jl		loop_body_9
loop_end_9:
		mov		r11, r12
		mov		r12, 0
		jmp		loop_cond_10
loop_body_10:
		mov		r14, 9
		sub		r14, r12
		mov		rbx, r11
		mov		rcx, r12
		mov		qword [rbx+rcx*8+8], r14
		inc		r12
loop_cond_10:
		cmp		r12, 10
		jl		loop_body_10
		jge		loop_end_10
loop_end_10:
		mov		rdi, r15
		mov		rsi, r11
		call	vector_init
		mov		r14, rax
		mov		rdi, str_const_3
		call	print
		mov		r14, rax
		mov		rdi, r15
		call	vector_tostring
		mov		r14, rax
		mov		rdi, r14
		call	println
		mov		r14, rax
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
		mov		r13, rax
		mov		rdi, 1
		mov		qword [rax+0], rdi
		mov		r14, r13
		mov		rdi, r14
		mov		rsi, r15
		call	vector_copy
		mov		r13, rax
		mov		rdi, r14
		mov		rsi, 3
		mov		rdx, 817
		call	vector_set
		mov		r13, rax
		cmp		r13, 0
		jnz		if_true_8
		jz		if_false_8
if_true_8:
		mov		rdi, str_const_4
		call	println
		mov		r13, rax
		jmp		if_end_8
if_false_8:
		nop
if_end_8:
		mov		rdi, str_const_5
		call	print
		mov		r13, rax
		mov		rdi, r14
		call	vector_tostring
		mov		r13, rax
		mov		rdi, r13
		call	println
		mov		r13, rax
		mov		rdi, str_const_6
		call	print
		mov		r13, rax
		mov		rdi, r15
		mov		rsi, r14
		call	vector_add
		mov		r13, rax
		mov		rdi, r13
		call	vector_tostring
		mov		r13, rax
		mov		rdi, r13
		call	println
		mov		r13, rax
		mov		rdi, str_const_7
		call	print
		mov		r13, rax
		mov		rdi, r15
		mov		rsi, r14
		call	vector_dot
		mov		r15, rax
		mov		rdi, r15
		call	toString
		mov		r15, rax
		mov		rdi, r15
		call	println
		mov		r15, rax
		mov		rdi, str_const_8
		call	print
		mov		r15, rax
		mov		rdi, r14
		mov		rsi, 8
		call	vector_scalarInPlaceMultiply
		mov		r15, rax
		mov		rdi, r15
		call	vector_tostring
		mov		r15, rax
		mov		rdi, r15
		call	println
		mov		r15, rax
		mov		rax, 0
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r14
		pop		r12
		pop		r15
		pop		r13
		pop		r11
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

	dq	2
str_const_0:
	db	40, 32, 0

	dq	2
str_const_1:
	db	44, 32, 0

	dq	2
str_const_2:
	db	32, 41, 0

	dq	10
str_const_3:
	db	118, 101, 99, 116, 111, 114, 32, 120, 58, 32, 0

	dq	8
str_const_4:
	db	101, 120, 99, 105, 116, 101, 100, 33, 0

	dq	10
str_const_5:
	db	118, 101, 99, 116, 111, 114, 32, 121, 58, 32, 0

	dq	7
str_const_6:
	db	120, 32, 43, 32, 121, 58, 32, 0

	dq	7
str_const_7:
	db	120, 32, 42, 32, 121, 58, 32, 0

	dq	14
str_const_8:
	db	40, 49, 32, 60, 60, 32, 51, 41, 32, 42, 32, 121, 58, 32, 0

intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
