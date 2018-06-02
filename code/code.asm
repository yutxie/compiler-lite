default rel

global string_length
global string_ord
global string_substring
global string_parseInt
global main
global origin
global getPrime
global getResult
global printF
global print
global toString
global addString__
global println
global getInt
global getString

global _global_N
global _global_M
global _global_i
global _global_j
global _global_primeCount
global _global_resultCount
global _global_b
global _global_prime
global _global_gps
global _global_tmp
global _global_result

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

main:
main_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 240
		mov		r8, 1001
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
		mov		qword [rbp-8], rax
		mov		r8, 1001
		mov		qword [rax+0], r8
		mov		r13, 0
		jmp		loop_cond_0
loop_body_0:
		inc		r13
loop_cond_0:
		cmp		r13, 1001
		jl		loop_body_0
loop_end_0:
		mov		r9, qword [rbp-8]
		mov		qword [rel _global_b], r9
		mov		r8, 170
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
		mov		qword [rbp-16], rax
		mov		r8, 170
		mov		qword [rax+0], r8
		mov		r13, 0
		jmp		loop_cond_1
loop_body_1:
		inc		r13
loop_cond_1:
		cmp		r13, 170
		jl		loop_body_1
loop_end_1:
		mov		r9, qword [rbp-16]
		mov		qword [rel _global_prime], r9
		mov		r8, 1001
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
		mov		qword [rbp-24], rax
		mov		r8, 1001
		mov		qword [rax+0], r8
		mov		r13, 0
		jmp		loop_cond_2
loop_body_2:
		inc		r13
loop_cond_2:
		cmp		r13, 1001
		jl		loop_body_2
loop_end_2:
		mov		r9, qword [rbp-24]
		mov		qword [rel _global_gps], r9
		mov		r8, 1
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
		mov		r13, rax
		mov		r8, 1
		mov		qword [rax+0], r8
		mov		qword [rbp-32], 0
		jmp		loop_cond_3
loop_body_3:
		inc		qword [rbp-32]
loop_cond_3:
		cmp		qword [rbp-32], 1
		jl		loop_body_3
loop_end_3:
		mov		qword [rel _global_tmp], r13
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
		mov		rdi, 170
		call	origin
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
		mov		qword [rel _global_N], 1000
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
		call	getInt
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
		mov		qword [rbp-40], rax
		mov		r9, qword [rbp-40]
		mov		qword [rel _global_M], r9
		mov		qword [rel _global_primeCount], 0
		mov		qword [rel _global_resultCount], 0
		mov		rbx, qword [rel _global_tmp]
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], 0
		mov		qword [rel _global_i], 0
		jmp		loop_cond_4
loop_body_4:
		mov		rbx, qword [rel _global_b]
		mov		rcx, qword [rel _global_i]
		mov		qword [rbx+rcx*8+8], 1
		mov		rbx, qword [rel _global_gps]
		mov		rcx, qword [rel _global_i]
		mov		qword [rbx+rcx*8+8], 0
		mov		r12, qword [rel _global_i]
		add		r12, 1
		mov		qword [rel _global_i], r12
loop_cond_4:
		mov		r9, qword [rel _global_N]
		mov		qword [rbp-48], r9
		mov		r8, qword [rbp-48]
		add		r8, 1
		mov		qword [rbp-48], r8
		mov		r9, qword [rbp-48]
		cmp		qword [rel _global_i], r9
		jl		loop_body_4
		jge		loop_end_4
loop_end_4:
		mov		qword [rel _global_i], 0
		jmp		loop_cond_5
loop_body_5:
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rel _global_i]
		mov		qword [rbx+rcx*8+8], 0
		mov		r9, qword [rel _global_i]
		mov		qword [rbp-56], r9
		mov		r8, qword [rbp-56]
		add		r8, 1
		mov		qword [rbp-56], r8
		mov		r9, qword [rbp-56]
		mov		qword [rel _global_i], r9
loop_cond_5:
		mov		r11, qword [rel _global_M]
		add		r11, 1
		cmp		qword [rel _global_i], r11
		jl		loop_body_5
		jge		loop_end_5
loop_end_5:
		mov		qword [rel _global_i], 0
		jmp		loop_cond_6
loop_body_6:
		mov		qword [rel _global_j], 0
		jmp		loop_cond_7
loop_body_7:
		mov		qword [rbp-64], 1
		neg		qword [rbp-64]
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rel _global_i]
		mov		r9, qword [rbx+rcx*8+8]
		mov		qword [rbp-72], r9
		mov		rbx, qword [rbp-72]
		mov		rcx, qword [rel _global_j]
		mov		r9, qword [rbp-64]
		mov		qword [rbx+rcx*8+8], r9
		mov		r9, qword [rel _global_j]
		mov		qword [rbp-80], r9
		mov		r8, qword [rbp-80]
		add		r8, 1
		mov		qword [rbp-80], r8
		mov		r9, qword [rbp-80]
		mov		qword [rel _global_j], r9
loop_cond_7:
		mov		r9, qword [rel _global_M]
		cmp		qword [rel _global_j], r9
		jle		loop_body_7
		jg		loop_end_7
loop_end_7:
		mov		r9, qword [rel _global_i]
		mov		qword [rbp-88], r9
		mov		r8, qword [rbp-88]
		add		r8, 1
		mov		qword [rbp-88], r8
		mov		r9, qword [rbp-88]
		mov		qword [rel _global_i], r9
loop_cond_6:
		mov		r9, qword [rel _global_M]
		cmp		qword [rel _global_i], r9
		jle		loop_body_6
		jg		loop_end_6
loop_end_6:
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
		mov		rdi, qword [rel _global_N]
		call	getPrime
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
		mov		rbx, qword [rel _global_tmp]
		mov		rcx, 0
		mov		r8, qword [rbx+rcx*8+8]
		mov		qword [rel _global_primeCount], r8
		mov		qword [rel _global_i], 1
		jmp		loop_cond_8
loop_body_8:
		mov		r9, qword [rel _global_i]
		mov		qword [rbp-96], r9
		mov		r8, qword [rbp-96]
		add		r8, 1
		mov		qword [rbp-96], r8
		mov		r9, qword [rbp-96]
		mov		qword [rel _global_j], r9
		jmp		loop_cond_9
loop_body_9:
		mov		qword [rbp-104], 1
		neg		qword [rbp-104]
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rel _global_i]
		mov		r9, qword [rbx+rcx*8+8]
		mov		r10, r9
		mov		rbx, r10
		mov		rcx, qword [rel _global_j]
		mov		r8, qword [rbx+rcx*8+8]
		mov		r9, qword [rbp-104]
		cmp		r8, r9
		je		if_true_0
		jne		if_false_0
if_true_0:
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
		mov		rdi, qword [rel _global_N]
		mov		rsi, qword [rel _global_i]
		mov		rdx, qword [rel _global_j]
		call	getResult
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
		mov		qword [rbp-112], rax
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rel _global_i]
		mov		r9, qword [rbx+rcx*8+8]
		mov		qword [rbp-120], r9
		mov		rbx, qword [rbp-120]
		mov		rcx, qword [rel _global_j]
		mov		r9, qword [rbp-112]
		mov		qword [rbx+rcx*8+8], r9
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rel _global_i]
		mov		r8, qword [rbx+rcx*8+8]
		mov		qword [rbp-128], r8
		mov		rbx, qword [rbp-128]
		mov		rcx, qword [rel _global_j]
		mov		r9, qword [rbx+rcx*8+8]
		cmp		r9, 1
		jg		if_true_1
		jle		if_false_1
if_true_1:
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rel _global_i]
		mov		r8, qword [rbx+rcx*8+8]
		mov		r14, r8
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rel _global_i]
		mov		r9, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rel _global_j]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, qword [rel _global_j]
		mov		r9, qword [rbx+rcx*8+8]
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
		mov		rdi, r9
		mov		rsi, r8
		mov		rdx, r9
		call	printF
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
		mov		r9, qword [rel _global_resultCount]
		mov		qword [rbp-136], r9
		mov		r8, qword [rbp-136]
		add		r8, 1
		mov		qword [rbp-136], r8
		mov		r9, qword [rbp-136]
		mov		qword [rel _global_resultCount], r9
		jmp		if_end_1
if_false_1:
		nop
if_end_1:
		jmp		if_end_0
if_false_0:
		nop
if_end_0:
		mov		r15, qword [rel _global_j]
		add		r15, 1
		mov		qword [rel _global_j], r15
loop_cond_9:
		mov		r9, qword [rel _global_primeCount]
		cmp		qword [rel _global_j], r9
		jle		loop_body_9
		jg		loop_end_9
loop_end_9:
		mov		r9, qword [rel _global_i]
		mov		qword [rbp-144], r9
		mov		r8, qword [rbp-144]
		add		r8, 1
		mov		qword [rbp-144], r8
		mov		r9, qword [rbp-144]
		mov		qword [rel _global_i], r9
loop_cond_8:
		mov		r9, qword [rel _global_primeCount]
		cmp		qword [rel _global_i], r9
		jl		loop_body_8
		jge		loop_end_8
loop_end_8:
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
		call	print
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
		mov		rdi, qword [rel _global_resultCount]
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
		mov		qword [rbp-152], rax
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
		mov		rdi, qword [rbp-152]
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
		mov		rax, 0
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

origin:
origin_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 88
		mov		r13, rdi
		mov		r8, r13
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
		mov		r12, rax
		mov		r8, r13
		mov		qword [rax+0], r8
		mov		r14, 0
		jmp		loop_cond_10
loop_body_10:
		inc		r14
loop_cond_10:
		cmp		r14, r13
		jl		loop_body_10
loop_end_10:
		mov		qword [rel _global_result], r12
		mov		qword [rel _global_i], 0
		jmp		loop_cond_11
loop_body_11:
		mov		r8, r13
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
		mov		r12, rax
		mov		r8, r13
		mov		qword [rax+0], r8
		mov		r14, 0
		jmp		loop_cond_12
loop_body_12:
		inc		r14
loop_cond_12:
		cmp		r14, r13
		jl		loop_body_12
loop_end_12:
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rel _global_i]
		mov		qword [rbx+rcx*8+8], r12
		mov		qword [rel _global_j], 0
		jmp		loop_cond_13
loop_body_13:
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rel _global_i]
		mov		r9, qword [rbx+rcx*8+8]
		mov		r15, r9
		mov		rbx, r15
		mov		rcx, qword [rel _global_j]
		mov		qword [rbx+rcx*8+8], 0
		mov		r14, qword [rel _global_j]
		inc		qword [rel _global_j]
loop_cond_13:
		cmp		qword [rel _global_j], r13
		jl		loop_body_13
		jge		loop_end_13
loop_end_13:
		mov		r14, qword [rel _global_i]
		inc		qword [rel _global_i]
loop_cond_11:
		cmp		qword [rel _global_i], r13
		jl		loop_body_11
		jge		loop_end_11
loop_end_11:
		mov		rsp, rbp
		pop		rbp
		ret

getPrime:
getPrime_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 120
		mov		qword [rbp-8], rdi
		mov		r12, 2
		mov		r10, 2
		jmp		loop_cond_14
loop_body_14:
		mov		rbx, qword [rel _global_b]
		mov		rcx, r10
		mov		r9, qword [rbx+rcx*8+8]
		cmp		r9, 1
		je		if_true_2
		jne		if_false_2
if_true_2:
		mov		rbx, qword [rel _global_tmp]
		mov		rcx, 0
		mov		r8, qword [rbx+rcx*8+8]
		mov		r14, r8
		add		r14, 1
		mov		rbx, qword [rel _global_tmp]
		mov		rcx, 0
		mov		qword [rbx+rcx*8+8], r14
		mov		rbx, qword [rel _global_tmp]
		mov		rcx, 0
		mov		r9, qword [rbx+rcx*8+8]
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
		mov		rdi, r9
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
		mov		r13, rax
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
		mov		r11, rax
		mov		rbx, qword [rel _global_tmp]
		mov		rcx, 0
		mov		r8, qword [rbx+rcx*8+8]
		mov		r11, r8
		mov		rbx, qword [rel _global_prime]
		mov		rcx, r11
		mov		qword [rbx+rcx*8+8], r10
		mov		rbx, qword [rel _global_tmp]
		mov		rcx, 0
		mov		r9, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_gps]
		mov		rcx, r10
		mov		qword [rbx+rcx*8+8], r9
		jmp		if_end_2
if_false_2:
		nop
if_end_2:
		jmp		loop_cond_15
loop_body_15:
		mov		qword [rbp-16], r10
		mov		r8, qword [rbp-16]
		imul		r8, r12
		mov		qword [rbp-16], r8
		mov		rbx, qword [rel _global_b]
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], 0
		mov		qword [rbp-24], r12
		mov		r8, qword [rbp-24]
		add		r8, 1
		mov		qword [rbp-24], r8
		mov		r12, qword [rbp-24]
loop_cond_15:
		mov		r15, r10
		imul		r15, r12
		mov		r9, qword [rbp-8]
		cmp		r15, r9
		jle		loop_body_15
		jg		loop_end_15
loop_end_15:
		mov		r12, 2
		mov		qword [rbp-32], r10
		mov		r8, qword [rbp-32]
		add		r8, 1
		mov		qword [rbp-32], r8
		mov		r10, qword [rbp-32]
loop_cond_14:
		mov		r9, qword [rbp-8]
		cmp		r10, r9
		jle		loop_body_14
		jg		loop_end_14
loop_end_14:
		mov		rsp, rbp
		pop		rbp
		ret

getResult:
getResult_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 144
		mov		r13, rdi
		mov		qword [rbp-8], rsi
		mov		qword [rbp-16], rdx
		mov		qword [rbp-24], 1
		neg		qword [rbp-24]
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rbp-8]
		mov		r9, qword [rbx+rcx*8+8]
		mov		qword [rbp-32], r9
		mov		rbx, qword [rbp-32]
		mov		rcx, qword [rbp-16]
		mov		r8, qword [rbx+rcx*8+8]
		mov		r9, qword [rbp-24]
		cmp		r8, r9
		je		if_true_3
		jne		if_false_3
if_true_3:
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rbp-16]
		mov		r9, qword [rbx+rcx*8+8]
		mov		r15, r9
		imul		r15, 2
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rbp-8]
		mov		r8, qword [rbx+rcx*8+8]
		sub		r15, r8
		cmp		r15, r13
		jle		if_true_4
		jg		if_false_4
if_true_4:
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rbp-16]
		mov		r9, qword [rbx+rcx*8+8]
		mov		r12, r9
		imul		r12, 2
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rbp-8]
		mov		r8, qword [rbx+rcx*8+8]
		sub		r12, r8
		mov		rbx, qword [rel _global_b]
		mov		rcx, r12
		mov		r9, qword [rbx+rcx*8+8]
		cmp		r9, 0
		jne		if_true_5
		je		if_false_5
if_true_5:
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rbp-16]
		mov		r8, qword [rbx+rcx*8+8]
		mov		r11, r8
		imul		r11, 2
		mov		rbx, qword [rel _global_prime]
		mov		rcx, qword [rbp-8]
		mov		r9, qword [rbx+rcx*8+8]
		sub		r11, r9
		mov		rbx, qword [rel _global_gps]
		mov		rcx, r11
		mov		r8, qword [rbx+rcx*8+8]
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
		mov		rsi, qword [rbp-16]
		mov		rdx, r8
		call	getResult
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
		mov		r11, rax
		mov		qword [rbp-40], r11
		mov		r8, qword [rbp-40]
		add		r8, 1
		mov		qword [rbp-40], r8
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rbp-8]
		mov		r9, qword [rbx+rcx*8+8]
		mov		r11, r9
		mov		rbx, r11
		mov		rcx, qword [rbp-16]
		mov		r9, qword [rbp-40]
		mov		qword [rbx+rcx*8+8], r9
		jmp		if_end_5
if_false_5:
		nop
if_end_5:
		jmp		if_end_4
if_false_4:
		nop
if_end_4:
		jmp		if_end_3
if_false_3:
		nop
if_end_3:
		mov		r10, 1
		neg		r10
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rbp-8]
		mov		r8, qword [rbx+rcx*8+8]
		mov		qword [rbp-48], r8
		mov		rbx, qword [rbp-48]
		mov		rcx, qword [rbp-16]
		mov		r9, qword [rbx+rcx*8+8]
		cmp		r9, r10
		je		if_true_6
		jne		if_false_6
if_true_6:
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rbp-8]
		mov		r8, qword [rbx+rcx*8+8]
		mov		r14, r8
		mov		rbx, r14
		mov		rcx, qword [rbp-16]
		mov		qword [rbx+rcx*8+8], 1
		jmp		if_end_6
if_false_6:
		nop
if_end_6:
		mov		rbx, qword [rel _global_result]
		mov		rcx, qword [rbp-8]
		mov		r9, qword [rbx+rcx*8+8]
		mov		qword [rbp-56], r9
		mov		rbx, qword [rbp-56]
		mov		rcx, qword [rbp-16]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rax, r8
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

printF:
printF_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 120
		mov		qword [rbp-8], rdi
		mov		r10, rsi
		mov		r13, rdx
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
		mov		rdi, qword [rbp-8]
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
		mov		r11, rax
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
		call	print
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
		mov		r11, rax
		jmp		loop_cond_16
loop_body_16:
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
		mov		rdi, str_const_1
		call	print
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
		mov		qword [rbp-16], rax
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
		mov		rdi, qword [rbp-16]
		call	print
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
		mov		r12, r10
		imul		r12, 2
		mov		qword [rbp-24], r12
		mov		r8, qword [rbp-24]
		mov		r9, qword [rbp-8]
		sub		r8, r9
		mov		qword [rbp-24], r8
		mov		r10, qword [rbp-24]
		mov		r14, qword [rbp-8]
		add		r14, r10
		mov		rax, r14
		mov		r9, 2
		cqo
		idiv		r9
		mov		qword [rbp-32], rax
		mov		r9, qword [rbp-32]
		mov		qword [rbp-8], r9
		mov		r15, r13
		sub		r15, 1
		mov		r13, r15
loop_cond_16:
		cmp		r13, 0
		jg		loop_body_16
		jle		loop_end_16
loop_end_16:
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
		mov		rdi, str_const_2
		call	print
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

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

_global_N:
		dq 0
_global_M:
		dq 0
_global_i:
		dq 0
_global_j:
		dq 0
_global_primeCount:
		dq 0
_global_resultCount:
		dq 0
_global_b:
		dq 0
_global_prime:
		dq 0
_global_gps:
		dq 0
_global_tmp:
		dq 0
_global_result:
		dq 0
	dq	7
str_const_0:
	db	84, 111, 116, 97, 108, 58, 32, 0

	dq	1
str_const_1:
	db	32, 0

	dq	1
str_const_2:
	db	10, 0

intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
