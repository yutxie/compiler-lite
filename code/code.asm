default rel

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

global _global_A
global _global_B
global _global_C

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
		sub		rsp, 6104
		mov		qword [rel _global_A], 1
		mov		qword [rel _global_B], 1
		mov		qword [rel _global_C], 1
		jmp		loop_cond_0
loop_body_0:
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-8], r9
		mov		r8, qword [rbp-8]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-8], r8
		mov		r9, qword [rbp-8]
		mov		qword [rbp-16], r9
		mov		r8, qword [rbp-16]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-16], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-24], r9
		mov		r8, qword [rbp-24]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-24], r8
		mov		r9, qword [rbp-16]
		mov		qword [rbp-32], r9
		mov		r8, qword [rbp-32]
		mov		r9, qword [rbp-24]
		sub		r8, r9
		mov		qword [rbp-32], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-40], r9
		mov		r8, qword [rbp-40]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-40], r8
		mov		r9, qword [rbp-40]
		mov		qword [rbp-48], r9
		mov		r8, qword [rbp-48]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-48], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-56], r9
		mov		r8, qword [rbp-56]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-56], r8
		mov		r9, qword [rbp-48]
		mov		qword [rbp-64], r9
		mov		r8, qword [rbp-64]
		mov		r9, qword [rbp-56]
		sub		r8, r9
		mov		qword [rbp-64], r8
		mov		r9, qword [rbp-32]
		mov		qword [rbp-72], r9
		mov		r8, qword [rbp-72]
		mov		r9, qword [rbp-64]
		add		r8, r9
		mov		qword [rbp-72], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-80], r9
		mov		r8, qword [rbp-80]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-80], r8
		mov		r9, qword [rbp-80]
		mov		qword [rbp-88], r9
		mov		r8, qword [rbp-88]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-88], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-96], r9
		mov		r8, qword [rbp-96]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-96], r8
		mov		r9, qword [rbp-88]
		mov		qword [rbp-104], r9
		mov		r8, qword [rbp-104]
		mov		r9, qword [rbp-96]
		sub		r8, r9
		mov		qword [rbp-104], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-112], r9
		mov		r8, qword [rbp-112]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-112], r8
		mov		r9, qword [rbp-112]
		mov		qword [rbp-120], r9
		mov		r8, qword [rbp-120]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-120], r8
		mov		r9, qword [rbp-104]
		mov		qword [rbp-128], r9
		mov		r8, qword [rbp-128]
		mov		r9, qword [rbp-120]
		add		r8, r9
		mov		qword [rbp-128], r8
		mov		r9, qword [rbp-72]
		mov		qword [rbp-136], r9
		mov		r8, qword [rbp-136]
		mov		r9, qword [rbp-128]
		add		r8, r9
		mov		qword [rbp-136], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-144], r9
		mov		r8, qword [rbp-144]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-144], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-152], r9
		mov		r8, qword [rbp-152]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-152], r8
		mov		r9, qword [rbp-152]
		mov		qword [rbp-160], r9
		mov		r8, qword [rbp-160]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-160], r8
		mov		r9, qword [rbp-144]
		mov		qword [rbp-168], r9
		mov		r8, qword [rbp-168]
		mov		r9, qword [rbp-160]
		add		r8, r9
		mov		qword [rbp-168], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-176], r9
		mov		r8, qword [rbp-176]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-176], r8
		mov		r9, qword [rbp-168]
		mov		qword [rbp-184], r9
		mov		r8, qword [rbp-184]
		mov		r9, qword [rbp-176]
		sub		r8, r9
		mov		qword [rbp-184], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-192], r9
		mov		r8, qword [rbp-192]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-192], r8
		mov		r9, qword [rbp-192]
		mov		qword [rbp-200], r9
		mov		r8, qword [rbp-200]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-200], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-208], r9
		mov		r8, qword [rbp-208]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-208], r8
		mov		r9, qword [rbp-200]
		mov		qword [rbp-216], r9
		mov		r8, qword [rbp-216]
		mov		r9, qword [rbp-208]
		sub		r8, r9
		mov		qword [rbp-216], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-224], r9
		mov		r8, qword [rbp-224]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-224], r8
		mov		r14, qword [rbp-224]
		mov		r9, qword [rel _global_B]
		add		r14, r9
		mov		r9, qword [rbp-216]
		mov		qword [rbp-232], r9
		mov		r8, qword [rbp-232]
		add		r8, r14
		mov		qword [rbp-232], r8
		mov		r9, qword [rbp-184]
		mov		qword [rbp-240], r9
		mov		r8, qword [rbp-240]
		mov		r9, qword [rbp-232]
		add		r8, r9
		mov		qword [rbp-240], r8
		mov		r9, qword [rbp-136]
		mov		qword [rbp-248], r9
		mov		r8, qword [rbp-248]
		mov		r9, qword [rbp-240]
		sub		r8, r9
		mov		qword [rbp-248], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-256], r9
		mov		r8, qword [rbp-256]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-256], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-264], r9
		mov		r8, qword [rbp-264]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-264], r8
		mov		r9, qword [rbp-264]
		mov		qword [rbp-272], r9
		mov		r8, qword [rbp-272]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-272], r8
		mov		r9, qword [rbp-256]
		mov		qword [rbp-280], r9
		mov		r8, qword [rbp-280]
		mov		r9, qword [rbp-272]
		add		r8, r9
		mov		qword [rbp-280], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-288], r9
		mov		r8, qword [rbp-288]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-288], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-296], r9
		mov		r8, qword [rbp-296]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-296], r8
		mov		r9, qword [rbp-296]
		mov		qword [rbp-304], r9
		mov		r8, qword [rbp-304]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-304], r8
		mov		r9, qword [rbp-288]
		mov		qword [rbp-312], r9
		mov		r8, qword [rbp-312]
		mov		r9, qword [rbp-304]
		add		r8, r9
		mov		qword [rbp-312], r8
		mov		r9, qword [rbp-280]
		mov		qword [rbp-320], r9
		mov		r8, qword [rbp-320]
		mov		r9, qword [rbp-312]
		sub		r8, r9
		mov		qword [rbp-320], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-328], r9
		mov		r8, qword [rbp-328]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-328], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-336], r9
		mov		r8, qword [rbp-336]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-336], r8
		mov		r9, qword [rbp-336]
		mov		qword [rbp-344], r9
		mov		r8, qword [rbp-344]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-344], r8
		mov		r9, qword [rbp-328]
		mov		qword [rbp-352], r9
		mov		r8, qword [rbp-352]
		mov		r9, qword [rbp-344]
		add		r8, r9
		mov		qword [rbp-352], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-360], r9
		mov		r8, qword [rbp-360]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-360], r8
		mov		r9, qword [rbp-352]
		mov		qword [rbp-368], r9
		mov		r8, qword [rbp-368]
		mov		r9, qword [rbp-360]
		sub		r8, r9
		mov		qword [rbp-368], r8
		mov		r9, qword [rbp-320]
		mov		qword [rbp-376], r9
		mov		r8, qword [rbp-376]
		mov		r9, qword [rbp-368]
		sub		r8, r9
		mov		qword [rbp-376], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-384], r9
		mov		r8, qword [rbp-384]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-384], r8
		mov		r9, qword [rbp-384]
		mov		qword [rbp-392], r9
		mov		r8, qword [rbp-392]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-392], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-400], r9
		mov		r8, qword [rbp-400]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-400], r8
		mov		r9, qword [rbp-392]
		mov		qword [rbp-408], r9
		mov		r8, qword [rbp-408]
		mov		r9, qword [rbp-400]
		sub		r8, r9
		mov		qword [rbp-408], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-416], r9
		mov		r8, qword [rbp-416]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-416], r8
		mov		r9, qword [rbp-416]
		mov		qword [rbp-424], r9
		mov		r8, qword [rbp-424]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-424], r8
		mov		r9, qword [rbp-408]
		mov		qword [rbp-432], r9
		mov		r8, qword [rbp-432]
		mov		r9, qword [rbp-424]
		add		r8, r9
		mov		qword [rbp-432], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-440], r9
		mov		r8, qword [rbp-440]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-440], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-448], r9
		mov		r8, qword [rbp-448]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-448], r8
		mov		r9, qword [rbp-448]
		mov		qword [rbp-456], r9
		mov		r8, qword [rbp-456]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-456], r8
		mov		r9, qword [rbp-440]
		mov		qword [rbp-464], r9
		mov		r8, qword [rbp-464]
		mov		r9, qword [rbp-456]
		add		r8, r9
		mov		qword [rbp-464], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-472], r9
		mov		r8, qword [rbp-472]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-472], r8
		mov		r9, qword [rbp-464]
		mov		qword [rbp-480], r9
		mov		r8, qword [rbp-480]
		mov		r9, qword [rbp-472]
		sub		r8, r9
		mov		qword [rbp-480], r8
		mov		r9, qword [rbp-432]
		mov		qword [rbp-488], r9
		mov		r8, qword [rbp-488]
		mov		r9, qword [rbp-480]
		sub		r8, r9
		mov		qword [rbp-488], r8
		mov		r9, qword [rbp-376]
		mov		qword [rbp-496], r9
		mov		r8, qword [rbp-496]
		mov		r9, qword [rbp-488]
		add		r8, r9
		mov		qword [rbp-496], r8
		mov		r9, qword [rbp-248]
		mov		qword [rbp-504], r9
		mov		r8, qword [rbp-504]
		mov		r9, qword [rbp-496]
		sub		r8, r9
		mov		qword [rbp-504], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-512], r9
		mov		r8, qword [rbp-512]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-512], r8
		mov		r9, qword [rbp-512]
		mov		qword [rbp-520], r9
		mov		r8, qword [rbp-520]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-520], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-528], r9
		mov		r8, qword [rbp-528]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-528], r8
		mov		r9, qword [rbp-520]
		mov		qword [rbp-536], r9
		mov		r8, qword [rbp-536]
		mov		r9, qword [rbp-528]
		sub		r8, r9
		mov		qword [rbp-536], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-544], r9
		mov		r8, qword [rbp-544]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-544], r8
		mov		r9, qword [rbp-544]
		mov		qword [rbp-552], r9
		mov		r8, qword [rbp-552]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-552], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-560], r9
		mov		r8, qword [rbp-560]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-560], r8
		mov		r9, qword [rbp-552]
		mov		qword [rbp-568], r9
		mov		r8, qword [rbp-568]
		mov		r9, qword [rbp-560]
		sub		r8, r9
		mov		qword [rbp-568], r8
		mov		r9, qword [rbp-536]
		mov		qword [rbp-576], r9
		mov		r8, qword [rbp-576]
		mov		r9, qword [rbp-568]
		add		r8, r9
		mov		qword [rbp-576], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-584], r9
		mov		r8, qword [rbp-584]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-584], r8
		mov		r9, qword [rbp-584]
		mov		qword [rbp-592], r9
		mov		r8, qword [rbp-592]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-592], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-600], r9
		mov		r8, qword [rbp-600]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-600], r8
		mov		r9, qword [rbp-592]
		mov		qword [rbp-608], r9
		mov		r8, qword [rbp-608]
		mov		r9, qword [rbp-600]
		sub		r8, r9
		mov		qword [rbp-608], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-616], r9
		mov		r8, qword [rbp-616]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-616], r8
		mov		r9, qword [rbp-616]
		mov		qword [rbp-624], r9
		mov		r8, qword [rbp-624]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-624], r8
		mov		r9, qword [rbp-608]
		mov		qword [rbp-632], r9
		mov		r8, qword [rbp-632]
		mov		r9, qword [rbp-624]
		add		r8, r9
		mov		qword [rbp-632], r8
		mov		r9, qword [rbp-576]
		mov		qword [rbp-640], r9
		mov		r8, qword [rbp-640]
		mov		r9, qword [rbp-632]
		add		r8, r9
		mov		qword [rbp-640], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-648], r9
		mov		r8, qword [rbp-648]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-648], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-656], r9
		mov		r8, qword [rbp-656]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-656], r8
		mov		r9, qword [rbp-656]
		mov		qword [rbp-664], r9
		mov		r8, qword [rbp-664]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-664], r8
		mov		r9, qword [rbp-648]
		mov		qword [rbp-672], r9
		mov		r8, qword [rbp-672]
		mov		r9, qword [rbp-664]
		add		r8, r9
		mov		qword [rbp-672], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-680], r9
		mov		r8, qword [rbp-680]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-680], r8
		mov		r9, qword [rbp-672]
		mov		qword [rbp-688], r9
		mov		r8, qword [rbp-688]
		mov		r9, qword [rbp-680]
		sub		r8, r9
		mov		qword [rbp-688], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-696], r9
		mov		r8, qword [rbp-696]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-696], r8
		mov		r9, qword [rbp-696]
		mov		qword [rbp-704], r9
		mov		r8, qword [rbp-704]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-704], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-712], r9
		mov		r8, qword [rbp-712]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-712], r8
		mov		r9, qword [rbp-704]
		mov		qword [rbp-720], r9
		mov		r8, qword [rbp-720]
		mov		r9, qword [rbp-712]
		sub		r8, r9
		mov		qword [rbp-720], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-728], r9
		mov		r8, qword [rbp-728]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-728], r8
		mov		r9, qword [rbp-728]
		mov		qword [rbp-736], r9
		mov		r8, qword [rbp-736]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-736], r8
		mov		r9, qword [rbp-720]
		mov		qword [rbp-744], r9
		mov		r8, qword [rbp-744]
		mov		r9, qword [rbp-736]
		add		r8, r9
		mov		qword [rbp-744], r8
		mov		r9, qword [rbp-688]
		mov		qword [rbp-752], r9
		mov		r8, qword [rbp-752]
		mov		r9, qword [rbp-744]
		add		r8, r9
		mov		qword [rbp-752], r8
		mov		r9, qword [rbp-640]
		mov		qword [rbp-760], r9
		mov		r8, qword [rbp-760]
		mov		r9, qword [rbp-752]
		sub		r8, r9
		mov		qword [rbp-760], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-768], r9
		mov		r8, qword [rbp-768]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-768], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-776], r9
		mov		r8, qword [rbp-776]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-776], r8
		mov		r9, qword [rbp-776]
		mov		qword [rbp-784], r9
		mov		r8, qword [rbp-784]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-784], r8
		mov		r9, qword [rbp-768]
		mov		qword [rbp-792], r9
		mov		r8, qword [rbp-792]
		mov		r9, qword [rbp-784]
		add		r8, r9
		mov		qword [rbp-792], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-800], r9
		mov		r8, qword [rbp-800]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-800], r8
		mov		r9, qword [rbp-792]
		mov		qword [rbp-808], r9
		mov		r8, qword [rbp-808]
		mov		r9, qword [rbp-800]
		sub		r8, r9
		mov		qword [rbp-808], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-816], r9
		mov		r8, qword [rbp-816]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-816], r8
		mov		r9, qword [rbp-816]
		mov		qword [rbp-824], r9
		mov		r8, qword [rbp-824]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-824], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-832], r9
		mov		r8, qword [rbp-832]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-832], r8
		mov		r9, qword [rbp-824]
		mov		qword [rbp-840], r9
		mov		r8, qword [rbp-840]
		mov		r9, qword [rbp-832]
		sub		r8, r9
		mov		qword [rbp-840], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-848], r9
		mov		r8, qword [rbp-848]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-848], r8
		mov		r9, qword [rbp-848]
		mov		qword [rbp-856], r9
		mov		r8, qword [rbp-856]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-856], r8
		mov		r9, qword [rbp-840]
		mov		qword [rbp-864], r9
		mov		r8, qword [rbp-864]
		mov		r9, qword [rbp-856]
		add		r8, r9
		mov		qword [rbp-864], r8
		mov		r9, qword [rbp-808]
		mov		qword [rbp-872], r9
		mov		r8, qword [rbp-872]
		mov		r9, qword [rbp-864]
		add		r8, r9
		mov		qword [rbp-872], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-880], r9
		mov		r8, qword [rbp-880]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-880], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-888], r9
		mov		r8, qword [rbp-888]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-888], r8
		mov		r9, qword [rbp-888]
		mov		qword [rbp-896], r9
		mov		r8, qword [rbp-896]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-896], r8
		mov		r9, qword [rbp-880]
		mov		qword [rbp-904], r9
		mov		r8, qword [rbp-904]
		mov		r9, qword [rbp-896]
		add		r8, r9
		mov		qword [rbp-904], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-912], r9
		mov		r8, qword [rbp-912]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-912], r8
		mov		r9, qword [rbp-904]
		mov		qword [rbp-920], r9
		mov		r8, qword [rbp-920]
		mov		r9, qword [rbp-912]
		sub		r8, r9
		mov		qword [rbp-920], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-928], r9
		mov		r8, qword [rbp-928]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-928], r8
		mov		r9, qword [rbp-928]
		mov		qword [rbp-936], r9
		mov		r8, qword [rbp-936]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-936], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-944], r9
		mov		r8, qword [rbp-944]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-944], r8
		mov		r9, qword [rbp-936]
		mov		qword [rbp-952], r9
		mov		r8, qword [rbp-952]
		mov		r9, qword [rbp-944]
		sub		r8, r9
		mov		qword [rbp-952], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-960], r9
		mov		r8, qword [rbp-960]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-960], r8
		mov		r9, qword [rbp-960]
		mov		qword [rbp-968], r9
		mov		r8, qword [rbp-968]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-968], r8
		mov		r9, qword [rbp-952]
		mov		qword [rbp-976], r9
		mov		r8, qword [rbp-976]
		mov		r9, qword [rbp-968]
		add		r8, r9
		mov		qword [rbp-976], r8
		mov		r9, qword [rbp-920]
		mov		qword [rbp-984], r9
		mov		r8, qword [rbp-984]
		mov		r9, qword [rbp-976]
		add		r8, r9
		mov		qword [rbp-984], r8
		mov		r9, qword [rbp-872]
		mov		qword [rbp-992], r9
		mov		r8, qword [rbp-992]
		mov		r9, qword [rbp-984]
		sub		r8, r9
		mov		qword [rbp-992], r8
		mov		r9, qword [rbp-760]
		mov		qword [rbp-1000], r9
		mov		r8, qword [rbp-1000]
		mov		r9, qword [rbp-992]
		sub		r8, r9
		mov		qword [rbp-1000], r8
		mov		r9, qword [rbp-504]
		mov		qword [rbp-1008], r9
		mov		r8, qword [rbp-1008]
		mov		r9, qword [rbp-1000]
		add		r8, r9
		mov		qword [rbp-1008], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1016], r9
		mov		r8, qword [rbp-1016]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1016], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1024], r9
		mov		r8, qword [rbp-1024]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1024], r8
		mov		r9, qword [rbp-1024]
		mov		qword [rbp-1032], r9
		mov		r8, qword [rbp-1032]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1032], r8
		mov		r9, qword [rbp-1016]
		mov		qword [rbp-1040], r9
		mov		r8, qword [rbp-1040]
		mov		r9, qword [rbp-1032]
		add		r8, r9
		mov		qword [rbp-1040], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1048], r9
		mov		r8, qword [rbp-1048]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1048], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1056], r9
		mov		r8, qword [rbp-1056]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1056], r8
		mov		r9, qword [rbp-1056]
		mov		qword [rbp-1064], r9
		mov		r8, qword [rbp-1064]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1064], r8
		mov		r9, qword [rbp-1048]
		mov		qword [rbp-1072], r9
		mov		r8, qword [rbp-1072]
		mov		r9, qword [rbp-1064]
		add		r8, r9
		mov		qword [rbp-1072], r8
		mov		r9, qword [rbp-1040]
		mov		qword [rbp-1080], r9
		mov		r8, qword [rbp-1080]
		mov		r9, qword [rbp-1072]
		sub		r8, r9
		mov		qword [rbp-1080], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1088], r9
		mov		r8, qword [rbp-1088]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1088], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1096], r9
		mov		r8, qword [rbp-1096]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1096], r8
		mov		r9, qword [rbp-1096]
		mov		qword [rbp-1104], r9
		mov		r8, qword [rbp-1104]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1104], r8
		mov		r9, qword [rbp-1088]
		mov		qword [rbp-1112], r9
		mov		r8, qword [rbp-1112]
		mov		r9, qword [rbp-1104]
		add		r8, r9
		mov		qword [rbp-1112], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1120], r9
		mov		r8, qword [rbp-1120]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1120], r8
		mov		r9, qword [rbp-1112]
		mov		qword [rbp-1128], r9
		mov		r8, qword [rbp-1128]
		mov		r9, qword [rbp-1120]
		sub		r8, r9
		mov		qword [rbp-1128], r8
		mov		r9, qword [rbp-1080]
		mov		qword [rbp-1136], r9
		mov		r8, qword [rbp-1136]
		mov		r9, qword [rbp-1128]
		sub		r8, r9
		mov		qword [rbp-1136], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1144], r9
		mov		r8, qword [rbp-1144]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1144], r8
		mov		r9, qword [rbp-1144]
		mov		qword [rbp-1152], r9
		mov		r8, qword [rbp-1152]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1152], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1160], r9
		mov		r8, qword [rbp-1160]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1160], r8
		mov		r9, qword [rbp-1152]
		mov		qword [rbp-1168], r9
		mov		r8, qword [rbp-1168]
		mov		r9, qword [rbp-1160]
		sub		r8, r9
		mov		qword [rbp-1168], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1176], r9
		mov		r8, qword [rbp-1176]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1176], r8
		mov		r9, qword [rbp-1176]
		mov		qword [rbp-1184], r9
		mov		r8, qword [rbp-1184]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1184], r8
		mov		r9, qword [rbp-1168]
		mov		qword [rbp-1192], r9
		mov		r8, qword [rbp-1192]
		mov		r9, qword [rbp-1184]
		add		r8, r9
		mov		qword [rbp-1192], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1200], r9
		mov		r8, qword [rbp-1200]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1200], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1208], r9
		mov		r8, qword [rbp-1208]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1208], r8
		mov		r9, qword [rbp-1208]
		mov		qword [rbp-1216], r9
		mov		r8, qword [rbp-1216]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1216], r8
		mov		r9, qword [rbp-1200]
		mov		qword [rbp-1224], r9
		mov		r8, qword [rbp-1224]
		mov		r9, qword [rbp-1216]
		add		r8, r9
		mov		qword [rbp-1224], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1232], r9
		mov		r8, qword [rbp-1232]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1232], r8
		mov		r9, qword [rbp-1224]
		mov		qword [rbp-1240], r9
		mov		r8, qword [rbp-1240]
		mov		r9, qword [rbp-1232]
		sub		r8, r9
		mov		qword [rbp-1240], r8
		mov		r9, qword [rbp-1192]
		mov		qword [rbp-1248], r9
		mov		r8, qword [rbp-1248]
		mov		r9, qword [rbp-1240]
		sub		r8, r9
		mov		qword [rbp-1248], r8
		mov		r9, qword [rbp-1136]
		mov		qword [rbp-1256], r9
		mov		r8, qword [rbp-1256]
		mov		r9, qword [rbp-1248]
		add		r8, r9
		mov		qword [rbp-1256], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1264], r9
		mov		r8, qword [rbp-1264]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1264], r8
		mov		r9, qword [rbp-1264]
		mov		qword [rbp-1272], r9
		mov		r8, qword [rbp-1272]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1272], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1280], r9
		mov		r8, qword [rbp-1280]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1280], r8
		mov		r9, qword [rbp-1272]
		mov		qword [rbp-1288], r9
		mov		r8, qword [rbp-1288]
		mov		r9, qword [rbp-1280]
		sub		r8, r9
		mov		qword [rbp-1288], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1296], r9
		mov		r8, qword [rbp-1296]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1296], r8
		mov		r9, qword [rbp-1296]
		mov		qword [rbp-1304], r9
		mov		r8, qword [rbp-1304]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1304], r8
		mov		r9, qword [rbp-1288]
		mov		qword [rbp-1312], r9
		mov		r8, qword [rbp-1312]
		mov		r9, qword [rbp-1304]
		add		r8, r9
		mov		qword [rbp-1312], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1320], r9
		mov		r8, qword [rbp-1320]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1320], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1328], r9
		mov		r8, qword [rbp-1328]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1328], r8
		mov		r9, qword [rbp-1328]
		mov		qword [rbp-1336], r9
		mov		r8, qword [rbp-1336]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1336], r8
		mov		r9, qword [rbp-1320]
		mov		qword [rbp-1344], r9
		mov		r8, qword [rbp-1344]
		mov		r9, qword [rbp-1336]
		add		r8, r9
		mov		qword [rbp-1344], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1352], r9
		mov		r8, qword [rbp-1352]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1352], r8
		mov		r9, qword [rbp-1344]
		mov		qword [rbp-1360], r9
		mov		r8, qword [rbp-1360]
		mov		r9, qword [rbp-1352]
		sub		r8, r9
		mov		qword [rbp-1360], r8
		mov		r9, qword [rbp-1312]
		mov		qword [rbp-1368], r9
		mov		r8, qword [rbp-1368]
		mov		r9, qword [rbp-1360]
		sub		r8, r9
		mov		qword [rbp-1368], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1376], r9
		mov		r8, qword [rbp-1376]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1376], r8
		mov		r9, qword [rbp-1376]
		mov		qword [rbp-1384], r9
		mov		r8, qword [rbp-1384]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1384], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1392], r9
		mov		r8, qword [rbp-1392]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1392], r8
		mov		r9, qword [rbp-1384]
		mov		qword [rbp-1400], r9
		mov		r8, qword [rbp-1400]
		mov		r9, qword [rbp-1392]
		sub		r8, r9
		mov		qword [rbp-1400], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1408], r9
		mov		r8, qword [rbp-1408]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1408], r8
		mov		r9, qword [rbp-1408]
		mov		qword [rbp-1416], r9
		mov		r8, qword [rbp-1416]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1416], r8
		mov		r9, qword [rbp-1400]
		mov		qword [rbp-1424], r9
		mov		r8, qword [rbp-1424]
		mov		r9, qword [rbp-1416]
		add		r8, r9
		mov		qword [rbp-1424], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1432], r9
		mov		r8, qword [rbp-1432]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1432], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1440], r9
		mov		r8, qword [rbp-1440]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1440], r8
		mov		r9, qword [rbp-1440]
		mov		qword [rbp-1448], r9
		mov		r8, qword [rbp-1448]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1448], r8
		mov		r9, qword [rbp-1432]
		mov		qword [rbp-1456], r9
		mov		r8, qword [rbp-1456]
		mov		r9, qword [rbp-1448]
		add		r8, r9
		mov		qword [rbp-1456], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1464], r9
		mov		r8, qword [rbp-1464]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1464], r8
		mov		r9, qword [rbp-1456]
		mov		qword [rbp-1472], r9
		mov		r8, qword [rbp-1472]
		mov		r9, qword [rbp-1464]
		sub		r8, r9
		mov		qword [rbp-1472], r8
		mov		r9, qword [rbp-1424]
		mov		qword [rbp-1480], r9
		mov		r8, qword [rbp-1480]
		mov		r9, qword [rbp-1472]
		sub		r8, r9
		mov		qword [rbp-1480], r8
		mov		r9, qword [rbp-1368]
		mov		qword [rbp-1488], r9
		mov		r8, qword [rbp-1488]
		mov		r9, qword [rbp-1480]
		add		r8, r9
		mov		qword [rbp-1488], r8
		mov		r9, qword [rbp-1256]
		mov		qword [rbp-1496], r9
		mov		r8, qword [rbp-1496]
		mov		r9, qword [rbp-1488]
		add		r8, r9
		mov		qword [rbp-1496], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1504], r9
		mov		r8, qword [rbp-1504]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1504], r8
		mov		r9, qword [rbp-1504]
		mov		qword [rbp-1512], r9
		mov		r8, qword [rbp-1512]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1512], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1520], r9
		mov		r8, qword [rbp-1520]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1520], r8
		mov		r9, qword [rbp-1512]
		mov		qword [rbp-1528], r9
		mov		r8, qword [rbp-1528]
		mov		r9, qword [rbp-1520]
		sub		r8, r9
		mov		qword [rbp-1528], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1536], r9
		mov		r8, qword [rbp-1536]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1536], r8
		mov		r9, qword [rbp-1536]
		mov		qword [rbp-1544], r9
		mov		r8, qword [rbp-1544]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1544], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1552], r9
		mov		r8, qword [rbp-1552]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1552], r8
		mov		r9, qword [rbp-1544]
		mov		qword [rbp-1560], r9
		mov		r8, qword [rbp-1560]
		mov		r9, qword [rbp-1552]
		sub		r8, r9
		mov		qword [rbp-1560], r8
		mov		r9, qword [rbp-1528]
		mov		qword [rbp-1568], r9
		mov		r8, qword [rbp-1568]
		mov		r9, qword [rbp-1560]
		add		r8, r9
		mov		qword [rbp-1568], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1576], r9
		mov		r8, qword [rbp-1576]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1576], r8
		mov		r9, qword [rbp-1576]
		mov		qword [rbp-1584], r9
		mov		r8, qword [rbp-1584]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1584], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1592], r9
		mov		r8, qword [rbp-1592]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1592], r8
		mov		r9, qword [rbp-1584]
		mov		qword [rbp-1600], r9
		mov		r8, qword [rbp-1600]
		mov		r9, qword [rbp-1592]
		sub		r8, r9
		mov		qword [rbp-1600], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1608], r9
		mov		r8, qword [rbp-1608]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1608], r8
		mov		r9, qword [rbp-1608]
		mov		qword [rbp-1616], r9
		mov		r8, qword [rbp-1616]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1616], r8
		mov		r9, qword [rbp-1600]
		mov		qword [rbp-1624], r9
		mov		r8, qword [rbp-1624]
		mov		r9, qword [rbp-1616]
		add		r8, r9
		mov		qword [rbp-1624], r8
		mov		r9, qword [rbp-1568]
		mov		qword [rbp-1632], r9
		mov		r8, qword [rbp-1632]
		mov		r9, qword [rbp-1624]
		add		r8, r9
		mov		qword [rbp-1632], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1640], r9
		mov		r8, qword [rbp-1640]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1640], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1648], r9
		mov		r8, qword [rbp-1648]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1648], r8
		mov		r9, qword [rbp-1648]
		mov		qword [rbp-1656], r9
		mov		r8, qword [rbp-1656]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1656], r8
		mov		r9, qword [rbp-1640]
		mov		qword [rbp-1664], r9
		mov		r8, qword [rbp-1664]
		mov		r9, qword [rbp-1656]
		add		r8, r9
		mov		qword [rbp-1664], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1672], r9
		mov		r8, qword [rbp-1672]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1672], r8
		mov		r9, qword [rbp-1664]
		mov		qword [rbp-1680], r9
		mov		r8, qword [rbp-1680]
		mov		r9, qword [rbp-1672]
		sub		r8, r9
		mov		qword [rbp-1680], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1688], r9
		mov		r8, qword [rbp-1688]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1688], r8
		mov		r9, qword [rbp-1688]
		mov		qword [rbp-1696], r9
		mov		r8, qword [rbp-1696]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1696], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1704], r9
		mov		r8, qword [rbp-1704]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1704], r8
		mov		r9, qword [rbp-1696]
		mov		qword [rbp-1712], r9
		mov		r8, qword [rbp-1712]
		mov		r9, qword [rbp-1704]
		sub		r8, r9
		mov		qword [rbp-1712], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1720], r9
		mov		r8, qword [rbp-1720]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1720], r8
		mov		r9, qword [rbp-1720]
		mov		qword [rbp-1728], r9
		mov		r8, qword [rbp-1728]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1728], r8
		mov		r9, qword [rbp-1712]
		mov		qword [rbp-1736], r9
		mov		r8, qword [rbp-1736]
		mov		r9, qword [rbp-1728]
		add		r8, r9
		mov		qword [rbp-1736], r8
		mov		r9, qword [rbp-1680]
		mov		qword [rbp-1744], r9
		mov		r8, qword [rbp-1744]
		mov		r9, qword [rbp-1736]
		add		r8, r9
		mov		qword [rbp-1744], r8
		mov		r9, qword [rbp-1632]
		mov		qword [rbp-1752], r9
		mov		r8, qword [rbp-1752]
		mov		r9, qword [rbp-1744]
		sub		r8, r9
		mov		qword [rbp-1752], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1760], r9
		mov		r8, qword [rbp-1760]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1760], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1768], r9
		mov		r8, qword [rbp-1768]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1768], r8
		mov		r9, qword [rbp-1768]
		mov		qword [rbp-1776], r9
		mov		r8, qword [rbp-1776]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1776], r8
		mov		r9, qword [rbp-1760]
		mov		qword [rbp-1784], r9
		mov		r8, qword [rbp-1784]
		mov		r9, qword [rbp-1776]
		add		r8, r9
		mov		qword [rbp-1784], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1792], r9
		mov		r8, qword [rbp-1792]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1792], r8
		mov		r9, qword [rbp-1784]
		mov		qword [rbp-1800], r9
		mov		r8, qword [rbp-1800]
		mov		r9, qword [rbp-1792]
		sub		r8, r9
		mov		qword [rbp-1800], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1808], r9
		mov		r8, qword [rbp-1808]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1808], r8
		mov		r9, qword [rbp-1808]
		mov		qword [rbp-1816], r9
		mov		r8, qword [rbp-1816]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1816], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1824], r9
		mov		r8, qword [rbp-1824]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1824], r8
		mov		r9, qword [rbp-1816]
		mov		qword [rbp-1832], r9
		mov		r8, qword [rbp-1832]
		mov		r9, qword [rbp-1824]
		sub		r8, r9
		mov		qword [rbp-1832], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1840], r9
		mov		r8, qword [rbp-1840]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1840], r8
		mov		r9, qword [rbp-1840]
		mov		qword [rbp-1848], r9
		mov		r8, qword [rbp-1848]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1848], r8
		mov		r9, qword [rbp-1832]
		mov		qword [rbp-1856], r9
		mov		r8, qword [rbp-1856]
		mov		r9, qword [rbp-1848]
		add		r8, r9
		mov		qword [rbp-1856], r8
		mov		r9, qword [rbp-1800]
		mov		qword [rbp-1864], r9
		mov		r8, qword [rbp-1864]
		mov		r9, qword [rbp-1856]
		add		r8, r9
		mov		qword [rbp-1864], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1872], r9
		mov		r8, qword [rbp-1872]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1872], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1880], r9
		mov		r8, qword [rbp-1880]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1880], r8
		mov		r9, qword [rbp-1880]
		mov		qword [rbp-1888], r9
		mov		r8, qword [rbp-1888]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1888], r8
		mov		r9, qword [rbp-1872]
		mov		qword [rbp-1896], r9
		mov		r8, qword [rbp-1896]
		mov		r9, qword [rbp-1888]
		add		r8, r9
		mov		qword [rbp-1896], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1904], r9
		mov		r8, qword [rbp-1904]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1904], r8
		mov		r9, qword [rbp-1896]
		mov		qword [rbp-1912], r9
		mov		r8, qword [rbp-1912]
		mov		r9, qword [rbp-1904]
		sub		r8, r9
		mov		qword [rbp-1912], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1920], r9
		mov		r8, qword [rbp-1920]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1920], r8
		mov		r9, qword [rbp-1920]
		mov		qword [rbp-1928], r9
		mov		r8, qword [rbp-1928]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1928], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-1936], r9
		mov		r8, qword [rbp-1936]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1936], r8
		mov		r9, qword [rbp-1928]
		mov		qword [rbp-1944], r9
		mov		r8, qword [rbp-1944]
		mov		r9, qword [rbp-1936]
		sub		r8, r9
		mov		qword [rbp-1944], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-1952], r9
		mov		r8, qword [rbp-1952]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-1952], r8
		mov		r9, qword [rbp-1952]
		mov		qword [rbp-1960], r9
		mov		r8, qword [rbp-1960]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-1960], r8
		mov		r9, qword [rbp-1944]
		mov		qword [rbp-1968], r9
		mov		r8, qword [rbp-1968]
		mov		r9, qword [rbp-1960]
		add		r8, r9
		mov		qword [rbp-1968], r8
		mov		r9, qword [rbp-1912]
		mov		qword [rbp-1976], r9
		mov		r8, qword [rbp-1976]
		mov		r9, qword [rbp-1968]
		add		r8, r9
		mov		qword [rbp-1976], r8
		mov		r9, qword [rbp-1864]
		mov		qword [rbp-1984], r9
		mov		r8, qword [rbp-1984]
		mov		r9, qword [rbp-1976]
		sub		r8, r9
		mov		qword [rbp-1984], r8
		mov		r9, qword [rbp-1752]
		mov		qword [rbp-1992], r9
		mov		r8, qword [rbp-1992]
		mov		r9, qword [rbp-1984]
		sub		r8, r9
		mov		qword [rbp-1992], r8
		mov		r9, qword [rbp-1496]
		mov		qword [rbp-2000], r9
		mov		r8, qword [rbp-2000]
		mov		r9, qword [rbp-1992]
		add		r8, r9
		mov		qword [rbp-2000], r8
		mov		r9, qword [rbp-1008]
		mov		qword [rbp-2008], r9
		mov		r8, qword [rbp-2008]
		mov		r9, qword [rbp-2000]
		sub		r8, r9
		mov		qword [rbp-2008], r8
		mov		r9, qword [rbp-2008]
		mov		qword [rel _global_A], r9
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2016], r9
		mov		r8, qword [rbp-2016]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2016], r8
		mov		r9, qword [rbp-2016]
		mov		qword [rbp-2024], r9
		mov		r8, qword [rbp-2024]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2024], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2032], r9
		mov		r8, qword [rbp-2032]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2032], r8
		mov		r9, qword [rbp-2024]
		mov		qword [rbp-2040], r9
		mov		r8, qword [rbp-2040]
		mov		r9, qword [rbp-2032]
		sub		r8, r9
		mov		qword [rbp-2040], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2048], r9
		mov		r8, qword [rbp-2048]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2048], r8
		mov		r9, qword [rbp-2048]
		mov		qword [rbp-2056], r9
		mov		r8, qword [rbp-2056]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2056], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2064], r9
		mov		r8, qword [rbp-2064]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2064], r8
		mov		r9, qword [rbp-2056]
		mov		qword [rbp-2072], r9
		mov		r8, qword [rbp-2072]
		mov		r9, qword [rbp-2064]
		sub		r8, r9
		mov		qword [rbp-2072], r8
		mov		r9, qword [rbp-2040]
		mov		qword [rbp-2080], r9
		mov		r8, qword [rbp-2080]
		mov		r9, qword [rbp-2072]
		add		r8, r9
		mov		qword [rbp-2080], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2088], r9
		mov		r8, qword [rbp-2088]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2088], r8
		mov		r9, qword [rbp-2088]
		mov		qword [rbp-2096], r9
		mov		r8, qword [rbp-2096]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2096], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2104], r9
		mov		r8, qword [rbp-2104]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2104], r8
		mov		r9, qword [rbp-2096]
		mov		qword [rbp-2112], r9
		mov		r8, qword [rbp-2112]
		mov		r9, qword [rbp-2104]
		sub		r8, r9
		mov		qword [rbp-2112], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2120], r9
		mov		r8, qword [rbp-2120]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2120], r8
		mov		r9, qword [rbp-2120]
		mov		qword [rbp-2128], r9
		mov		r8, qword [rbp-2128]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2128], r8
		mov		r9, qword [rbp-2112]
		mov		qword [rbp-2136], r9
		mov		r8, qword [rbp-2136]
		mov		r9, qword [rbp-2128]
		add		r8, r9
		mov		qword [rbp-2136], r8
		mov		r9, qword [rbp-2080]
		mov		qword [rbp-2144], r9
		mov		r8, qword [rbp-2144]
		mov		r9, qword [rbp-2136]
		add		r8, r9
		mov		qword [rbp-2144], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2152], r9
		mov		r8, qword [rbp-2152]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2152], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2160], r9
		mov		r8, qword [rbp-2160]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2160], r8
		mov		r9, qword [rbp-2160]
		mov		qword [rbp-2168], r9
		mov		r8, qword [rbp-2168]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2168], r8
		mov		r9, qword [rbp-2152]
		mov		qword [rbp-2176], r9
		mov		r8, qword [rbp-2176]
		mov		r9, qword [rbp-2168]
		add		r8, r9
		mov		qword [rbp-2176], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2184], r9
		mov		r8, qword [rbp-2184]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2184], r8
		mov		r9, qword [rbp-2176]
		mov		qword [rbp-2192], r9
		mov		r8, qword [rbp-2192]
		mov		r9, qword [rbp-2184]
		sub		r8, r9
		mov		qword [rbp-2192], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2200], r9
		mov		r8, qword [rbp-2200]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2200], r8
		mov		r9, qword [rbp-2200]
		mov		qword [rbp-2208], r9
		mov		r8, qword [rbp-2208]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2208], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2216], r9
		mov		r8, qword [rbp-2216]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2216], r8
		mov		r9, qword [rbp-2208]
		mov		qword [rbp-2224], r9
		mov		r8, qword [rbp-2224]
		mov		r9, qword [rbp-2216]
		sub		r8, r9
		mov		qword [rbp-2224], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2232], r9
		mov		r8, qword [rbp-2232]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2232], r8
		mov		r9, qword [rbp-2232]
		mov		qword [rbp-2240], r9
		mov		r8, qword [rbp-2240]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2240], r8
		mov		r9, qword [rbp-2224]
		mov		qword [rbp-2248], r9
		mov		r8, qword [rbp-2248]
		mov		r9, qword [rbp-2240]
		add		r8, r9
		mov		qword [rbp-2248], r8
		mov		r9, qword [rbp-2192]
		mov		qword [rbp-2256], r9
		mov		r8, qword [rbp-2256]
		mov		r9, qword [rbp-2248]
		add		r8, r9
		mov		qword [rbp-2256], r8
		mov		r9, qword [rbp-2144]
		mov		qword [rbp-2264], r9
		mov		r8, qword [rbp-2264]
		mov		r9, qword [rbp-2256]
		sub		r8, r9
		mov		qword [rbp-2264], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2272], r9
		mov		r8, qword [rbp-2272]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2272], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2280], r9
		mov		r8, qword [rbp-2280]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2280], r8
		mov		r9, qword [rbp-2280]
		mov		qword [rbp-2288], r9
		mov		r8, qword [rbp-2288]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2288], r8
		mov		r9, qword [rbp-2272]
		mov		qword [rbp-2296], r9
		mov		r8, qword [rbp-2296]
		mov		r9, qword [rbp-2288]
		add		r8, r9
		mov		qword [rbp-2296], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2304], r9
		mov		r8, qword [rbp-2304]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2304], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2312], r9
		mov		r8, qword [rbp-2312]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2312], r8
		mov		r9, qword [rbp-2312]
		mov		qword [rbp-2320], r9
		mov		r8, qword [rbp-2320]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2320], r8
		mov		r9, qword [rbp-2304]
		mov		qword [rbp-2328], r9
		mov		r8, qword [rbp-2328]
		mov		r9, qword [rbp-2320]
		add		r8, r9
		mov		qword [rbp-2328], r8
		mov		r9, qword [rbp-2296]
		mov		qword [rbp-2336], r9
		mov		r8, qword [rbp-2336]
		mov		r9, qword [rbp-2328]
		sub		r8, r9
		mov		qword [rbp-2336], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2344], r9
		mov		r8, qword [rbp-2344]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2344], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2352], r9
		mov		r8, qword [rbp-2352]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2352], r8
		mov		r9, qword [rbp-2352]
		mov		qword [rbp-2360], r9
		mov		r8, qword [rbp-2360]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2360], r8
		mov		r15, qword [rbp-2344]
		mov		r9, qword [rbp-2360]
		add		r15, r9
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2368], r9
		mov		r8, qword [rbp-2368]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2368], r8
		mov		qword [rbp-2376], r15
		mov		r8, qword [rbp-2376]
		mov		r9, qword [rbp-2368]
		sub		r8, r9
		mov		qword [rbp-2376], r8
		mov		r9, qword [rbp-2336]
		mov		qword [rbp-2384], r9
		mov		r8, qword [rbp-2384]
		mov		r9, qword [rbp-2376]
		sub		r8, r9
		mov		qword [rbp-2384], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2392], r9
		mov		r8, qword [rbp-2392]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2392], r8
		mov		r9, qword [rbp-2392]
		mov		qword [rbp-2400], r9
		mov		r8, qword [rbp-2400]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2400], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2408], r9
		mov		r8, qword [rbp-2408]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2408], r8
		mov		r9, qword [rbp-2400]
		mov		qword [rbp-2416], r9
		mov		r8, qword [rbp-2416]
		mov		r9, qword [rbp-2408]
		sub		r8, r9
		mov		qword [rbp-2416], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2424], r9
		mov		r8, qword [rbp-2424]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2424], r8
		mov		r9, qword [rbp-2424]
		mov		qword [rbp-2432], r9
		mov		r8, qword [rbp-2432]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2432], r8
		mov		r9, qword [rbp-2416]
		mov		qword [rbp-2440], r9
		mov		r8, qword [rbp-2440]
		mov		r9, qword [rbp-2432]
		add		r8, r9
		mov		qword [rbp-2440], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2448], r9
		mov		r8, qword [rbp-2448]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2448], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2456], r9
		mov		r8, qword [rbp-2456]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2456], r8
		mov		r9, qword [rbp-2456]
		mov		qword [rbp-2464], r9
		mov		r8, qword [rbp-2464]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2464], r8
		mov		r9, qword [rbp-2448]
		mov		qword [rbp-2472], r9
		mov		r8, qword [rbp-2472]
		mov		r9, qword [rbp-2464]
		add		r8, r9
		mov		qword [rbp-2472], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2480], r9
		mov		r8, qword [rbp-2480]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2480], r8
		mov		r9, qword [rbp-2472]
		mov		qword [rbp-2488], r9
		mov		r8, qword [rbp-2488]
		mov		r9, qword [rbp-2480]
		sub		r8, r9
		mov		qword [rbp-2488], r8
		mov		r9, qword [rbp-2440]
		mov		qword [rbp-2496], r9
		mov		r8, qword [rbp-2496]
		mov		r9, qword [rbp-2488]
		sub		r8, r9
		mov		qword [rbp-2496], r8
		mov		r9, qword [rbp-2384]
		mov		qword [rbp-2504], r9
		mov		r8, qword [rbp-2504]
		mov		r9, qword [rbp-2496]
		add		r8, r9
		mov		qword [rbp-2504], r8
		mov		r9, qword [rbp-2264]
		mov		qword [rbp-2512], r9
		mov		r8, qword [rbp-2512]
		mov		r9, qword [rbp-2504]
		sub		r8, r9
		mov		qword [rbp-2512], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2520], r9
		mov		r8, qword [rbp-2520]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2520], r8
		mov		r9, qword [rbp-2520]
		mov		qword [rbp-2528], r9
		mov		r8, qword [rbp-2528]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2528], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2536], r9
		mov		r8, qword [rbp-2536]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2536], r8
		mov		r9, qword [rbp-2528]
		mov		qword [rbp-2544], r9
		mov		r8, qword [rbp-2544]
		mov		r9, qword [rbp-2536]
		sub		r8, r9
		mov		qword [rbp-2544], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2552], r9
		mov		r8, qword [rbp-2552]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2552], r8
		mov		r9, qword [rbp-2552]
		mov		qword [rbp-2560], r9
		mov		r8, qword [rbp-2560]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2560], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2568], r9
		mov		r8, qword [rbp-2568]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2568], r8
		mov		r9, qword [rbp-2560]
		mov		qword [rbp-2576], r9
		mov		r8, qword [rbp-2576]
		mov		r9, qword [rbp-2568]
		sub		r8, r9
		mov		qword [rbp-2576], r8
		mov		r9, qword [rbp-2544]
		mov		qword [rbp-2584], r9
		mov		r8, qword [rbp-2584]
		mov		r9, qword [rbp-2576]
		add		r8, r9
		mov		qword [rbp-2584], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2592], r9
		mov		r8, qword [rbp-2592]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2592], r8
		mov		r9, qword [rbp-2592]
		mov		qword [rbp-2600], r9
		mov		r8, qword [rbp-2600]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2600], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2608], r9
		mov		r8, qword [rbp-2608]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2608], r8
		mov		r9, qword [rbp-2600]
		mov		qword [rbp-2616], r9
		mov		r8, qword [rbp-2616]
		mov		r9, qword [rbp-2608]
		sub		r8, r9
		mov		qword [rbp-2616], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2624], r9
		mov		r8, qword [rbp-2624]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2624], r8
		mov		r9, qword [rbp-2624]
		mov		qword [rbp-2632], r9
		mov		r8, qword [rbp-2632]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2632], r8
		mov		r9, qword [rbp-2616]
		mov		qword [rbp-2640], r9
		mov		r8, qword [rbp-2640]
		mov		r9, qword [rbp-2632]
		add		r8, r9
		mov		qword [rbp-2640], r8
		mov		r9, qword [rbp-2584]
		mov		qword [rbp-2648], r9
		mov		r8, qword [rbp-2648]
		mov		r9, qword [rbp-2640]
		add		r8, r9
		mov		qword [rbp-2648], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2656], r9
		mov		r8, qword [rbp-2656]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2656], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2664], r9
		mov		r8, qword [rbp-2664]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2664], r8
		mov		r9, qword [rbp-2664]
		mov		qword [rbp-2672], r9
		mov		r8, qword [rbp-2672]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2672], r8
		mov		r9, qword [rbp-2656]
		mov		qword [rbp-2680], r9
		mov		r8, qword [rbp-2680]
		mov		r9, qword [rbp-2672]
		add		r8, r9
		mov		qword [rbp-2680], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2688], r9
		mov		r8, qword [rbp-2688]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2688], r8
		mov		r9, qword [rbp-2680]
		mov		qword [rbp-2696], r9
		mov		r8, qword [rbp-2696]
		mov		r9, qword [rbp-2688]
		sub		r8, r9
		mov		qword [rbp-2696], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2704], r9
		mov		r8, qword [rbp-2704]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2704], r8
		mov		r9, qword [rbp-2704]
		mov		qword [rbp-2712], r9
		mov		r8, qword [rbp-2712]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2712], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2720], r9
		mov		r8, qword [rbp-2720]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2720], r8
		mov		r9, qword [rbp-2712]
		mov		qword [rbp-2728], r9
		mov		r8, qword [rbp-2728]
		mov		r9, qword [rbp-2720]
		sub		r8, r9
		mov		qword [rbp-2728], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2736], r9
		mov		r8, qword [rbp-2736]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2736], r8
		mov		r9, qword [rbp-2736]
		mov		qword [rbp-2744], r9
		mov		r8, qword [rbp-2744]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2744], r8
		mov		r9, qword [rbp-2728]
		mov		qword [rbp-2752], r9
		mov		r8, qword [rbp-2752]
		mov		r9, qword [rbp-2744]
		add		r8, r9
		mov		qword [rbp-2752], r8
		mov		r9, qword [rbp-2696]
		mov		qword [rbp-2760], r9
		mov		r8, qword [rbp-2760]
		mov		r9, qword [rbp-2752]
		add		r8, r9
		mov		qword [rbp-2760], r8
		mov		r9, qword [rbp-2648]
		mov		qword [rbp-2768], r9
		mov		r8, qword [rbp-2768]
		mov		r9, qword [rbp-2760]
		sub		r8, r9
		mov		qword [rbp-2768], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2776], r9
		mov		r8, qword [rbp-2776]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2776], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2784], r9
		mov		r8, qword [rbp-2784]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2784], r8
		mov		r9, qword [rbp-2784]
		mov		qword [rbp-2792], r9
		mov		r8, qword [rbp-2792]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2792], r8
		mov		r9, qword [rbp-2776]
		mov		qword [rbp-2800], r9
		mov		r8, qword [rbp-2800]
		mov		r9, qword [rbp-2792]
		add		r8, r9
		mov		qword [rbp-2800], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2808], r9
		mov		r8, qword [rbp-2808]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2808], r8
		mov		r9, qword [rbp-2800]
		mov		qword [rbp-2816], r9
		mov		r8, qword [rbp-2816]
		mov		r9, qword [rbp-2808]
		sub		r8, r9
		mov		qword [rbp-2816], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2824], r9
		mov		r8, qword [rbp-2824]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2824], r8
		mov		r9, qword [rbp-2824]
		mov		qword [rbp-2832], r9
		mov		r8, qword [rbp-2832]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2832], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2840], r9
		mov		r8, qword [rbp-2840]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2840], r8
		mov		r9, qword [rbp-2832]
		mov		qword [rbp-2848], r9
		mov		r8, qword [rbp-2848]
		mov		r9, qword [rbp-2840]
		sub		r8, r9
		mov		qword [rbp-2848], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2856], r9
		mov		r8, qword [rbp-2856]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2856], r8
		mov		r9, qword [rbp-2856]
		mov		qword [rbp-2864], r9
		mov		r8, qword [rbp-2864]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2864], r8
		mov		r9, qword [rbp-2848]
		mov		qword [rbp-2872], r9
		mov		r8, qword [rbp-2872]
		mov		r9, qword [rbp-2864]
		add		r8, r9
		mov		qword [rbp-2872], r8
		mov		r9, qword [rbp-2816]
		mov		qword [rbp-2880], r9
		mov		r8, qword [rbp-2880]
		mov		r9, qword [rbp-2872]
		add		r8, r9
		mov		qword [rbp-2880], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2888], r9
		mov		r8, qword [rbp-2888]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2888], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2896], r9
		mov		r8, qword [rbp-2896]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2896], r8
		mov		r9, qword [rbp-2896]
		mov		qword [rbp-2904], r9
		mov		r8, qword [rbp-2904]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2904], r8
		mov		r9, qword [rbp-2888]
		mov		qword [rbp-2912], r9
		mov		r8, qword [rbp-2912]
		mov		r9, qword [rbp-2904]
		add		r8, r9
		mov		qword [rbp-2912], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2920], r9
		mov		r8, qword [rbp-2920]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2920], r8
		mov		r9, qword [rbp-2912]
		mov		qword [rbp-2928], r9
		mov		r8, qword [rbp-2928]
		mov		r9, qword [rbp-2920]
		sub		r8, r9
		mov		qword [rbp-2928], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2936], r9
		mov		r8, qword [rbp-2936]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2936], r8
		mov		r9, qword [rbp-2936]
		mov		qword [rbp-2944], r9
		mov		r8, qword [rbp-2944]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2944], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-2952], r9
		mov		r8, qword [rbp-2952]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2952], r8
		mov		r9, qword [rbp-2944]
		mov		qword [rbp-2960], r9
		mov		r8, qword [rbp-2960]
		mov		r9, qword [rbp-2952]
		sub		r8, r9
		mov		qword [rbp-2960], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-2968], r9
		mov		r8, qword [rbp-2968]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-2968], r8
		mov		r9, qword [rbp-2968]
		mov		qword [rbp-2976], r9
		mov		r8, qword [rbp-2976]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-2976], r8
		mov		r9, qword [rbp-2960]
		mov		qword [rbp-2984], r9
		mov		r8, qword [rbp-2984]
		mov		r9, qword [rbp-2976]
		add		r8, r9
		mov		qword [rbp-2984], r8
		mov		r9, qword [rbp-2928]
		mov		qword [rbp-2992], r9
		mov		r8, qword [rbp-2992]
		mov		r9, qword [rbp-2984]
		add		r8, r9
		mov		qword [rbp-2992], r8
		mov		r9, qword [rbp-2880]
		mov		qword [rbp-3000], r9
		mov		r8, qword [rbp-3000]
		mov		r9, qword [rbp-2992]
		sub		r8, r9
		mov		qword [rbp-3000], r8
		mov		r9, qword [rbp-2768]
		mov		qword [rbp-3008], r9
		mov		r8, qword [rbp-3008]
		mov		r9, qword [rbp-3000]
		sub		r8, r9
		mov		qword [rbp-3008], r8
		mov		r9, qword [rbp-2512]
		mov		qword [rbp-3016], r9
		mov		r8, qword [rbp-3016]
		mov		r9, qword [rbp-3008]
		add		r8, r9
		mov		qword [rbp-3016], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3024], r9
		mov		r8, qword [rbp-3024]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3024], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3032], r9
		mov		r8, qword [rbp-3032]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3032], r8
		mov		r9, qword [rbp-3032]
		mov		qword [rbp-3040], r9
		mov		r8, qword [rbp-3040]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3040], r8
		mov		r9, qword [rbp-3024]
		mov		qword [rbp-3048], r9
		mov		r8, qword [rbp-3048]
		mov		r9, qword [rbp-3040]
		add		r8, r9
		mov		qword [rbp-3048], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3056], r9
		mov		r8, qword [rbp-3056]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3056], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3064], r9
		mov		r8, qword [rbp-3064]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3064], r8
		mov		r9, qword [rbp-3064]
		mov		qword [rbp-3072], r9
		mov		r8, qword [rbp-3072]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3072], r8
		mov		r9, qword [rbp-3056]
		mov		qword [rbp-3080], r9
		mov		r8, qword [rbp-3080]
		mov		r9, qword [rbp-3072]
		add		r8, r9
		mov		qword [rbp-3080], r8
		mov		r9, qword [rbp-3048]
		mov		qword [rbp-3088], r9
		mov		r8, qword [rbp-3088]
		mov		r9, qword [rbp-3080]
		sub		r8, r9
		mov		qword [rbp-3088], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3096], r9
		mov		r8, qword [rbp-3096]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3096], r8
		mov		r10, qword [rel _global_C]
		mov		r9, qword [rel _global_A]
		sub		r10, r9
		mov		qword [rbp-3104], r10
		mov		r8, qword [rbp-3104]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3104], r8
		mov		r9, qword [rbp-3096]
		mov		qword [rbp-3112], r9
		mov		r8, qword [rbp-3112]
		mov		r9, qword [rbp-3104]
		add		r8, r9
		mov		qword [rbp-3112], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3120], r9
		mov		r8, qword [rbp-3120]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3120], r8
		mov		r9, qword [rbp-3112]
		mov		qword [rbp-3128], r9
		mov		r8, qword [rbp-3128]
		mov		r9, qword [rbp-3120]
		sub		r8, r9
		mov		qword [rbp-3128], r8
		mov		r9, qword [rbp-3088]
		mov		qword [rbp-3136], r9
		mov		r8, qword [rbp-3136]
		mov		r9, qword [rbp-3128]
		sub		r8, r9
		mov		qword [rbp-3136], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3144], r9
		mov		r8, qword [rbp-3144]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3144], r8
		mov		r9, qword [rbp-3144]
		mov		qword [rbp-3152], r9
		mov		r8, qword [rbp-3152]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3152], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3160], r9
		mov		r8, qword [rbp-3160]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3160], r8
		mov		r9, qword [rbp-3152]
		mov		qword [rbp-3168], r9
		mov		r8, qword [rbp-3168]
		mov		r9, qword [rbp-3160]
		sub		r8, r9
		mov		qword [rbp-3168], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3176], r9
		mov		r8, qword [rbp-3176]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3176], r8
		mov		r9, qword [rbp-3176]
		mov		qword [rbp-3184], r9
		mov		r8, qword [rbp-3184]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3184], r8
		mov		r9, qword [rbp-3168]
		mov		qword [rbp-3192], r9
		mov		r8, qword [rbp-3192]
		mov		r9, qword [rbp-3184]
		add		r8, r9
		mov		qword [rbp-3192], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3200], r9
		mov		r8, qword [rbp-3200]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3200], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3208], r9
		mov		r8, qword [rbp-3208]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3208], r8
		mov		r9, qword [rbp-3208]
		mov		qword [rbp-3216], r9
		mov		r8, qword [rbp-3216]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3216], r8
		mov		r9, qword [rbp-3200]
		mov		qword [rbp-3224], r9
		mov		r8, qword [rbp-3224]
		mov		r9, qword [rbp-3216]
		add		r8, r9
		mov		qword [rbp-3224], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3232], r9
		mov		r8, qword [rbp-3232]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3232], r8
		mov		r9, qword [rbp-3224]
		mov		qword [rbp-3240], r9
		mov		r8, qword [rbp-3240]
		mov		r9, qword [rbp-3232]
		sub		r8, r9
		mov		qword [rbp-3240], r8
		mov		r9, qword [rbp-3192]
		mov		qword [rbp-3248], r9
		mov		r8, qword [rbp-3248]
		mov		r9, qword [rbp-3240]
		sub		r8, r9
		mov		qword [rbp-3248], r8
		mov		r9, qword [rbp-3136]
		mov		qword [rbp-3256], r9
		mov		r8, qword [rbp-3256]
		mov		r9, qword [rbp-3248]
		add		r8, r9
		mov		qword [rbp-3256], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3264], r9
		mov		r8, qword [rbp-3264]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3264], r8
		mov		r9, qword [rbp-3264]
		mov		qword [rbp-3272], r9
		mov		r8, qword [rbp-3272]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3272], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3280], r9
		mov		r8, qword [rbp-3280]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3280], r8
		mov		r9, qword [rbp-3272]
		mov		qword [rbp-3288], r9
		mov		r8, qword [rbp-3288]
		mov		r9, qword [rbp-3280]
		sub		r8, r9
		mov		qword [rbp-3288], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3296], r9
		mov		r8, qword [rbp-3296]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3296], r8
		mov		r9, qword [rbp-3296]
		mov		qword [rbp-3304], r9
		mov		r8, qword [rbp-3304]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3304], r8
		mov		r9, qword [rbp-3288]
		mov		qword [rbp-3312], r9
		mov		r8, qword [rbp-3312]
		mov		r9, qword [rbp-3304]
		add		r8, r9
		mov		qword [rbp-3312], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3320], r9
		mov		r8, qword [rbp-3320]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3320], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3328], r9
		mov		r8, qword [rbp-3328]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3328], r8
		mov		r12, qword [rbp-3328]
		mov		r9, qword [rel _global_B]
		add		r12, r9
		mov		r9, qword [rbp-3320]
		mov		qword [rbp-3336], r9
		mov		r8, qword [rbp-3336]
		add		r8, r12
		mov		qword [rbp-3336], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3344], r9
		mov		r8, qword [rbp-3344]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3344], r8
		mov		r9, qword [rbp-3336]
		mov		qword [rbp-3352], r9
		mov		r8, qword [rbp-3352]
		mov		r9, qword [rbp-3344]
		sub		r8, r9
		mov		qword [rbp-3352], r8
		mov		r9, qword [rbp-3312]
		mov		qword [rbp-3360], r9
		mov		r8, qword [rbp-3360]
		mov		r9, qword [rbp-3352]
		sub		r8, r9
		mov		qword [rbp-3360], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3368], r9
		mov		r8, qword [rbp-3368]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3368], r8
		mov		r9, qword [rbp-3368]
		mov		qword [rbp-3376], r9
		mov		r8, qword [rbp-3376]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3376], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3384], r9
		mov		r8, qword [rbp-3384]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3384], r8
		mov		r9, qword [rbp-3376]
		mov		qword [rbp-3392], r9
		mov		r8, qword [rbp-3392]
		mov		r9, qword [rbp-3384]
		sub		r8, r9
		mov		qword [rbp-3392], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3400], r9
		mov		r8, qword [rbp-3400]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3400], r8
		mov		r9, qword [rbp-3400]
		mov		qword [rbp-3408], r9
		mov		r8, qword [rbp-3408]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3408], r8
		mov		r9, qword [rbp-3392]
		mov		qword [rbp-3416], r9
		mov		r8, qword [rbp-3416]
		mov		r9, qword [rbp-3408]
		add		r8, r9
		mov		qword [rbp-3416], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3424], r9
		mov		r8, qword [rbp-3424]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3424], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3432], r9
		mov		r8, qword [rbp-3432]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3432], r8
		mov		r9, qword [rbp-3432]
		mov		qword [rbp-3440], r9
		mov		r8, qword [rbp-3440]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3440], r8
		mov		r9, qword [rbp-3424]
		mov		qword [rbp-3448], r9
		mov		r8, qword [rbp-3448]
		mov		r9, qword [rbp-3440]
		add		r8, r9
		mov		qword [rbp-3448], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3456], r9
		mov		r8, qword [rbp-3456]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3456], r8
		mov		r9, qword [rbp-3448]
		mov		qword [rbp-3464], r9
		mov		r8, qword [rbp-3464]
		mov		r9, qword [rbp-3456]
		sub		r8, r9
		mov		qword [rbp-3464], r8
		mov		r9, qword [rbp-3416]
		mov		qword [rbp-3472], r9
		mov		r8, qword [rbp-3472]
		mov		r9, qword [rbp-3464]
		sub		r8, r9
		mov		qword [rbp-3472], r8
		mov		r9, qword [rbp-3360]
		mov		qword [rbp-3480], r9
		mov		r8, qword [rbp-3480]
		mov		r9, qword [rbp-3472]
		add		r8, r9
		mov		qword [rbp-3480], r8
		mov		r9, qword [rbp-3256]
		mov		qword [rbp-3488], r9
		mov		r8, qword [rbp-3488]
		mov		r9, qword [rbp-3480]
		add		r8, r9
		mov		qword [rbp-3488], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3496], r9
		mov		r8, qword [rbp-3496]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3496], r8
		mov		r9, qword [rbp-3496]
		mov		qword [rbp-3504], r9
		mov		r8, qword [rbp-3504]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3504], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3512], r9
		mov		r8, qword [rbp-3512]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3512], r8
		mov		r9, qword [rbp-3504]
		mov		qword [rbp-3520], r9
		mov		r8, qword [rbp-3520]
		mov		r9, qword [rbp-3512]
		sub		r8, r9
		mov		qword [rbp-3520], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3528], r9
		mov		r8, qword [rbp-3528]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3528], r8
		mov		r9, qword [rbp-3528]
		mov		qword [rbp-3536], r9
		mov		r8, qword [rbp-3536]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3536], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3544], r9
		mov		r8, qword [rbp-3544]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3544], r8
		mov		r9, qword [rbp-3536]
		mov		qword [rbp-3552], r9
		mov		r8, qword [rbp-3552]
		mov		r9, qword [rbp-3544]
		sub		r8, r9
		mov		qword [rbp-3552], r8
		mov		r9, qword [rbp-3520]
		mov		qword [rbp-3560], r9
		mov		r8, qword [rbp-3560]
		mov		r9, qword [rbp-3552]
		add		r8, r9
		mov		qword [rbp-3560], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3568], r9
		mov		r8, qword [rbp-3568]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3568], r8
		mov		r9, qword [rbp-3568]
		mov		qword [rbp-3576], r9
		mov		r8, qword [rbp-3576]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3576], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3584], r9
		mov		r8, qword [rbp-3584]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3584], r8
		mov		r9, qword [rbp-3576]
		mov		qword [rbp-3592], r9
		mov		r8, qword [rbp-3592]
		mov		r9, qword [rbp-3584]
		sub		r8, r9
		mov		qword [rbp-3592], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3600], r9
		mov		r8, qword [rbp-3600]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3600], r8
		mov		r9, qword [rbp-3600]
		mov		qword [rbp-3608], r9
		mov		r8, qword [rbp-3608]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3608], r8
		mov		r9, qword [rbp-3592]
		mov		qword [rbp-3616], r9
		mov		r8, qword [rbp-3616]
		mov		r9, qword [rbp-3608]
		add		r8, r9
		mov		qword [rbp-3616], r8
		mov		r9, qword [rbp-3560]
		mov		qword [rbp-3624], r9
		mov		r8, qword [rbp-3624]
		mov		r9, qword [rbp-3616]
		add		r8, r9
		mov		qword [rbp-3624], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3632], r9
		mov		r8, qword [rbp-3632]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3632], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3640], r9
		mov		r8, qword [rbp-3640]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3640], r8
		mov		r9, qword [rbp-3640]
		mov		qword [rbp-3648], r9
		mov		r8, qword [rbp-3648]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3648], r8
		mov		r9, qword [rbp-3632]
		mov		qword [rbp-3656], r9
		mov		r8, qword [rbp-3656]
		mov		r9, qword [rbp-3648]
		add		r8, r9
		mov		qword [rbp-3656], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3664], r9
		mov		r8, qword [rbp-3664]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3664], r8
		mov		r9, qword [rbp-3656]
		mov		qword [rbp-3672], r9
		mov		r8, qword [rbp-3672]
		mov		r9, qword [rbp-3664]
		sub		r8, r9
		mov		qword [rbp-3672], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3680], r9
		mov		r8, qword [rbp-3680]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3680], r8
		mov		r9, qword [rbp-3680]
		mov		qword [rbp-3688], r9
		mov		r8, qword [rbp-3688]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3688], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3696], r9
		mov		r8, qword [rbp-3696]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3696], r8
		mov		r9, qword [rbp-3688]
		mov		qword [rbp-3704], r9
		mov		r8, qword [rbp-3704]
		mov		r9, qword [rbp-3696]
		sub		r8, r9
		mov		qword [rbp-3704], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3712], r9
		mov		r8, qword [rbp-3712]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3712], r8
		mov		r9, qword [rbp-3712]
		mov		qword [rbp-3720], r9
		mov		r8, qword [rbp-3720]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3720], r8
		mov		r9, qword [rbp-3704]
		mov		qword [rbp-3728], r9
		mov		r8, qword [rbp-3728]
		mov		r9, qword [rbp-3720]
		add		r8, r9
		mov		qword [rbp-3728], r8
		mov		r9, qword [rbp-3672]
		mov		qword [rbp-3736], r9
		mov		r8, qword [rbp-3736]
		mov		r9, qword [rbp-3728]
		add		r8, r9
		mov		qword [rbp-3736], r8
		mov		r9, qword [rbp-3624]
		mov		qword [rbp-3744], r9
		mov		r8, qword [rbp-3744]
		mov		r9, qword [rbp-3736]
		sub		r8, r9
		mov		qword [rbp-3744], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3752], r9
		mov		r8, qword [rbp-3752]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3752], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3760], r9
		mov		r8, qword [rbp-3760]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3760], r8
		mov		r9, qword [rbp-3760]
		mov		qword [rbp-3768], r9
		mov		r8, qword [rbp-3768]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3768], r8
		mov		r9, qword [rbp-3752]
		mov		qword [rbp-3776], r9
		mov		r8, qword [rbp-3776]
		mov		r9, qword [rbp-3768]
		add		r8, r9
		mov		qword [rbp-3776], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3784], r9
		mov		r8, qword [rbp-3784]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3784], r8
		mov		r9, qword [rbp-3776]
		mov		qword [rbp-3792], r9
		mov		r8, qword [rbp-3792]
		mov		r9, qword [rbp-3784]
		sub		r8, r9
		mov		qword [rbp-3792], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3800], r9
		mov		r8, qword [rbp-3800]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3800], r8
		mov		r11, qword [rbp-3800]
		mov		r9, qword [rel _global_B]
		add		r11, r9
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3808], r9
		mov		r8, qword [rbp-3808]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3808], r8
		mov		qword [rbp-3816], r11
		mov		r8, qword [rbp-3816]
		mov		r9, qword [rbp-3808]
		sub		r8, r9
		mov		qword [rbp-3816], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3824], r9
		mov		r8, qword [rbp-3824]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3824], r8
		mov		r9, qword [rbp-3824]
		mov		qword [rbp-3832], r9
		mov		r8, qword [rbp-3832]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3832], r8
		mov		r9, qword [rbp-3816]
		mov		qword [rbp-3840], r9
		mov		r8, qword [rbp-3840]
		mov		r9, qword [rbp-3832]
		add		r8, r9
		mov		qword [rbp-3840], r8
		mov		r9, qword [rbp-3792]
		mov		qword [rbp-3848], r9
		mov		r8, qword [rbp-3848]
		mov		r9, qword [rbp-3840]
		add		r8, r9
		mov		qword [rbp-3848], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3856], r9
		mov		r8, qword [rbp-3856]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3856], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3864], r9
		mov		r8, qword [rbp-3864]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3864], r8
		mov		r9, qword [rbp-3864]
		mov		qword [rbp-3872], r9
		mov		r8, qword [rbp-3872]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3872], r8
		mov		r9, qword [rbp-3856]
		mov		qword [rbp-3880], r9
		mov		r8, qword [rbp-3880]
		mov		r9, qword [rbp-3872]
		add		r8, r9
		mov		qword [rbp-3880], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3888], r9
		mov		r8, qword [rbp-3888]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3888], r8
		mov		r9, qword [rbp-3880]
		mov		qword [rbp-3896], r9
		mov		r8, qword [rbp-3896]
		mov		r9, qword [rbp-3888]
		sub		r8, r9
		mov		qword [rbp-3896], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3904], r9
		mov		r8, qword [rbp-3904]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3904], r8
		mov		r9, qword [rbp-3904]
		mov		qword [rbp-3912], r9
		mov		r8, qword [rbp-3912]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3912], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-3920], r9
		mov		r8, qword [rbp-3920]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3920], r8
		mov		r9, qword [rbp-3912]
		mov		qword [rbp-3928], r9
		mov		r8, qword [rbp-3928]
		mov		r9, qword [rbp-3920]
		sub		r8, r9
		mov		qword [rbp-3928], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-3936], r9
		mov		r8, qword [rbp-3936]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-3936], r8
		mov		r9, qword [rbp-3936]
		mov		qword [rbp-3944], r9
		mov		r8, qword [rbp-3944]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-3944], r8
		mov		r9, qword [rbp-3928]
		mov		qword [rbp-3952], r9
		mov		r8, qword [rbp-3952]
		mov		r9, qword [rbp-3944]
		add		r8, r9
		mov		qword [rbp-3952], r8
		mov		r9, qword [rbp-3896]
		mov		qword [rbp-3960], r9
		mov		r8, qword [rbp-3960]
		mov		r9, qword [rbp-3952]
		add		r8, r9
		mov		qword [rbp-3960], r8
		mov		r9, qword [rbp-3848]
		mov		qword [rbp-3968], r9
		mov		r8, qword [rbp-3968]
		mov		r9, qword [rbp-3960]
		sub		r8, r9
		mov		qword [rbp-3968], r8
		mov		r9, qword [rbp-3744]
		mov		qword [rbp-3976], r9
		mov		r8, qword [rbp-3976]
		mov		r9, qword [rbp-3968]
		sub		r8, r9
		mov		qword [rbp-3976], r8
		mov		r9, qword [rbp-3488]
		mov		qword [rbp-3984], r9
		mov		r8, qword [rbp-3984]
		mov		r9, qword [rbp-3976]
		add		r8, r9
		mov		qword [rbp-3984], r8
		mov		r9, qword [rbp-3016]
		mov		qword [rbp-3992], r9
		mov		r8, qword [rbp-3992]
		mov		r9, qword [rbp-3984]
		sub		r8, r9
		mov		qword [rbp-3992], r8
		mov		r9, qword [rbp-3992]
		mov		qword [rel _global_B], r9
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4000], r9
		mov		r8, qword [rbp-4000]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4000], r8
		mov		r9, qword [rbp-4000]
		mov		qword [rbp-4008], r9
		mov		r8, qword [rbp-4008]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4008], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4016], r9
		mov		r8, qword [rbp-4016]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4016], r8
		mov		r9, qword [rbp-4008]
		mov		qword [rbp-4024], r9
		mov		r8, qword [rbp-4024]
		mov		r9, qword [rbp-4016]
		sub		r8, r9
		mov		qword [rbp-4024], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4032], r9
		mov		r8, qword [rbp-4032]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4032], r8
		mov		r9, qword [rbp-4032]
		mov		qword [rbp-4040], r9
		mov		r8, qword [rbp-4040]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4040], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4048], r9
		mov		r8, qword [rbp-4048]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4048], r8
		mov		r9, qword [rbp-4040]
		mov		qword [rbp-4056], r9
		mov		r8, qword [rbp-4056]
		mov		r9, qword [rbp-4048]
		sub		r8, r9
		mov		qword [rbp-4056], r8
		mov		r9, qword [rbp-4024]
		mov		qword [rbp-4064], r9
		mov		r8, qword [rbp-4064]
		mov		r9, qword [rbp-4056]
		add		r8, r9
		mov		qword [rbp-4064], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4072], r9
		mov		r8, qword [rbp-4072]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4072], r8
		mov		r9, qword [rbp-4072]
		mov		qword [rbp-4080], r9
		mov		r8, qword [rbp-4080]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4080], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4088], r9
		mov		r8, qword [rbp-4088]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4088], r8
		mov		r9, qword [rbp-4080]
		mov		qword [rbp-4096], r9
		mov		r8, qword [rbp-4096]
		mov		r9, qword [rbp-4088]
		sub		r8, r9
		mov		qword [rbp-4096], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4104], r9
		mov		r8, qword [rbp-4104]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4104], r8
		mov		r9, qword [rbp-4104]
		mov		qword [rbp-4112], r9
		mov		r8, qword [rbp-4112]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4112], r8
		mov		r9, qword [rbp-4096]
		mov		qword [rbp-4120], r9
		mov		r8, qword [rbp-4120]
		mov		r9, qword [rbp-4112]
		add		r8, r9
		mov		qword [rbp-4120], r8
		mov		r9, qword [rbp-4064]
		mov		qword [rbp-4128], r9
		mov		r8, qword [rbp-4128]
		mov		r9, qword [rbp-4120]
		add		r8, r9
		mov		qword [rbp-4128], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4136], r9
		mov		r8, qword [rbp-4136]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4136], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4144], r9
		mov		r8, qword [rbp-4144]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4144], r8
		mov		r9, qword [rbp-4144]
		mov		qword [rbp-4152], r9
		mov		r8, qword [rbp-4152]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4152], r8
		mov		r9, qword [rbp-4136]
		mov		qword [rbp-4160], r9
		mov		r8, qword [rbp-4160]
		mov		r9, qword [rbp-4152]
		add		r8, r9
		mov		qword [rbp-4160], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4168], r9
		mov		r8, qword [rbp-4168]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4168], r8
		mov		r9, qword [rbp-4160]
		mov		qword [rbp-4176], r9
		mov		r8, qword [rbp-4176]
		mov		r9, qword [rbp-4168]
		sub		r8, r9
		mov		qword [rbp-4176], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4184], r9
		mov		r8, qword [rbp-4184]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4184], r8
		mov		r9, qword [rbp-4184]
		mov		qword [rbp-4192], r9
		mov		r8, qword [rbp-4192]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4192], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4200], r9
		mov		r8, qword [rbp-4200]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4200], r8
		mov		r9, qword [rbp-4192]
		mov		qword [rbp-4208], r9
		mov		r8, qword [rbp-4208]
		mov		r9, qword [rbp-4200]
		sub		r8, r9
		mov		qword [rbp-4208], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4216], r9
		mov		r8, qword [rbp-4216]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4216], r8
		mov		r9, qword [rbp-4216]
		mov		qword [rbp-4224], r9
		mov		r8, qword [rbp-4224]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4224], r8
		mov		r9, qword [rbp-4208]
		mov		qword [rbp-4232], r9
		mov		r8, qword [rbp-4232]
		mov		r9, qword [rbp-4224]
		add		r8, r9
		mov		qword [rbp-4232], r8
		mov		r13, qword [rbp-4176]
		mov		r9, qword [rbp-4232]
		add		r13, r9
		mov		r9, qword [rbp-4128]
		mov		qword [rbp-4240], r9
		mov		r8, qword [rbp-4240]
		sub		r8, r13
		mov		qword [rbp-4240], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4248], r9
		mov		r8, qword [rbp-4248]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4248], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4256], r9
		mov		r8, qword [rbp-4256]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4256], r8
		mov		r9, qword [rbp-4256]
		mov		qword [rbp-4264], r9
		mov		r8, qword [rbp-4264]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4264], r8
		mov		r9, qword [rbp-4248]
		mov		qword [rbp-4272], r9
		mov		r8, qword [rbp-4272]
		mov		r9, qword [rbp-4264]
		add		r8, r9
		mov		qword [rbp-4272], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4280], r9
		mov		r8, qword [rbp-4280]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4280], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4288], r9
		mov		r8, qword [rbp-4288]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4288], r8
		mov		r9, qword [rbp-4288]
		mov		qword [rbp-4296], r9
		mov		r8, qword [rbp-4296]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4296], r8
		mov		r9, qword [rbp-4280]
		mov		qword [rbp-4304], r9
		mov		r8, qword [rbp-4304]
		mov		r9, qword [rbp-4296]
		add		r8, r9
		mov		qword [rbp-4304], r8
		mov		r9, qword [rbp-4272]
		mov		qword [rbp-4312], r9
		mov		r8, qword [rbp-4312]
		mov		r9, qword [rbp-4304]
		sub		r8, r9
		mov		qword [rbp-4312], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4320], r9
		mov		r8, qword [rbp-4320]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4320], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4328], r9
		mov		r8, qword [rbp-4328]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4328], r8
		mov		r9, qword [rbp-4328]
		mov		qword [rbp-4336], r9
		mov		r8, qword [rbp-4336]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4336], r8
		mov		r9, qword [rbp-4320]
		mov		qword [rbp-4344], r9
		mov		r8, qword [rbp-4344]
		mov		r9, qword [rbp-4336]
		add		r8, r9
		mov		qword [rbp-4344], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4352], r9
		mov		r8, qword [rbp-4352]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4352], r8
		mov		r9, qword [rbp-4344]
		mov		qword [rbp-4360], r9
		mov		r8, qword [rbp-4360]
		mov		r9, qword [rbp-4352]
		sub		r8, r9
		mov		qword [rbp-4360], r8
		mov		r9, qword [rbp-4312]
		mov		qword [rbp-4368], r9
		mov		r8, qword [rbp-4368]
		mov		r9, qword [rbp-4360]
		sub		r8, r9
		mov		qword [rbp-4368], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4376], r9
		mov		r8, qword [rbp-4376]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4376], r8
		mov		r9, qword [rbp-4376]
		mov		qword [rbp-4384], r9
		mov		r8, qword [rbp-4384]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4384], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4392], r9
		mov		r8, qword [rbp-4392]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4392], r8
		mov		r9, qword [rbp-4384]
		mov		qword [rbp-4400], r9
		mov		r8, qword [rbp-4400]
		mov		r9, qword [rbp-4392]
		sub		r8, r9
		mov		qword [rbp-4400], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4408], r9
		mov		r8, qword [rbp-4408]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4408], r8
		mov		r9, qword [rbp-4408]
		mov		qword [rbp-4416], r9
		mov		r8, qword [rbp-4416]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4416], r8
		mov		r9, qword [rbp-4400]
		mov		qword [rbp-4424], r9
		mov		r8, qword [rbp-4424]
		mov		r9, qword [rbp-4416]
		add		r8, r9
		mov		qword [rbp-4424], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4432], r9
		mov		r8, qword [rbp-4432]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4432], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4440], r9
		mov		r8, qword [rbp-4440]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4440], r8
		mov		r9, qword [rbp-4440]
		mov		qword [rbp-4448], r9
		mov		r8, qword [rbp-4448]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4448], r8
		mov		r9, qword [rbp-4432]
		mov		qword [rbp-4456], r9
		mov		r8, qword [rbp-4456]
		mov		r9, qword [rbp-4448]
		add		r8, r9
		mov		qword [rbp-4456], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4464], r9
		mov		r8, qword [rbp-4464]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4464], r8
		mov		r9, qword [rbp-4456]
		mov		qword [rbp-4472], r9
		mov		r8, qword [rbp-4472]
		mov		r9, qword [rbp-4464]
		sub		r8, r9
		mov		qword [rbp-4472], r8
		mov		r9, qword [rbp-4424]
		mov		qword [rbp-4480], r9
		mov		r8, qword [rbp-4480]
		mov		r9, qword [rbp-4472]
		sub		r8, r9
		mov		qword [rbp-4480], r8
		mov		r9, qword [rbp-4368]
		mov		qword [rbp-4488], r9
		mov		r8, qword [rbp-4488]
		mov		r9, qword [rbp-4480]
		add		r8, r9
		mov		qword [rbp-4488], r8
		mov		r9, qword [rbp-4240]
		mov		qword [rbp-4496], r9
		mov		r8, qword [rbp-4496]
		mov		r9, qword [rbp-4488]
		sub		r8, r9
		mov		qword [rbp-4496], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4504], r9
		mov		r8, qword [rbp-4504]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4504], r8
		mov		r9, qword [rbp-4504]
		mov		qword [rbp-4512], r9
		mov		r8, qword [rbp-4512]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4512], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4520], r9
		mov		r8, qword [rbp-4520]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4520], r8
		mov		r9, qword [rbp-4512]
		mov		qword [rbp-4528], r9
		mov		r8, qword [rbp-4528]
		mov		r9, qword [rbp-4520]
		sub		r8, r9
		mov		qword [rbp-4528], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4536], r9
		mov		r8, qword [rbp-4536]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4536], r8
		mov		r9, qword [rbp-4536]
		mov		qword [rbp-4544], r9
		mov		r8, qword [rbp-4544]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4544], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4552], r9
		mov		r8, qword [rbp-4552]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4552], r8
		mov		r9, qword [rbp-4544]
		mov		qword [rbp-4560], r9
		mov		r8, qword [rbp-4560]
		mov		r9, qword [rbp-4552]
		sub		r8, r9
		mov		qword [rbp-4560], r8
		mov		r9, qword [rbp-4528]
		mov		qword [rbp-4568], r9
		mov		r8, qword [rbp-4568]
		mov		r9, qword [rbp-4560]
		add		r8, r9
		mov		qword [rbp-4568], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4576], r9
		mov		r8, qword [rbp-4576]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4576], r8
		mov		r9, qword [rbp-4576]
		mov		qword [rbp-4584], r9
		mov		r8, qword [rbp-4584]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4584], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4592], r9
		mov		r8, qword [rbp-4592]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4592], r8
		mov		r9, qword [rbp-4584]
		mov		qword [rbp-4600], r9
		mov		r8, qword [rbp-4600]
		mov		r9, qword [rbp-4592]
		sub		r8, r9
		mov		qword [rbp-4600], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4608], r9
		mov		r8, qword [rbp-4608]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4608], r8
		mov		r9, qword [rbp-4608]
		mov		qword [rbp-4616], r9
		mov		r8, qword [rbp-4616]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4616], r8
		mov		r9, qword [rbp-4600]
		mov		qword [rbp-4624], r9
		mov		r8, qword [rbp-4624]
		mov		r9, qword [rbp-4616]
		add		r8, r9
		mov		qword [rbp-4624], r8
		mov		r9, qword [rbp-4568]
		mov		qword [rbp-4632], r9
		mov		r8, qword [rbp-4632]
		mov		r9, qword [rbp-4624]
		add		r8, r9
		mov		qword [rbp-4632], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4640], r9
		mov		r8, qword [rbp-4640]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4640], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4648], r9
		mov		r8, qword [rbp-4648]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4648], r8
		mov		r9, qword [rbp-4648]
		mov		qword [rbp-4656], r9
		mov		r8, qword [rbp-4656]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4656], r8
		mov		r9, qword [rbp-4640]
		mov		qword [rbp-4664], r9
		mov		r8, qword [rbp-4664]
		mov		r9, qword [rbp-4656]
		add		r8, r9
		mov		qword [rbp-4664], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4672], r9
		mov		r8, qword [rbp-4672]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4672], r8
		mov		r9, qword [rbp-4664]
		mov		qword [rbp-4680], r9
		mov		r8, qword [rbp-4680]
		mov		r9, qword [rbp-4672]
		sub		r8, r9
		mov		qword [rbp-4680], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4688], r9
		mov		r8, qword [rbp-4688]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4688], r8
		mov		r9, qword [rbp-4688]
		mov		qword [rbp-4696], r9
		mov		r8, qword [rbp-4696]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4696], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4704], r9
		mov		r8, qword [rbp-4704]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4704], r8
		mov		r9, qword [rbp-4696]
		mov		qword [rbp-4712], r9
		mov		r8, qword [rbp-4712]
		mov		r9, qword [rbp-4704]
		sub		r8, r9
		mov		qword [rbp-4712], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4720], r9
		mov		r8, qword [rbp-4720]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4720], r8
		mov		r9, qword [rbp-4720]
		mov		qword [rbp-4728], r9
		mov		r8, qword [rbp-4728]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4728], r8
		mov		r9, qword [rbp-4712]
		mov		qword [rbp-4736], r9
		mov		r8, qword [rbp-4736]
		mov		r9, qword [rbp-4728]
		add		r8, r9
		mov		qword [rbp-4736], r8
		mov		r9, qword [rbp-4680]
		mov		qword [rbp-4744], r9
		mov		r8, qword [rbp-4744]
		mov		r9, qword [rbp-4736]
		add		r8, r9
		mov		qword [rbp-4744], r8
		mov		r9, qword [rbp-4632]
		mov		qword [rbp-4752], r9
		mov		r8, qword [rbp-4752]
		mov		r9, qword [rbp-4744]
		sub		r8, r9
		mov		qword [rbp-4752], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4760], r9
		mov		r8, qword [rbp-4760]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4760], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4768], r9
		mov		r8, qword [rbp-4768]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4768], r8
		mov		r9, qword [rbp-4768]
		mov		qword [rbp-4776], r9
		mov		r8, qword [rbp-4776]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4776], r8
		mov		r9, qword [rbp-4760]
		mov		qword [rbp-4784], r9
		mov		r8, qword [rbp-4784]
		mov		r9, qword [rbp-4776]
		add		r8, r9
		mov		qword [rbp-4784], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4792], r9
		mov		r8, qword [rbp-4792]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4792], r8
		mov		r9, qword [rbp-4784]
		mov		qword [rbp-4800], r9
		mov		r8, qword [rbp-4800]
		mov		r9, qword [rbp-4792]
		sub		r8, r9
		mov		qword [rbp-4800], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4808], r9
		mov		r8, qword [rbp-4808]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4808], r8
		mov		r9, qword [rbp-4808]
		mov		qword [rbp-4816], r9
		mov		r8, qword [rbp-4816]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4816], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4824], r9
		mov		r8, qword [rbp-4824]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4824], r8
		mov		r9, qword [rbp-4816]
		mov		qword [rbp-4832], r9
		mov		r8, qword [rbp-4832]
		mov		r9, qword [rbp-4824]
		sub		r8, r9
		mov		qword [rbp-4832], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4840], r9
		mov		r8, qword [rbp-4840]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4840], r8
		mov		r9, qword [rbp-4840]
		mov		qword [rbp-4848], r9
		mov		r8, qword [rbp-4848]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4848], r8
		mov		r9, qword [rbp-4832]
		mov		qword [rbp-4856], r9
		mov		r8, qword [rbp-4856]
		mov		r9, qword [rbp-4848]
		add		r8, r9
		mov		qword [rbp-4856], r8
		mov		r9, qword [rbp-4800]
		mov		qword [rbp-4864], r9
		mov		r8, qword [rbp-4864]
		mov		r9, qword [rbp-4856]
		add		r8, r9
		mov		qword [rbp-4864], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4872], r9
		mov		r8, qword [rbp-4872]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4872], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4880], r9
		mov		r8, qword [rbp-4880]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4880], r8
		mov		r9, qword [rbp-4880]
		mov		qword [rbp-4888], r9
		mov		r8, qword [rbp-4888]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4888], r8
		mov		r9, qword [rbp-4872]
		mov		qword [rbp-4896], r9
		mov		r8, qword [rbp-4896]
		mov		r9, qword [rbp-4888]
		add		r8, r9
		mov		qword [rbp-4896], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4904], r9
		mov		r8, qword [rbp-4904]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4904], r8
		mov		r9, qword [rbp-4896]
		mov		qword [rbp-4912], r9
		mov		r8, qword [rbp-4912]
		mov		r9, qword [rbp-4904]
		sub		r8, r9
		mov		qword [rbp-4912], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4920], r9
		mov		r8, qword [rbp-4920]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4920], r8
		mov		r9, qword [rbp-4920]
		mov		qword [rbp-4928], r9
		mov		r8, qword [rbp-4928]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4928], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-4936], r9
		mov		r8, qword [rbp-4936]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4936], r8
		mov		r9, qword [rbp-4928]
		mov		qword [rbp-4944], r9
		mov		r8, qword [rbp-4944]
		mov		r9, qword [rbp-4936]
		sub		r8, r9
		mov		qword [rbp-4944], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-4952], r9
		mov		r8, qword [rbp-4952]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-4952], r8
		mov		r9, qword [rbp-4952]
		mov		qword [rbp-4960], r9
		mov		r8, qword [rbp-4960]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-4960], r8
		mov		r9, qword [rbp-4944]
		mov		qword [rbp-4968], r9
		mov		r8, qword [rbp-4968]
		mov		r9, qword [rbp-4960]
		add		r8, r9
		mov		qword [rbp-4968], r8
		mov		r9, qword [rbp-4912]
		mov		qword [rbp-4976], r9
		mov		r8, qword [rbp-4976]
		mov		r9, qword [rbp-4968]
		add		r8, r9
		mov		qword [rbp-4976], r8
		mov		r9, qword [rbp-4864]
		mov		qword [rbp-4984], r9
		mov		r8, qword [rbp-4984]
		mov		r9, qword [rbp-4976]
		sub		r8, r9
		mov		qword [rbp-4984], r8
		mov		r9, qword [rbp-4752]
		mov		qword [rbp-4992], r9
		mov		r8, qword [rbp-4992]
		mov		r9, qword [rbp-4984]
		sub		r8, r9
		mov		qword [rbp-4992], r8
		mov		r9, qword [rbp-4496]
		mov		qword [rbp-5000], r9
		mov		r8, qword [rbp-5000]
		mov		r9, qword [rbp-4992]
		add		r8, r9
		mov		qword [rbp-5000], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5008], r9
		mov		r8, qword [rbp-5008]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5008], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5016], r9
		mov		r8, qword [rbp-5016]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5016], r8
		mov		r9, qword [rbp-5016]
		mov		qword [rbp-5024], r9
		mov		r8, qword [rbp-5024]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5024], r8
		mov		r9, qword [rbp-5008]
		mov		qword [rbp-5032], r9
		mov		r8, qword [rbp-5032]
		mov		r9, qword [rbp-5024]
		add		r8, r9
		mov		qword [rbp-5032], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5040], r9
		mov		r8, qword [rbp-5040]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5040], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5048], r9
		mov		r8, qword [rbp-5048]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5048], r8
		mov		r9, qword [rbp-5048]
		mov		qword [rbp-5056], r9
		mov		r8, qword [rbp-5056]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5056], r8
		mov		r9, qword [rbp-5040]
		mov		qword [rbp-5064], r9
		mov		r8, qword [rbp-5064]
		mov		r9, qword [rbp-5056]
		add		r8, r9
		mov		qword [rbp-5064], r8
		mov		r9, qword [rbp-5032]
		mov		qword [rbp-5072], r9
		mov		r8, qword [rbp-5072]
		mov		r9, qword [rbp-5064]
		sub		r8, r9
		mov		qword [rbp-5072], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5080], r9
		mov		r8, qword [rbp-5080]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5080], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5088], r9
		mov		r8, qword [rbp-5088]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5088], r8
		mov		r9, qword [rbp-5088]
		mov		qword [rbp-5096], r9
		mov		r8, qword [rbp-5096]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5096], r8
		mov		r9, qword [rbp-5080]
		mov		qword [rbp-5104], r9
		mov		r8, qword [rbp-5104]
		mov		r9, qword [rbp-5096]
		add		r8, r9
		mov		qword [rbp-5104], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5112], r9
		mov		r8, qword [rbp-5112]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5112], r8
		mov		r9, qword [rbp-5104]
		mov		qword [rbp-5120], r9
		mov		r8, qword [rbp-5120]
		mov		r9, qword [rbp-5112]
		sub		r8, r9
		mov		qword [rbp-5120], r8
		mov		r9, qword [rbp-5072]
		mov		qword [rbp-5128], r9
		mov		r8, qword [rbp-5128]
		mov		r9, qword [rbp-5120]
		sub		r8, r9
		mov		qword [rbp-5128], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5136], r9
		mov		r8, qword [rbp-5136]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5136], r8
		mov		r9, qword [rbp-5136]
		mov		qword [rbp-5144], r9
		mov		r8, qword [rbp-5144]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5144], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5152], r9
		mov		r8, qword [rbp-5152]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5152], r8
		mov		r9, qword [rbp-5144]
		mov		qword [rbp-5160], r9
		mov		r8, qword [rbp-5160]
		mov		r9, qword [rbp-5152]
		sub		r8, r9
		mov		qword [rbp-5160], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5168], r9
		mov		r8, qword [rbp-5168]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5168], r8
		mov		r9, qword [rbp-5168]
		mov		qword [rbp-5176], r9
		mov		r8, qword [rbp-5176]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5176], r8
		mov		r9, qword [rbp-5160]
		mov		qword [rbp-5184], r9
		mov		r8, qword [rbp-5184]
		mov		r9, qword [rbp-5176]
		add		r8, r9
		mov		qword [rbp-5184], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5192], r9
		mov		r8, qword [rbp-5192]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5192], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5200], r9
		mov		r8, qword [rbp-5200]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5200], r8
		mov		r9, qword [rbp-5200]
		mov		qword [rbp-5208], r9
		mov		r8, qword [rbp-5208]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5208], r8
		mov		r9, qword [rbp-5192]
		mov		qword [rbp-5216], r9
		mov		r8, qword [rbp-5216]
		mov		r9, qword [rbp-5208]
		add		r8, r9
		mov		qword [rbp-5216], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5224], r9
		mov		r8, qword [rbp-5224]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5224], r8
		mov		r9, qword [rbp-5216]
		mov		qword [rbp-5232], r9
		mov		r8, qword [rbp-5232]
		mov		r9, qword [rbp-5224]
		sub		r8, r9
		mov		qword [rbp-5232], r8
		mov		r9, qword [rbp-5184]
		mov		qword [rbp-5240], r9
		mov		r8, qword [rbp-5240]
		mov		r9, qword [rbp-5232]
		sub		r8, r9
		mov		qword [rbp-5240], r8
		mov		r9, qword [rbp-5128]
		mov		qword [rbp-5248], r9
		mov		r8, qword [rbp-5248]
		mov		r9, qword [rbp-5240]
		add		r8, r9
		mov		qword [rbp-5248], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5256], r9
		mov		r8, qword [rbp-5256]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5256], r8
		mov		r9, qword [rbp-5256]
		mov		qword [rbp-5264], r9
		mov		r8, qword [rbp-5264]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5264], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5272], r9
		mov		r8, qword [rbp-5272]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5272], r8
		mov		r9, qword [rbp-5264]
		mov		qword [rbp-5280], r9
		mov		r8, qword [rbp-5280]
		mov		r9, qword [rbp-5272]
		sub		r8, r9
		mov		qword [rbp-5280], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5288], r9
		mov		r8, qword [rbp-5288]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5288], r8
		mov		r9, qword [rbp-5288]
		mov		qword [rbp-5296], r9
		mov		r8, qword [rbp-5296]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5296], r8
		mov		r9, qword [rbp-5280]
		mov		qword [rbp-5304], r9
		mov		r8, qword [rbp-5304]
		mov		r9, qword [rbp-5296]
		add		r8, r9
		mov		qword [rbp-5304], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5312], r9
		mov		r8, qword [rbp-5312]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5312], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5320], r9
		mov		r8, qword [rbp-5320]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5320], r8
		mov		r9, qword [rbp-5320]
		mov		qword [rbp-5328], r9
		mov		r8, qword [rbp-5328]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5328], r8
		mov		r9, qword [rbp-5312]
		mov		qword [rbp-5336], r9
		mov		r8, qword [rbp-5336]
		mov		r9, qword [rbp-5328]
		add		r8, r9
		mov		qword [rbp-5336], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5344], r9
		mov		r8, qword [rbp-5344]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5344], r8
		mov		r9, qword [rbp-5336]
		mov		qword [rbp-5352], r9
		mov		r8, qword [rbp-5352]
		mov		r9, qword [rbp-5344]
		sub		r8, r9
		mov		qword [rbp-5352], r8
		mov		r9, qword [rbp-5304]
		mov		qword [rbp-5360], r9
		mov		r8, qword [rbp-5360]
		mov		r9, qword [rbp-5352]
		sub		r8, r9
		mov		qword [rbp-5360], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5368], r9
		mov		r8, qword [rbp-5368]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5368], r8
		mov		r9, qword [rbp-5368]
		mov		qword [rbp-5376], r9
		mov		r8, qword [rbp-5376]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5376], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5384], r9
		mov		r8, qword [rbp-5384]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5384], r8
		mov		r9, qword [rbp-5376]
		mov		qword [rbp-5392], r9
		mov		r8, qword [rbp-5392]
		mov		r9, qword [rbp-5384]
		sub		r8, r9
		mov		qword [rbp-5392], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5400], r9
		mov		r8, qword [rbp-5400]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5400], r8
		mov		r9, qword [rbp-5400]
		mov		qword [rbp-5408], r9
		mov		r8, qword [rbp-5408]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5408], r8
		mov		r9, qword [rbp-5392]
		mov		qword [rbp-5416], r9
		mov		r8, qword [rbp-5416]
		mov		r9, qword [rbp-5408]
		add		r8, r9
		mov		qword [rbp-5416], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5424], r9
		mov		r8, qword [rbp-5424]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5424], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5432], r9
		mov		r8, qword [rbp-5432]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5432], r8
		mov		r9, qword [rbp-5432]
		mov		qword [rbp-5440], r9
		mov		r8, qword [rbp-5440]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5440], r8
		mov		r9, qword [rbp-5424]
		mov		qword [rbp-5448], r9
		mov		r8, qword [rbp-5448]
		mov		r9, qword [rbp-5440]
		add		r8, r9
		mov		qword [rbp-5448], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5456], r9
		mov		r8, qword [rbp-5456]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5456], r8
		mov		r9, qword [rbp-5448]
		mov		qword [rbp-5464], r9
		mov		r8, qword [rbp-5464]
		mov		r9, qword [rbp-5456]
		sub		r8, r9
		mov		qword [rbp-5464], r8
		mov		r9, qword [rbp-5416]
		mov		qword [rbp-5472], r9
		mov		r8, qword [rbp-5472]
		mov		r9, qword [rbp-5464]
		sub		r8, r9
		mov		qword [rbp-5472], r8
		mov		r9, qword [rbp-5360]
		mov		qword [rbp-5480], r9
		mov		r8, qword [rbp-5480]
		mov		r9, qword [rbp-5472]
		add		r8, r9
		mov		qword [rbp-5480], r8
		mov		r9, qword [rbp-5248]
		mov		qword [rbp-5488], r9
		mov		r8, qword [rbp-5488]
		mov		r9, qword [rbp-5480]
		add		r8, r9
		mov		qword [rbp-5488], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5496], r9
		mov		r8, qword [rbp-5496]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5496], r8
		mov		r9, qword [rbp-5496]
		mov		qword [rbp-5504], r9
		mov		r8, qword [rbp-5504]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5504], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5512], r9
		mov		r8, qword [rbp-5512]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5512], r8
		mov		r9, qword [rbp-5504]
		mov		qword [rbp-5520], r9
		mov		r8, qword [rbp-5520]
		mov		r9, qword [rbp-5512]
		sub		r8, r9
		mov		qword [rbp-5520], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5528], r9
		mov		r8, qword [rbp-5528]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5528], r8
		mov		r9, qword [rbp-5528]
		mov		qword [rbp-5536], r9
		mov		r8, qword [rbp-5536]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5536], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5544], r9
		mov		r8, qword [rbp-5544]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5544], r8
		mov		r9, qword [rbp-5536]
		mov		qword [rbp-5552], r9
		mov		r8, qword [rbp-5552]
		mov		r9, qword [rbp-5544]
		sub		r8, r9
		mov		qword [rbp-5552], r8
		mov		r9, qword [rbp-5520]
		mov		qword [rbp-5560], r9
		mov		r8, qword [rbp-5560]
		mov		r9, qword [rbp-5552]
		add		r8, r9
		mov		qword [rbp-5560], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5568], r9
		mov		r8, qword [rbp-5568]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5568], r8
		mov		r9, qword [rbp-5568]
		mov		qword [rbp-5576], r9
		mov		r8, qword [rbp-5576]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5576], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5584], r9
		mov		r8, qword [rbp-5584]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5584], r8
		mov		r9, qword [rbp-5576]
		mov		qword [rbp-5592], r9
		mov		r8, qword [rbp-5592]
		mov		r9, qword [rbp-5584]
		sub		r8, r9
		mov		qword [rbp-5592], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5600], r9
		mov		r8, qword [rbp-5600]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5600], r8
		mov		r9, qword [rbp-5600]
		mov		qword [rbp-5608], r9
		mov		r8, qword [rbp-5608]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5608], r8
		mov		r9, qword [rbp-5592]
		mov		qword [rbp-5616], r9
		mov		r8, qword [rbp-5616]
		mov		r9, qword [rbp-5608]
		add		r8, r9
		mov		qword [rbp-5616], r8
		mov		r9, qword [rbp-5560]
		mov		qword [rbp-5624], r9
		mov		r8, qword [rbp-5624]
		mov		r9, qword [rbp-5616]
		add		r8, r9
		mov		qword [rbp-5624], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5632], r9
		mov		r8, qword [rbp-5632]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5632], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5640], r9
		mov		r8, qword [rbp-5640]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5640], r8
		mov		r9, qword [rbp-5640]
		mov		qword [rbp-5648], r9
		mov		r8, qword [rbp-5648]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5648], r8
		mov		r9, qword [rbp-5632]
		mov		qword [rbp-5656], r9
		mov		r8, qword [rbp-5656]
		mov		r9, qword [rbp-5648]
		add		r8, r9
		mov		qword [rbp-5656], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5664], r9
		mov		r8, qword [rbp-5664]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5664], r8
		mov		r9, qword [rbp-5656]
		mov		qword [rbp-5672], r9
		mov		r8, qword [rbp-5672]
		mov		r9, qword [rbp-5664]
		sub		r8, r9
		mov		qword [rbp-5672], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5680], r9
		mov		r8, qword [rbp-5680]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5680], r8
		mov		r9, qword [rbp-5680]
		mov		qword [rbp-5688], r9
		mov		r8, qword [rbp-5688]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5688], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5696], r9
		mov		r8, qword [rbp-5696]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5696], r8
		mov		r9, qword [rbp-5688]
		mov		qword [rbp-5704], r9
		mov		r8, qword [rbp-5704]
		mov		r9, qword [rbp-5696]
		sub		r8, r9
		mov		qword [rbp-5704], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5712], r9
		mov		r8, qword [rbp-5712]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5712], r8
		mov		r9, qword [rbp-5712]
		mov		qword [rbp-5720], r9
		mov		r8, qword [rbp-5720]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5720], r8
		mov		r9, qword [rbp-5704]
		mov		qword [rbp-5728], r9
		mov		r8, qword [rbp-5728]
		mov		r9, qword [rbp-5720]
		add		r8, r9
		mov		qword [rbp-5728], r8
		mov		r9, qword [rbp-5672]
		mov		qword [rbp-5736], r9
		mov		r8, qword [rbp-5736]
		mov		r9, qword [rbp-5728]
		add		r8, r9
		mov		qword [rbp-5736], r8
		mov		r9, qword [rbp-5624]
		mov		qword [rbp-5744], r9
		mov		r8, qword [rbp-5744]
		mov		r9, qword [rbp-5736]
		sub		r8, r9
		mov		qword [rbp-5744], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5752], r9
		mov		r8, qword [rbp-5752]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5752], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5760], r9
		mov		r8, qword [rbp-5760]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5760], r8
		mov		r9, qword [rbp-5760]
		mov		qword [rbp-5768], r9
		mov		r8, qword [rbp-5768]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5768], r8
		mov		r9, qword [rbp-5752]
		mov		qword [rbp-5776], r9
		mov		r8, qword [rbp-5776]
		mov		r9, qword [rbp-5768]
		add		r8, r9
		mov		qword [rbp-5776], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5784], r9
		mov		r8, qword [rbp-5784]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5784], r8
		mov		r9, qword [rbp-5776]
		mov		qword [rbp-5792], r9
		mov		r8, qword [rbp-5792]
		mov		r9, qword [rbp-5784]
		sub		r8, r9
		mov		qword [rbp-5792], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5800], r9
		mov		r8, qword [rbp-5800]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5800], r8
		mov		r9, qword [rbp-5800]
		mov		qword [rbp-5808], r9
		mov		r8, qword [rbp-5808]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5808], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5816], r9
		mov		r8, qword [rbp-5816]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5816], r8
		mov		r9, qword [rbp-5808]
		mov		qword [rbp-5824], r9
		mov		r8, qword [rbp-5824]
		mov		r9, qword [rbp-5816]
		sub		r8, r9
		mov		qword [rbp-5824], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5832], r9
		mov		r8, qword [rbp-5832]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5832], r8
		mov		r9, qword [rbp-5832]
		mov		qword [rbp-5840], r9
		mov		r8, qword [rbp-5840]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5840], r8
		mov		r9, qword [rbp-5824]
		mov		qword [rbp-5848], r9
		mov		r8, qword [rbp-5848]
		mov		r9, qword [rbp-5840]
		add		r8, r9
		mov		qword [rbp-5848], r8
		mov		r9, qword [rbp-5792]
		mov		qword [rbp-5856], r9
		mov		r8, qword [rbp-5856]
		mov		r9, qword [rbp-5848]
		add		r8, r9
		mov		qword [rbp-5856], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5864], r9
		mov		r8, qword [rbp-5864]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5864], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5872], r9
		mov		r8, qword [rbp-5872]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5872], r8
		mov		r9, qword [rbp-5872]
		mov		qword [rbp-5880], r9
		mov		r8, qword [rbp-5880]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5880], r8
		mov		r9, qword [rbp-5864]
		mov		qword [rbp-5888], r9
		mov		r8, qword [rbp-5888]
		mov		r9, qword [rbp-5880]
		add		r8, r9
		mov		qword [rbp-5888], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5896], r9
		mov		r8, qword [rbp-5896]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5896], r8
		mov		r9, qword [rbp-5888]
		mov		qword [rbp-5904], r9
		mov		r8, qword [rbp-5904]
		mov		r9, qword [rbp-5896]
		sub		r8, r9
		mov		qword [rbp-5904], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5912], r9
		mov		r8, qword [rbp-5912]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5912], r8
		mov		r9, qword [rbp-5912]
		mov		qword [rbp-5920], r9
		mov		r8, qword [rbp-5920]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5920], r8
		mov		r9, qword [rel _global_A]
		mov		qword [rbp-5928], r9
		mov		r8, qword [rbp-5928]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5928], r8
		mov		r9, qword [rbp-5920]
		mov		qword [rbp-5936], r9
		mov		r8, qword [rbp-5936]
		mov		r9, qword [rbp-5928]
		sub		r8, r9
		mov		qword [rbp-5936], r8
		mov		r9, qword [rel _global_C]
		mov		qword [rbp-5944], r9
		mov		r8, qword [rbp-5944]
		mov		r9, qword [rel _global_A]
		sub		r8, r9
		mov		qword [rbp-5944], r8
		mov		r9, qword [rbp-5944]
		mov		qword [rbp-5952], r9
		mov		r8, qword [rbp-5952]
		mov		r9, qword [rel _global_B]
		add		r8, r9
		mov		qword [rbp-5952], r8
		mov		r9, qword [rbp-5936]
		mov		qword [rbp-5960], r9
		mov		r8, qword [rbp-5960]
		mov		r9, qword [rbp-5952]
		add		r8, r9
		mov		qword [rbp-5960], r8
		mov		r9, qword [rbp-5904]
		mov		qword [rbp-5968], r9
		mov		r8, qword [rbp-5968]
		mov		r9, qword [rbp-5960]
		add		r8, r9
		mov		qword [rbp-5968], r8
		mov		r9, qword [rbp-5856]
		mov		qword [rbp-5976], r9
		mov		r8, qword [rbp-5976]
		mov		r9, qword [rbp-5968]
		sub		r8, r9
		mov		qword [rbp-5976], r8
		mov		r9, qword [rbp-5744]
		mov		qword [rbp-5984], r9
		mov		r8, qword [rbp-5984]
		mov		r9, qword [rbp-5976]
		sub		r8, r9
		mov		qword [rbp-5984], r8
		mov		r9, qword [rbp-5488]
		mov		qword [rbp-5992], r9
		mov		r8, qword [rbp-5992]
		mov		r9, qword [rbp-5984]
		add		r8, r9
		mov		qword [rbp-5992], r8
		mov		r9, qword [rbp-5000]
		mov		qword [rbp-6000], r9
		mov		r8, qword [rbp-6000]
		mov		r9, qword [rbp-5992]
		sub		r8, r9
		mov		qword [rbp-6000], r8
		mov		r9, qword [rbp-6000]
		mov		qword [rel _global_C], r9
loop_cond_0:
		mov		qword [rbp-6008], 1
		mov		r8, qword [rbp-6008]
		sal		r8, 29
		mov		qword [rbp-6008], r8
		mov		r9, qword [rbp-6008]
		cmp		qword [rel _global_C], r9
		jge		loop_end_0
		mov		qword [rbp-6016], 1
		mov		r8, qword [rbp-6016]
		sal		r8, 29
		mov		qword [rbp-6016], r8
		mov		r9, qword [rbp-6016]
		mov		qword [rbp-6024], r9
		neg		qword [rbp-6024]
		mov		r9, qword [rbp-6024]
		cmp		qword [rel _global_C], r9
		jg		loop_body_0
		jle		loop_end_0
loop_end_0:
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
		mov		rdi, qword [rel _global_A]
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
		mov		qword [rbp-6032], rax
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
		mov		rdi, qword [rbp-6032]
		mov		rsi, str_const_0
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
		mov		qword [rbp-6040], rax
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
		mov		rdi, qword [rel _global_B]
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
		mov		qword [rbp-6048], rax
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
		mov		rdi, qword [rbp-6040]
		mov		rsi, qword [rbp-6048]
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
		mov		qword [rbp-6056], rax
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
		mov		rdi, qword [rbp-6056]
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
		mov		qword [rbp-6064], rax
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
		mov		rdi, qword [rel _global_C]
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
		mov		qword [rbp-6072], rax
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
		mov		rdi, qword [rbp-6064]
		mov		rsi, qword [rbp-6072]
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
		mov		qword [rbp-6080], rax
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
		mov		rdi, qword [rbp-6080]
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

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

_global_A:
		dq 0
_global_B:
		dq 0
_global_C:
		dq 0
	dq	1
str_const_0:
	db	32, 0

	dq	1
str_const_1:
	db	32, 0

intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
