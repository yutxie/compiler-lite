default rel

global point_point
global point_set
global point_sqrLen
global point_sqrDis
global point_dot
global point_cross
global point_add
global point_sub
global point_printPoint
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
	mov rdx,rdi
	mov rax,0
	mov rdi,stringbuffer
	mov rsi,format1
	call sprintf
	mov rdi,stringbuffer
	call transtring
	mov rsp,rbp
	pop rbp
	ret

println:
	call puts
	ret

addString__:
	push rbp
	mov rbp,rsp
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
	mov rsp,rbp
	pop rbp
	ret

getInt:
	push rbp
	mov rbp,rsp
	mov rax,0
	mov rdi,format1
	mov rsi,intbuffer
	call scanf
	mov rax,[intbuffer]
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
	mov rax,0
	mov rsi,rdi
	mov rdi,format2
	call printf
	mov rsp,rbp
	pop rbp
	ret

transtring:

	push rbp
	mov rbp,rsp
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
	mov rsp,rbp
	pop rbp
	ret

getString:

	push rbp
	mov rbp,rsp
	mov rax,0
	mov rdi,format2
	mov rsi,stringbuffer
	call scanf
	mov rdi,stringbuffer
	call transtring
	mov rsp,rbp
	pop rbp
	ret

string_substring:
	push rbp
	mov rbp,rsp
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
	mov rsp,rbp
	pop rbp
	ret

string_parseInt:
	push    rbp
	mov     rbp, rsp
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

point_point:
point_point_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		r15, rdi
		mov		rbx, r15
		mov		qword [rbx+8], 0
		mov		rbx, r15
		mov		qword [rbx+16], 0
		mov		rbx, r15
		mov		qword [rbx+24], 0
		mov		rsp, rbp
		pop		rbp
		ret

point_set:
point_set_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		r14, rdi
		mov		r15, rsi
		mov		r12, rdx
		mov		r13, rcx
		mov		rbx, r14
		mov		qword [rbx+8], r15
		mov		rbx, r14
		mov		qword [rbx+16], r12
		mov		rbx, r14
		mov		qword [rbx+24], r13
		mov		rsp, rbp
		pop		rbp
		ret

point_sqrLen:
point_sqrLen_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		r15, rdi
		mov		rbx, r15
		mov		r14, qword [rbx+8]
		mov		rbx, r15
		mov		r9, qword [rbx+8]
		imul		r14, r9
		mov		rbx, r15
		mov		r13, qword [rbx+16]
		mov		rbx, r15
		mov		r9, qword [rbx+16]
		imul		r13, r9
		add		r14, r13
		mov		rbx, r15
		mov		r13, qword [rbx+24]
		mov		rbx, r15
		mov		r9, qword [rbx+24]
		imul		r13, r9
		mov		r15, r14
		add		r15, r13
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

point_sqrDis:
point_sqrDis_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		r13, rdi
		mov		r15, rsi
		mov		rbx, r13
		mov		r14, qword [rbx+8]
		mov		rbx, r15
		mov		r9, qword [rbx+8]
		sub		r14, r9
		mov		rbx, r13
		mov		r12, qword [rbx+8]
		mov		rbx, r15
		mov		r9, qword [rbx+8]
		sub		r12, r9
		imul		r14, r12
		mov		rbx, r13
		mov		r12, qword [rbx+16]
		mov		rbx, r15
		mov		r9, qword [rbx+16]
		sub		r12, r9
		mov		rbx, r13
		mov		r11, qword [rbx+16]
		mov		rbx, r15
		mov		r9, qword [rbx+16]
		sub		r11, r9
		imul		r12, r11
		add		r14, r12
		mov		rbx, r13
		mov		r12, qword [rbx+24]
		mov		rbx, r15
		mov		r9, qword [rbx+24]
		sub		r12, r9
		mov		rbx, r13
		mov		r13, qword [rbx+24]
		mov		rbx, r15
		mov		r9, qword [rbx+24]
		sub		r13, r9
		mov		r15, r12
		imul		r15, r13
		add		r14, r15
		mov		rax, r14
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

point_dot:
point_dot_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		r12, rdi
		mov		r14, rsi
		mov		rbx, r12
		mov		r13, qword [rbx+8]
		mov		rbx, r14
		mov		r9, qword [rbx+8]
		imul		r13, r9
		mov		rbx, r12
		mov		r15, qword [rbx+16]
		mov		rbx, r14
		mov		r9, qword [rbx+16]
		imul		r15, r9
		add		r13, r15
		mov		rbx, r12
		mov		r15, qword [rbx+24]
		mov		rbx, r14
		mov		r9, qword [rbx+24]
		imul		r15, r9
		mov		r14, r13
		add		r14, r15
		mov		rax, r14
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

point_cross:
point_cross_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		r10, rdi
		mov		r14, rsi
		mov		r8, 3
		inc		r8
		imul		r8, 8
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r8
		call	malloc
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		r8, 3
		mov		qword [rax+0], r8
		mov		r13, r15
		mov		rbx, r10
		mov		r15, qword [rbx+16]
		mov		rbx, r14
		mov		r9, qword [rbx+24]
		imul		r15, r9
		mov		rbx, r10
		mov		r12, qword [rbx+24]
		mov		rbx, r14
		mov		r9, qword [rbx+16]
		imul		r12, r9
		mov		r11, r15
		sub		r11, r12
		mov		rbx, r10
		mov		r12, qword [rbx+24]
		mov		rbx, r14
		mov		r9, qword [rbx+8]
		imul		r12, r9
		mov		rbx, r10
		mov		r15, qword [rbx+8]
		mov		rbx, r14
		mov		r9, qword [rbx+24]
		imul		r15, r9
		sub		r12, r15
		mov		rbx, r10
		mov		r15, qword [rbx+8]
		mov		rbx, r14
		mov		r9, qword [rbx+16]
		imul		r15, r9
		mov		rbx, r10
		mov		r10, qword [rbx+16]
		mov		rbx, r14
		mov		r9, qword [rbx+8]
		imul		r10, r9
		sub		r15, r10
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r13
		mov		rsi, r11
		mov		rdx, r12
		mov		rcx, r15
		call	point_set
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		rax, r13
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

point_add:
point_add_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		r14, rdi
		mov		r13, rsi
		mov		rbx, r14
		mov		r15, qword [rbx+8]
		mov		rbx, r13
		mov		r9, qword [rbx+8]
		add		r15, r9
		mov		rbx, r14
		mov		qword [rbx+8], r15
		mov		rbx, r14
		mov		r15, qword [rbx+16]
		mov		rbx, r13
		mov		r9, qword [rbx+16]
		add		r15, r9
		mov		rbx, r14
		mov		qword [rbx+16], r15
		mov		rbx, r14
		mov		r15, qword [rbx+24]
		mov		rbx, r13
		mov		r9, qword [rbx+24]
		add		r15, r9
		mov		rbx, r14
		mov		qword [rbx+24], r15
		mov		rax, r14
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

point_sub:
point_sub_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		r13, rdi
		mov		r14, rsi
		mov		rbx, r13
		mov		r15, qword [rbx+8]
		mov		rbx, r14
		mov		r9, qword [rbx+8]
		sub		r15, r9
		mov		rbx, r13
		mov		qword [rbx+8], r15
		mov		rbx, r13
		mov		r15, qword [rbx+16]
		mov		rbx, r14
		mov		r9, qword [rbx+16]
		sub		r15, r9
		mov		rbx, r13
		mov		qword [rbx+16], r15
		mov		rbx, r13
		mov		r15, qword [rbx+24]
		mov		rbx, r14
		mov		r9, qword [rbx+24]
		sub		r15, r9
		mov		rbx, r13
		mov		qword [rbx+24], r15
		mov		rax, r13
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

point_printPoint:
point_printPoint_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 0
		mov		r15, rdi
		mov		rbx, r15
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, qword [rbx+8]
		call	toString
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r14, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, str_const_0
		mov		rsi, r14
		call	addString__
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r14, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
		mov		rsi, str_const_1
		call	addString__
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r13, rax
		mov		rbx, r15
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, qword [rbx+16]
		call	toString
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r14, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r13
		mov		rsi, r14
		call	addString__
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r14, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
		mov		rsi, str_const_2
		call	addString__
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r14, rax
		mov		rbx, r15
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, qword [rbx+24]
		call	toString
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r15
		mov		rsi, str_const_3
		call	addString__
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		rsp, rbp
		pop		rbp
		ret

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 8
		mov		r8, 3
		inc		r8
		imul		r8, 8
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r8
		call	malloc
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		r8, 3
		mov		qword [rax+0], r8
		mov		r14, r15
		mov		r8, 3
		inc		r8
		imul		r8, 8
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r8
		call	malloc
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		r8, 3
		mov		qword [rax+0], r8
		mov		r11, r15
		mov		r8, 3
		inc		r8
		imul		r8, 8
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r8
		call	malloc
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		r8, 3
		mov		qword [rax+0], r8
		mov		r12, r15
		mov		r8, 3
		inc		r8
		imul		r8, 8
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r8
		call	malloc
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		r8, 3
		mov		qword [rax+0], r8
		mov		r10, r15
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
		call	point_printPoint
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		r15, 463
		neg		r15
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
		mov		rsi, 849
		mov		rdx, r15
		mov		rcx, 480
		call	point_set
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		r13, 208
		neg		r13
		mov		r15, 150
		neg		r15
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r11
		mov		rsi, r13
		mov		rdx, 585
		mov		rcx, r15
		call	point_set
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		r13, 670
		neg		r13
		mov		r15, 742
		neg		r15
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r12
		mov		rsi, 360
		mov		rdx, r13
		mov		rcx, r15
		call	point_set
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		r15, 29
		neg		r15
		mov		qword [rbp-8], 591
		neg		qword [rbp-8]
		mov		r13, 960
		neg		r13
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r10
		mov		rsi, r15
		mov		rdx, qword [rbp-8]
		mov		rcx, r13
		call	point_set
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
		mov		rsi, r11
		call	point_add
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		call	point_add
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r10
		mov		rsi, r12
		call	point_add
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r12
		mov		rsi, r14
		call	point_sub
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r11
		mov		rsi, r10
		call	point_sub
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r10
		mov		rsi, r12
		call	point_sub
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r12
		mov		rsi, r11
		call	point_add
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
		mov		rsi, r11
		call	point_add
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r11
		mov		rsi, r11
		call	point_add
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r12
		mov		rsi, r12
		call	point_add
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
		mov		rsi, r10
		call	point_sub
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
		mov		rsi, r11
		call	point_add
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		call	point_sub
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
		call	point_sqrLen
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r11
		call	point_sqrLen
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		call	point_sqrDis
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r10
		mov		rsi, r14
		call	point_sqrDis
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r12
		mov		rsi, r14
		call	point_dot
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
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
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r11
		mov		rsi, r10
		call	point_cross
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r15
		call	point_printPoint
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r14
		call	point_printPoint
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r11
		call	point_printPoint
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r12
		call	point_printPoint
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		push		rdi
		push		rsi
		push		rdx
		push		rcx
		push		rbx
		push		r8
		push		r9
		push		r10
		push		r11
		push		r12
		push		r13
		push		r14
		push		r15
		mov		rdi, r10
		call	point_printPoint
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		r11
		pop		r10
		pop		r9
		pop		r8
		pop		rbx
		pop		rcx
		pop		rdx
		pop		rsi
		pop		rdi
		mov		r15, rax
		mov		rax, 0
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

	dq	1
str_const_0:
	db	40, 0

	dq	2
str_const_1:
	db	44, 32, 0

	dq	2
str_const_2:
	db	44, 32, 0

	dq	1
str_const_3:
	db	41, 0

intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
