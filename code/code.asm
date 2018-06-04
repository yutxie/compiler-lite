default rel

global string_length
global string_ord
global string_substring
global string_parseInt
global main
global check
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

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 776
		push		r14
		push		r9
		push		r11
		push		r13
		push		r8
		push		r10
		push		r15
		push		r12
		call	getInt
		mov		r10, rax
		mov		qword [rbp-8], r10
		mov		qword [rbp-16], 0
		mov		qword [rbp-24], 0
		mov		qword [rbp-32], 0
		mov		qword [rbp-40], 0
		mov		r10, qword [rbp-8]
		sub		r10, 1
		mov		qword [rbp-48], r10
		mov		r10, qword [rbp-8]
		sub		r10, 1
		mov		r9, r10
		mov		qword [rbp-56], 0
		mov		r10, 0
		mov		qword [rbp-64], 0
		mov		qword [rbp-72], 0
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-80], rsi
		mov		rdi, qword [rbp-80]
		mov		rsi, qword [rbp-8]
		imul		rdi, rsi
		mov		qword [rbp-80], rdi
		mov		rdi, qword [rbp-80]
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		push		r11
		push		r10
		push		r9
		push		r8
		mov		r10, rax
		mov		rdi, qword [rbp-80]
		mov		qword [rax+0], rdi
		mov		qword [rbp-88], 0
		jmp		loop_cond_0
loop_body_0:
		inc		qword [rbp-88]
loop_cond_0:
		mov		rsi, qword [rbp-80]
		cmp		qword [rbp-88], rsi
		jl		loop_body_0
loop_end_0:
		mov		qword [rbp-96], r10
		mov		qword [rbp-104], 0
		jmp		loop_cond_1
loop_body_1:
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-104]
		mov		qword [rbx+rcx*8+8], 0
		mov		r10, qword [rbp-104]
		inc		qword [rbp-104]
loop_cond_1:
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-112], rsi
		mov		rdi, qword [rbp-112]
		mov		rsi, qword [rbp-8]
		imul		rdi, rsi
		mov		qword [rbp-112], rdi
		mov		rsi, qword [rbp-112]
		cmp		qword [rbp-104], rsi
		jl		loop_body_1
		jge		loop_end_1
loop_end_1:
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-120], rsi
		mov		rdi, qword [rbp-120]
		mov		rsi, qword [rbp-8]
		imul		rdi, rsi
		mov		qword [rbp-120], rdi
		mov		rdi, qword [rbp-120]
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		push		r11
		push		r10
		push		r9
		push		r8
		mov		r10, rax
		mov		rdi, qword [rbp-120]
		mov		qword [rax+0], rdi
		mov		qword [rbp-128], 0
		jmp		loop_cond_2
loop_body_2:
		inc		qword [rbp-128]
loop_cond_2:
		mov		rsi, qword [rbp-120]
		cmp		qword [rbp-128], rsi
		jl		loop_body_2
loop_end_2:
		mov		qword [rbp-136], r10
		mov		qword [rbp-104], 0
		jmp		loop_cond_3
loop_body_3:
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-104]
		mov		qword [rbx+rcx*8+8], 0
		mov		r10, qword [rbp-104]
		inc		qword [rbp-104]
loop_cond_3:
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-144], rsi
		mov		rdi, qword [rbp-144]
		mov		rsi, qword [rbp-8]
		imul		rdi, rsi
		mov		qword [rbp-144], rdi
		mov		rsi, qword [rbp-144]
		cmp		qword [rbp-104], rsi
		jl		loop_body_3
		jge		loop_end_3
loop_end_3:
		mov		rdi, qword [rbp-8]
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		push		r11
		push		r10
		push		r9
		push		r8
		mov		qword [rbp-152], rax
		mov		rdi, qword [rbp-8]
		mov		qword [rax+0], rdi
		mov		r10, 0
		jmp		loop_cond_4
loop_body_4:
		inc		r10
loop_cond_4:
		mov		rsi, qword [rbp-8]
		cmp		r10, rsi
		jl		loop_body_4
loop_end_4:
		mov		rsi, qword [rbp-152]
		mov		qword [rbp-160], rsi
		mov		qword [rbp-104], 0
		jmp		loop_cond_5
loop_body_5:
		mov		rdi, qword [rbp-8]
		inc		rdi
		imul		rdi, 8
		push		r8
		push		r9
		push		r10
		push		r11
		mov		rdi, rdi
		call	malloc
		push		r11
		push		r10
		push		r9
		push		r8
		mov		qword [rbp-168], rax
		mov		rdi, qword [rbp-8]
		mov		qword [rax+0], rdi
		mov		r10, 0
		jmp		loop_cond_6
loop_body_6:
		inc		r10
loop_cond_6:
		mov		rsi, qword [rbp-8]
		cmp		r10, rsi
		jl		loop_body_6
loop_end_6:
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-104]
		mov		rsi, qword [rbp-168]
		mov		qword [rbx+rcx*8+8], rsi
		mov		r10, 0
		jmp		loop_cond_7
loop_body_7:
		mov		qword [rbp-176], 1
		neg		qword [rbp-176]
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-104]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-184], rsi
		mov		rbx, qword [rbp-184]
		mov		rcx, r10
		mov		rsi, qword [rbp-176]
		mov		qword [rbx+rcx*8+8], rsi
		mov		qword [rbp-192], r10
		inc		r10
loop_cond_7:
		mov		rsi, qword [rbp-8]
		cmp		r10, rsi
		jl		loop_body_7
		jge		loop_end_7
loop_end_7:
		mov		r10, qword [rbp-104]
		inc		qword [rbp-104]
loop_cond_5:
		mov		rsi, qword [rbp-8]
		cmp		qword [rbp-104], rsi
		jl		loop_body_5
		jge		loop_end_5
loop_end_5:
		mov		rbx, qword [rbp-96]
		mov		rcx, 0
		mov		rsi, qword [rbp-32]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, 0
		mov		rsi, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-32]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-200], rsi
		mov		rbx, qword [rbp-200]
		mov		rcx, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], 0
		jmp		loop_cond_8
loop_body_8:
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-208], rsi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-208]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-216], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-224], rsi
		mov		rbx, qword [rbp-216]
		mov		rcx, qword [rbp-224]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-64], rsi
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-232], rsi
		mov		rdi, qword [rbp-232]
		sub		rdi, 1
		mov		qword [rbp-232], rdi
		mov		rsi, qword [rbp-232]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-240], rsi
		mov		rdi, qword [rbp-240]
		sub		rdi, 2
		mov		qword [rbp-240], rdi
		mov		r10, qword [rbp-240]
		mov		rdi, qword [rbp-56]
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-248], rax
		cmp		qword [rbp-248], 0
		jnz		short_mid_1
		jz		if_false_0
short_mid_1:
		mov		rdi, r10
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-256], rax
		cmp		qword [rbp-256], 0
		jnz		short_mid_0
		jz		if_false_0
short_mid_0:
		mov		qword [rbp-264], 1
		neg		qword [rbp-264]
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-272], rsi
		mov		rbx, qword [rbp-272]
		mov		rcx, r10
		mov		rsi, qword [rbp-264]
		cmp		qword [rbx+rcx*8+8], rsi
		je		if_true_0
		jne		if_false_0
if_true_0:
		mov		rsi, qword [rbp-24]
		mov		qword [rbp-280], rsi
		mov		rdi, qword [rbp-280]
		add		rdi, 1
		mov		qword [rbp-280], rdi
		mov		rsi, qword [rbp-280]
		mov		qword [rbp-24], rsi
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-24]
		mov		qword [rbx+rcx*8+8], r10
		mov		rsi, qword [rbp-64]
		mov		qword [rbp-288], rsi
		mov		rdi, qword [rbp-288]
		add		rdi, 1
		mov		qword [rbp-288], rdi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-296], rsi
		mov		rbx, qword [rbp-296]
		mov		rcx, r10
		mov		rsi, qword [rbp-288]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-48]
		cmp		qword [rbp-56], rsi
		je		short_mid_2
		jne		if_false_1
short_mid_2:
		cmp		r10, r9
		je		if_true_1
		jne		if_false_1
if_true_1:
		mov		qword [rbp-72], 1
		jmp		if_end_1
if_false_1:
		nop
if_end_1:
		jmp		if_end_0
if_false_0:
		nop
if_end_0:
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-304], rsi
		mov		rdi, qword [rbp-304]
		sub		rdi, 1
		mov		qword [rbp-304], rdi
		mov		rsi, qword [rbp-304]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-312], rsi
		mov		rdi, qword [rbp-312]
		add		rdi, 2
		mov		qword [rbp-312], rdi
		mov		r10, qword [rbp-312]
		mov		rdi, qword [rbp-56]
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-320], rax
		cmp		qword [rbp-320], 0
		jnz		short_mid_4
		jz		if_false_2
short_mid_4:
		mov		rdi, r10
		mov		rsi, qword [rbp-8]
		call	check
		mov		r15, rax
		cmp		r15, 0
		jnz		short_mid_3
		jz		if_false_2
short_mid_3:
		mov		qword [rbp-328], 1
		neg		qword [rbp-328]
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-336], rsi
		mov		rbx, qword [rbp-336]
		mov		rcx, r10
		mov		rsi, qword [rbp-328]
		cmp		qword [rbx+rcx*8+8], rsi
		je		if_true_2
		jne		if_false_2
if_true_2:
		mov		rsi, qword [rbp-24]
		mov		qword [rbp-344], rsi
		mov		rdi, qword [rbp-344]
		add		rdi, 1
		mov		qword [rbp-344], rdi
		mov		rsi, qword [rbp-344]
		mov		qword [rbp-24], rsi
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-24]
		mov		qword [rbx+rcx*8+8], r10
		mov		rsi, qword [rbp-64]
		mov		qword [rbp-352], rsi
		mov		rdi, qword [rbp-352]
		add		rdi, 1
		mov		qword [rbp-352], rdi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-360], rsi
		mov		rbx, qword [rbp-360]
		mov		rcx, r10
		mov		rsi, qword [rbp-352]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-48]
		cmp		qword [rbp-56], rsi
		je		short_mid_5
		jne		if_false_3
short_mid_5:
		cmp		r10, r9
		je		if_true_3
		jne		if_false_3
if_true_3:
		mov		qword [rbp-72], 1
		jmp		if_end_3
if_false_3:
		nop
if_end_3:
		jmp		if_end_2
if_false_2:
		nop
if_end_2:
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-368], rsi
		mov		rdi, qword [rbp-368]
		add		rdi, 1
		mov		qword [rbp-368], rdi
		mov		rsi, qword [rbp-368]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-376], rsi
		mov		rdi, qword [rbp-376]
		sub		rdi, 2
		mov		qword [rbp-376], rdi
		mov		r10, qword [rbp-376]
		mov		rdi, qword [rbp-56]
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-384], rax
		cmp		qword [rbp-384], 0
		jnz		short_mid_7
		jz		if_false_4
short_mid_7:
		mov		rdi, r10
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-392], rax
		cmp		qword [rbp-392], 0
		jnz		short_mid_6
		jz		if_false_4
short_mid_6:
		mov		qword [rbp-400], 1
		neg		qword [rbp-400]
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-408], rsi
		mov		rbx, qword [rbp-408]
		mov		rcx, r10
		mov		rsi, qword [rbp-400]
		cmp		qword [rbx+rcx*8+8], rsi
		je		if_true_4
		jne		if_false_4
if_true_4:
		mov		rsi, qword [rbp-24]
		mov		qword [rbp-416], rsi
		mov		rdi, qword [rbp-416]
		add		rdi, 1
		mov		qword [rbp-416], rdi
		mov		rsi, qword [rbp-416]
		mov		qword [rbp-24], rsi
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-24]
		mov		qword [rbx+rcx*8+8], r10
		mov		rsi, qword [rbp-64]
		mov		qword [rbp-424], rsi
		mov		rdi, qword [rbp-424]
		add		rdi, 1
		mov		qword [rbp-424], rdi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-432], rsi
		mov		rbx, qword [rbp-432]
		mov		rcx, r10
		mov		rsi, qword [rbp-424]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-48]
		cmp		qword [rbp-56], rsi
		je		short_mid_8
		jne		if_false_5
short_mid_8:
		cmp		r10, r9
		je		if_true_5
		jne		if_false_5
if_true_5:
		mov		qword [rbp-72], 1
		jmp		if_end_5
if_false_5:
		nop
if_end_5:
		jmp		if_end_4
if_false_4:
		nop
if_end_4:
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-440], rsi
		mov		rdi, qword [rbp-440]
		add		rdi, 1
		mov		qword [rbp-440], rdi
		mov		rsi, qword [rbp-440]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-448], rsi
		mov		rdi, qword [rbp-448]
		add		rdi, 2
		mov		qword [rbp-448], rdi
		mov		r10, qword [rbp-448]
		mov		rdi, qword [rbp-56]
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-456], rax
		cmp		qword [rbp-456], 0
		jnz		short_mid_10
		jz		if_false_6
short_mid_10:
		mov		rdi, r10
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-464], rax
		cmp		qword [rbp-464], 0
		jnz		short_mid_9
		jz		if_false_6
short_mid_9:
		mov		qword [rbp-472], 1
		neg		qword [rbp-472]
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-480], rsi
		mov		rbx, qword [rbp-480]
		mov		rcx, r10
		mov		rsi, qword [rbp-472]
		cmp		qword [rbx+rcx*8+8], rsi
		je		if_true_6
		jne		if_false_6
if_true_6:
		mov		rsi, qword [rbp-24]
		mov		qword [rbp-488], rsi
		mov		rdi, qword [rbp-488]
		add		rdi, 1
		mov		qword [rbp-488], rdi
		mov		rsi, qword [rbp-488]
		mov		qword [rbp-24], rsi
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-24]
		mov		qword [rbx+rcx*8+8], r10
		mov		rsi, qword [rbp-64]
		mov		qword [rbp-496], rsi
		mov		rdi, qword [rbp-496]
		add		rdi, 1
		mov		qword [rbp-496], rdi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-504], rsi
		mov		rbx, qword [rbp-504]
		mov		rcx, r10
		mov		rsi, qword [rbp-496]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-48]
		cmp		qword [rbp-56], rsi
		je		short_mid_11
		jne		if_false_7
short_mid_11:
		cmp		r10, r9
		je		if_true_7
		jne		if_false_7
if_true_7:
		mov		qword [rbp-72], 1
		jmp		if_end_7
if_false_7:
		nop
if_end_7:
		jmp		if_end_6
if_false_6:
		nop
if_end_6:
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-512], rsi
		mov		rdi, qword [rbp-512]
		sub		rdi, 2
		mov		qword [rbp-512], rdi
		mov		rsi, qword [rbp-512]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-520], rsi
		mov		rdi, qword [rbp-520]
		sub		rdi, 1
		mov		qword [rbp-520], rdi
		mov		r10, qword [rbp-520]
		mov		rdi, qword [rbp-56]
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-528], rax
		cmp		qword [rbp-528], 0
		jnz		short_mid_13
		jz		if_false_8
short_mid_13:
		mov		rdi, r10
		mov		rsi, qword [rbp-8]
		call	check
		mov		r14, rax
		cmp		r14, 0
		jnz		short_mid_12
		jz		if_false_8
short_mid_12:
		mov		qword [rbp-536], 1
		neg		qword [rbp-536]
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-544], rsi
		mov		rbx, qword [rbp-544]
		mov		rcx, r10
		mov		rsi, qword [rbp-536]
		cmp		qword [rbx+rcx*8+8], rsi
		je		if_true_8
		jne		if_false_8
if_true_8:
		mov		r8, qword [rbp-24]
		add		r8, 1
		mov		qword [rbp-24], r8
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-24]
		mov		qword [rbx+rcx*8+8], r10
		mov		rsi, qword [rbp-64]
		mov		qword [rbp-552], rsi
		mov		rdi, qword [rbp-552]
		add		rdi, 1
		mov		qword [rbp-552], rdi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-560], rsi
		mov		rbx, qword [rbp-560]
		mov		rcx, r10
		mov		rsi, qword [rbp-552]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-48]
		cmp		qword [rbp-56], rsi
		je		short_mid_14
		jne		if_false_9
short_mid_14:
		cmp		r10, r9
		je		if_true_9
		jne		if_false_9
if_true_9:
		mov		qword [rbp-72], 1
		jmp		if_end_9
if_false_9:
		nop
if_end_9:
		jmp		if_end_8
if_false_8:
		nop
if_end_8:
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-568], rsi
		mov		rdi, qword [rbp-568]
		sub		rdi, 2
		mov		qword [rbp-568], rdi
		mov		rsi, qword [rbp-568]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-576], rsi
		mov		rdi, qword [rbp-576]
		add		rdi, 1
		mov		qword [rbp-576], rdi
		mov		r10, qword [rbp-576]
		mov		rdi, qword [rbp-56]
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-584], rax
		cmp		qword [rbp-584], 0
		jnz		short_mid_16
		jz		if_false_10
short_mid_16:
		mov		rdi, r10
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-592], rax
		cmp		qword [rbp-592], 0
		jnz		short_mid_15
		jz		if_false_10
short_mid_15:
		mov		qword [rbp-600], 1
		neg		qword [rbp-600]
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-608], rsi
		mov		rbx, qword [rbp-608]
		mov		rcx, r10
		mov		rsi, qword [rbp-600]
		cmp		qword [rbx+rcx*8+8], rsi
		je		if_true_10
		jne		if_false_10
if_true_10:
		mov		rsi, qword [rbp-24]
		mov		qword [rbp-616], rsi
		mov		rdi, qword [rbp-616]
		add		rdi, 1
		mov		qword [rbp-616], rdi
		mov		rsi, qword [rbp-616]
		mov		qword [rbp-24], rsi
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-24]
		mov		qword [rbx+rcx*8+8], r10
		mov		rsi, qword [rbp-64]
		mov		qword [rbp-624], rsi
		mov		rdi, qword [rbp-624]
		add		rdi, 1
		mov		qword [rbp-624], rdi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-632], rsi
		mov		rbx, qword [rbp-632]
		mov		rcx, r10
		mov		rsi, qword [rbp-624]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-48]
		cmp		qword [rbp-56], rsi
		je		short_mid_17
		jne		if_false_11
short_mid_17:
		cmp		r10, r9
		je		if_true_11
		jne		if_false_11
if_true_11:
		mov		qword [rbp-72], 1
		jmp		if_end_11
if_false_11:
		nop
if_end_11:
		jmp		if_end_10
if_false_10:
		nop
if_end_10:
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-640], rsi
		mov		rdi, qword [rbp-640]
		add		rdi, 2
		mov		qword [rbp-640], rdi
		mov		rsi, qword [rbp-640]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-648], rsi
		mov		rdi, qword [rbp-648]
		sub		rdi, 1
		mov		qword [rbp-648], rdi
		mov		r10, qword [rbp-648]
		mov		rdi, qword [rbp-56]
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-656], rax
		cmp		qword [rbp-656], 0
		jnz		short_mid_19
		jz		if_false_12
short_mid_19:
		mov		rdi, r10
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-664], rax
		cmp		qword [rbp-664], 0
		jnz		short_mid_18
		jz		if_false_12
short_mid_18:
		mov		r12, 1
		neg		r12
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-672], rsi
		mov		rbx, qword [rbp-672]
		mov		rcx, r10
		cmp		qword [rbx+rcx*8+8], r12
		je		if_true_12
		jne		if_false_12
if_true_12:
		mov		rsi, qword [rbp-24]
		mov		qword [rbp-680], rsi
		mov		rdi, qword [rbp-680]
		add		rdi, 1
		mov		qword [rbp-680], rdi
		mov		rsi, qword [rbp-680]
		mov		qword [rbp-24], rsi
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-24]
		mov		qword [rbx+rcx*8+8], r10
		mov		rsi, qword [rbp-64]
		mov		qword [rbp-688], rsi
		mov		rdi, qword [rbp-688]
		add		rdi, 1
		mov		qword [rbp-688], rdi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-696], rsi
		mov		rbx, qword [rbp-696]
		mov		rcx, r10
		mov		rsi, qword [rbp-688]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-48]
		cmp		qword [rbp-56], rsi
		je		short_mid_20
		jne		if_false_13
short_mid_20:
		cmp		r10, r9
		je		if_true_13
		jne		if_false_13
if_true_13:
		mov		qword [rbp-72], 1
		jmp		if_end_13
if_false_13:
		nop
if_end_13:
		jmp		if_end_12
if_false_12:
		nop
if_end_12:
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-704], rsi
		mov		rdi, qword [rbp-704]
		add		rdi, 2
		mov		qword [rbp-704], rdi
		mov		rsi, qword [rbp-704]
		mov		qword [rbp-56], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-16]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-712], rsi
		mov		rdi, qword [rbp-712]
		add		rdi, 1
		mov		qword [rbp-712], rdi
		mov		r10, qword [rbp-712]
		mov		rdi, qword [rbp-56]
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-720], rax
		cmp		qword [rbp-720], 0
		jnz		short_mid_22
		jz		if_false_14
short_mid_22:
		mov		rdi, r10
		mov		rsi, qword [rbp-8]
		call	check
		mov		qword [rbp-728], rax
		cmp		qword [rbp-728], 0
		jnz		short_mid_21
		jz		if_false_14
short_mid_21:
		mov		r13, 1
		neg		r13
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-736], rsi
		mov		rbx, qword [rbp-736]
		mov		rcx, r10
		cmp		qword [rbx+rcx*8+8], r13
		je		if_true_14
		jne		if_false_14
if_true_14:
		mov		r11, qword [rbp-24]
		add		r11, 1
		mov		qword [rbp-24], r11
		mov		rbx, qword [rbp-96]
		mov		rcx, qword [rbp-24]
		mov		rsi, qword [rbp-56]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rbp-136]
		mov		rcx, qword [rbp-24]
		mov		qword [rbx+rcx*8+8], r10
		mov		rsi, qword [rbp-64]
		mov		qword [rbp-744], rsi
		mov		rdi, qword [rbp-744]
		add		rdi, 1
		mov		qword [rbp-744], rdi
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-56]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-752], rsi
		mov		rbx, qword [rbp-752]
		mov		rcx, r10
		mov		rsi, qword [rbp-744]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-48]
		cmp		qword [rbp-56], rsi
		je		short_mid_23
		jne		if_false_15
short_mid_23:
		cmp		r10, r9
		je		if_true_15
		jne		if_false_15
if_true_15:
		mov		qword [rbp-72], 1
		jmp		if_end_15
if_false_15:
		nop
if_end_15:
		jmp		if_end_14
if_false_14:
		nop
if_end_14:
		cmp		qword [rbp-72], 1
		je		if_true_16
		jne		if_false_16
if_true_16:
		jmp		loop_end_8
		jmp		if_end_16
if_false_16:
		nop
if_end_16:
		mov		rsi, qword [rbp-16]
		mov		qword [rbp-760], rsi
		mov		rdi, qword [rbp-760]
		add		rdi, 1
		mov		qword [rbp-760], rdi
		mov		rsi, qword [rbp-760]
		mov		qword [rbp-16], rsi
loop_cond_8:
		mov		rsi, qword [rbp-24]
		cmp		qword [rbp-16], rsi
		jle		loop_body_8
		jg		loop_end_8
loop_end_8:
		cmp		qword [rbp-72], 1
		je		if_true_17
		jne		if_false_17
if_true_17:
		mov		rbx, qword [rbp-160]
		mov		rcx, qword [rbp-48]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-768], rsi
		mov		rbx, qword [rbp-768]
		mov		rcx, r9
		mov		rdi, qword [rbx+rcx*8+8]
		call	toString
		mov		qword [rbp-776], rax
		mov		rdi, qword [rbp-776]
		call	println
		mov		r15, rax
		jmp		if_end_17
if_false_17:
		mov		rdi, str_const_0
		call	print
		mov		r15, rax
if_end_17:
		mov		rax, 0
		pop		r12
		pop		r15
		pop		r10
		pop		r8
		pop		r13
		pop		r11
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret
		pop		r12
		pop		r15
		pop		r10
		pop		r8
		pop		r13
		pop		r11
		pop		r9
		pop		r14
		mov		rsp, rbp
		pop		rbp
		ret

check:
check_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		push		r14
		push		r15
		mov		r15, rdi
		mov		r14, rsi
		cmp		r15, r14
		jl		short_mid_25
		jge		short_false_24
short_mid_25:
		cmp		r15, 0
		jge		short_true_24
		jl		short_false_24
short_true_24:
		mov		r15, 1
		jmp		short_end_24
short_false_24:
		mov		r15, 0
short_end_24:
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

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

	dq	13
str_const_0:
	db	110, 111, 32, 115, 111, 108, 117, 116, 105, 111, 110, 33, 10, 0

intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
