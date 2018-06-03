default rel

global string_length
global string_ord
global string_substring
global string_parseInt
global main
global hex2int
global int2chr
global toStringHex
global rotate_left
global add
global lohi
global sha1
global computeSHA1
global nextLetter
global nextText
global array_equal
global crackSHA1
global print
global toString
global addString__
global println
global getInt
global getString

global _global_asciiTable
global _global_MAXCHUNK
global _global_MAXLENGTH
global _global_chunks
global _global_inputBuffer
global _global_outputBuffer

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
		sub		rsp, 48
		mov		rsi, str_const_0
		mov		qword [rel _global_asciiTable], rsi
		mov		qword [rel _global_MAXCHUNK], 100
		mov		r11, qword [rel _global_MAXCHUNK]
		sub		r11, 1
		imul		r11, 64
		sub		r11, 16
		mov		qword [rel _global_MAXLENGTH], r11
		mov		rdi, qword [rel _global_MAXCHUNK]
		inc		rdi
		imul		rdi, 8
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
		mov		rdi, rdi
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
		mov		r9, rax
		mov		rdi, qword [rel _global_MAXCHUNK]
		mov		qword [rax+0], rdi
		mov		r11, 0
		jmp		loop_cond_0
loop_body_0:
		mov		rbx, r9
		mov		rcx, r11
		mov		rdi, 80
		inc		rdi
		imul		rdi, 8
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
		mov		rdi, rdi
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
		mov		qword [rbx+rcx*8+8], rax
		mov		rdi, 80
		mov		qword [rax+0], rdi
		mov		r8, 0
		jmp		loop_cond_1
loop_body_1:
		inc		r8
loop_cond_1:
		cmp		r8, 80
		jl		loop_body_1
loop_end_1:
		inc		r11
loop_cond_0:
		mov		rsi, qword [rel _global_MAXCHUNK]
		cmp		r11, rsi
		jl		loop_body_0
loop_end_0:
		mov		qword [rel _global_chunks], r9
		mov		rdi, qword [rel _global_MAXLENGTH]
		inc		rdi
		imul		rdi, 8
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
		mov		rdi, rdi
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
		mov		r11, rax
		mov		rdi, qword [rel _global_MAXLENGTH]
		mov		qword [rax+0], rdi
		mov		r9, 0
		jmp		loop_cond_2
loop_body_2:
		inc		r9
loop_cond_2:
		mov		rsi, qword [rel _global_MAXLENGTH]
		cmp		r9, rsi
		jl		loop_body_2
loop_end_2:
		mov		qword [rel _global_inputBuffer], r11
		mov		rdi, 5
		inc		rdi
		imul		rdi, 8
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
		mov		rdi, rdi
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
		mov		r9, rax
		mov		rdi, 5
		mov		qword [rax+0], rdi
		mov		r11, 0
		jmp		loop_cond_3
loop_body_3:
		inc		r11
loop_cond_3:
		cmp		r11, 5
		jl		loop_body_3
loop_end_3:
		mov		qword [rel _global_outputBuffer], r9
		jmp		loop_cond_4
loop_body_4:
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
		mov		r15, rax
		mov		r12, r15
		cmp		r12, 0
		je		if_true_0
		jne		if_false_0
if_true_0:
		jmp		loop_end_4
		jmp		if_end_0
if_false_0:
		nop
if_end_0:
		cmp		r12, 1
		je		if_true_1
		jne		if_false_1
if_true_1:
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
		call	getString
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
		mov		r14, r13
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
		call	computeSHA1
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
		jmp		if_end_1
if_false_1:
		cmp		r12, 2
		je		if_true_2
		jne		if_false_2
if_true_2:
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
		call	getString
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
		mov		r10, rax
		mov		r14, r10
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
		call	crackSHA1
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
		jmp		if_end_2
if_false_2:
		nop
if_end_2:
		nop
if_end_1:
		nop
loop_cond_4:
		mov		rdi, 1
		cmp		rdi, 0
		jnz		loop_body_4
		jz		loop_end_4
loop_end_4:
		mov		rax, 0
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

hex2int:
hex2int_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 128
		mov		r11, rdi
		mov		qword [rbp-8], 0
		mov		qword [rbp-16], 0
		jmp		loop_cond_5
loop_body_5:
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
		mov		rsi, qword [rbp-16]
		call	string_ord
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
		mov		r8, rax
		mov		qword [rbp-24], r8
		cmp		qword [rbp-24], 48
		jl		if_false_3
		cmp		qword [rbp-24], 57
		jle		if_true_3
		jg		if_false_3
if_true_3:
		mov		r12, qword [rbp-8]
		imul		r12, 16
		mov		qword [rbp-32], r12
		mov		rdi, qword [rbp-32]
		mov		rsi, qword [rbp-24]
		add		rdi, rsi
		mov		qword [rbp-32], rdi
		mov		rsi, qword [rbp-32]
		mov		qword [rbp-40], rsi
		mov		rdi, qword [rbp-40]
		sub		rdi, 48
		mov		qword [rbp-40], rdi
		mov		rsi, qword [rbp-40]
		mov		qword [rbp-8], rsi
		jmp		if_end_3
if_false_3:
		cmp		qword [rbp-24], 65
		jl		if_false_4
		cmp		qword [rbp-24], 70
		jle		if_true_4
		jg		if_false_4
if_true_4:
		mov		r10, qword [rbp-8]
		imul		r10, 16
		mov		qword [rbp-48], r10
		mov		rdi, qword [rbp-48]
		mov		rsi, qword [rbp-24]
		add		rdi, rsi
		mov		qword [rbp-48], rdi
		mov		r15, qword [rbp-48]
		sub		r15, 65
		mov		qword [rbp-56], r15
		mov		rdi, qword [rbp-56]
		add		rdi, 10
		mov		qword [rbp-56], rdi
		mov		rsi, qword [rbp-56]
		mov		qword [rbp-8], rsi
		jmp		if_end_4
if_false_4:
		cmp		qword [rbp-24], 97
		jl		if_false_5
		cmp		qword [rbp-24], 102
		jle		if_true_5
		jg		if_false_5
if_true_5:
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-64], rsi
		mov		rdi, qword [rbp-64]
		imul		rdi, 16
		mov		qword [rbp-64], rdi
		mov		r13, qword [rbp-64]
		mov		rsi, qword [rbp-24]
		add		r13, rsi
		mov		qword [rbp-72], r13
		mov		rdi, qword [rbp-72]
		sub		rdi, 97
		mov		qword [rbp-72], rdi
		mov		r9, qword [rbp-72]
		add		r9, 10
		mov		qword [rbp-8], r9
		jmp		if_end_5
if_false_5:
		mov		rax, 0
		mov		rsp, rbp
		pop		rbp
		ret
if_end_5:
		nop
if_end_4:
		nop
if_end_3:
		mov		r14, qword [rbp-16]
		inc		qword [rbp-16]
loop_cond_5:
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
		call	string_length
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
		mov		qword [rbp-80], rax
		mov		rsi, qword [rbp-80]
		cmp		qword [rbp-16], rsi
		jl		loop_body_5
		jge		loop_end_5
loop_end_5:
		mov		rax, qword [rbp-8]
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

int2chr:
int2chr_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 48
		mov		r13, rdi
		cmp		r13, 32
		jl		if_false_6
		cmp		r13, 126
		jle		if_true_6
		jg		if_false_6
if_true_6:
		mov		r15, r13
		sub		r15, 32
		mov		r14, r13
		sub		r14, 32
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
		mov		rdi, qword [rel _global_asciiTable]
		mov		rsi, r15
		mov		rdx, r14
		call	string_substring
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
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_6
if_false_6:
		nop
if_end_6:
		mov		rax, str_const_1
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

toStringHex:
toStringHex_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 96
		mov		r11, rdi
		mov		rsi, str_const_2
		mov		qword [rbp-8], rsi
		mov		qword [rbp-16], 28
		jmp		loop_cond_6
loop_body_6:
		mov		r15, r11
		mov		rcx, qword [rbp-16]
		sar		r15, cl
		mov		r8, r15
		and		r8, 15
		mov		qword [rbp-24], r8
		cmp		qword [rbp-24], 10
		jl		if_true_7
		jge		if_false_7
if_true_7:
		mov		r9, 48
		mov		rsi, qword [rbp-24]
		add		r9, rsi
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
		call	int2chr
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
		mov		r10, rax
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
		mov		rsi, r10
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
		mov		qword [rbp-8], r14
		jmp		if_end_7
if_false_7:
		mov		r13, 65
		mov		rsi, qword [rbp-24]
		add		r13, rsi
		mov		qword [rbp-32], r13
		mov		rdi, qword [rbp-32]
		sub		rdi, 10
		mov		qword [rbp-32], rdi
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
		mov		rdi, qword [rbp-32]
		call	int2chr
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
		mov		rsi, r12
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
		mov		qword [rbp-40], rax
		mov		rsi, qword [rbp-40]
		mov		qword [rbp-8], rsi
if_end_7:
		mov		rsi, qword [rbp-16]
		mov		qword [rbp-48], rsi
		mov		rdi, qword [rbp-48]
		sub		rdi, 4
		mov		qword [rbp-48], rdi
		mov		rsi, qword [rbp-48]
		mov		qword [rbp-16], rsi
loop_cond_6:
		cmp		qword [rbp-16], 0
		jge		loop_body_6
		jl		loop_end_6
loop_end_6:
		mov		rax, qword [rbp-8]
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

rotate_left:
rotate_left_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 64
		mov		r10, rdi
		mov		r9, rsi
		cmp		r9, 1
		je		if_true_8
		jne		if_false_8
if_true_8:
		mov		r14, r10
		and		r14, 2147483647
		sal		r14, 1
		mov		r11, r10
		sar		r11, 31
		and		r11, 1
		or		r14, r11
		mov		rax, r14
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_8
if_false_8:
		nop
if_end_8:
		cmp		r9, 31
		je		if_true_9
		jne		if_false_9
if_true_9:
		mov		r15, r10
		and		r15, 1
		mov		qword [rbp-8], r15
		mov		rdi, qword [rbp-8]
		sal		rdi, 31
		mov		qword [rbp-8], rdi
		mov		r15, r10
		sar		r15, 1
		and		r15, 2147483647
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-16], rsi
		mov		rdi, qword [rbp-16]
		or		rdi, r15
		mov		qword [rbp-16], rdi
		mov		rax, qword [rbp-16]
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_9
if_false_9:
		nop
if_end_9:
		mov		r13, 32
		sub		r13, r9
		mov		r12, 1
		mov		rcx, r13
		sal		r12, cl
		sub		r12, 1
		mov		r13, r10
		and		r13, r12
		mov		r12, r13
		mov		rcx, r9
		sal		r12, cl
		mov		r8, 32
		sub		r8, r9
		mov		r13, r10
		mov		rcx, r8
		sar		r13, cl
		mov		r8, 1
		mov		rcx, r9
		sal		r8, cl
		sub		r8, 1
		and		r13, r8
		or		r12, r13
		mov		rax, r12
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

add:
add_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 48
		mov		r13, rdi
		mov		r14, rsi
		mov		r15, r13
		and		r15, 65535
		mov		r12, r14
		and		r12, 65535
		add		r15, r12
		sar		r13, 16
		and		r13, 65535
		sar		r14, 16
		mov		r12, r14
		and		r12, 65535
		mov		r14, r13
		add		r14, r12
		mov		r13, r15
		sar		r13, 16
		add		r14, r13
		and		r14, 65535
		sal		r14, 16
		mov		r13, r15
		and		r13, 65535
		mov		r15, r14
		or		r15, r13
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

lohi:
lohi_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 48
		mov		r15, rdi
		mov		r13, rsi
		mov		r14, r13
		sal		r14, 16
		or		r15, r14
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

sha1:
sha1_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 648
		mov		qword [rbp-8], rdi
		mov		r12, rsi
		mov		qword [rbp-16], r12
		mov		rdi, qword [rbp-16]
		add		rdi, 64
		mov		qword [rbp-16], rdi
		mov		rsi, qword [rbp-16]
		mov		qword [rbp-24], rsi
		mov		rdi, qword [rbp-24]
		sub		rdi, 56
		mov		qword [rbp-24], rdi
		mov		rax, qword [rbp-24]
		mov		rsi, 64
		cqo
		idiv		rsi
		mov		qword [rbp-32], rax
		mov		rsi, qword [rbp-32]
		mov		qword [rbp-40], rsi
		mov		rdi, qword [rbp-40]
		add		rdi, 1
		mov		qword [rbp-40], rdi
		mov		rsi, qword [rbp-40]
		mov		qword [rbp-48], rsi
		mov		rsi, qword [rel _global_MAXCHUNK]
		cmp		qword [rbp-48], rsi
		jg		if_true_10
		jle		if_false_10
if_true_10:
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
		mov		rdi, str_const_3
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
		mov		qword [rbp-56], rax
		mov		rax, 0
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_10
if_false_10:
		nop
if_end_10:
		mov		qword [rbp-64], 0
		jmp		loop_cond_7
loop_body_7:
		mov		qword [rbp-72], 0
		jmp		loop_cond_8
loop_body_8:
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, qword [rbp-64]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-80], rsi
		mov		rbx, qword [rbp-80]
		mov		rcx, qword [rbp-72]
		mov		qword [rbx+rcx*8+8], 0
		mov		rsi, qword [rbp-72]
		mov		qword [rbp-88], rsi
		inc		qword [rbp-72]
loop_cond_8:
		cmp		qword [rbp-72], 80
		jl		loop_body_8
		jge		loop_end_8
loop_end_8:
		mov		rsi, qword [rbp-64]
		mov		qword [rbp-96], rsi
		inc		qword [rbp-64]
loop_cond_7:
		mov		rsi, qword [rbp-48]
		cmp		qword [rbp-64], rsi
		jl		loop_body_7
		jge		loop_end_7
loop_end_7:
		mov		qword [rbp-64], 0
		jmp		loop_cond_9
loop_body_9:
		mov		rax, qword [rbp-64]
		mov		rsi, 64
		cqo
		idiv		rsi
		mov		qword [rbp-104], rax
		mov		rax, qword [rbp-64]
		mov		rsi, 64
		cqo
		idiv		rsi
		mov		r11, rdx
		mov		rax, r11
		mov		rsi, 4
		cqo
		idiv		rsi
		mov		qword [rbp-112], rax
		mov		rax, qword [rbp-64]
		mov		rsi, 64
		cqo
		idiv		rsi
		mov		qword [rbp-120], rax
		mov		rax, qword [rbp-64]
		mov		rsi, 64
		cqo
		idiv		rsi
		mov		qword [rbp-128], rdx
		mov		rax, qword [rbp-128]
		mov		rsi, 4
		cqo
		idiv		rsi
		mov		qword [rbp-136], rax
		mov		rax, qword [rbp-64]
		mov		rsi, 4
		cqo
		idiv		rsi
		mov		qword [rbp-144], rdx
		mov		qword [rbp-152], 3
		mov		rdi, qword [rbp-152]
		mov		rsi, qword [rbp-144]
		sub		rdi, rsi
		mov		qword [rbp-152], rdi
		mov		rsi, qword [rbp-152]
		mov		qword [rbp-160], rsi
		mov		rdi, qword [rbp-160]
		imul		rdi, 8
		mov		qword [rbp-160], rdi
		mov		rbx, qword [rbp-8]
		mov		rcx, qword [rbp-64]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-168], rsi
		mov		rcx, qword [rbp-160]
		mov		rdi, qword [rbp-168]
		sal		rdi, cl
		mov		qword [rbp-168], rdi
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, qword [rbp-120]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-176], rsi
		mov		rbx, qword [rbp-176]
		mov		rcx, qword [rbp-136]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-184], rsi
		mov		rdi, qword [rbp-184]
		mov		rsi, qword [rbp-168]
		or		rdi, rsi
		mov		qword [rbp-184], rdi
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, qword [rbp-104]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-192], rsi
		mov		rbx, qword [rbp-192]
		mov		rcx, qword [rbp-112]
		mov		rsi, qword [rbp-184]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-64]
		mov		qword [rbp-200], rsi
		inc		qword [rbp-64]
loop_cond_9:
		cmp		qword [rbp-64], r12
		jl		loop_body_9
		jge		loop_end_9
loop_end_9:
		mov		rax, qword [rbp-64]
		mov		rsi, 64
		cqo
		idiv		rsi
		mov		qword [rbp-208], rax
		mov		rax, qword [rbp-64]
		mov		rsi, 64
		cqo
		idiv		rsi
		mov		r15, rdx
		mov		rax, r15
		mov		rsi, 4
		cqo
		idiv		rsi
		mov		qword [rbp-216], rax
		mov		rax, qword [rbp-64]
		mov		rsi, 64
		cqo
		idiv		rsi
		mov		r15, rax
		mov		rax, qword [rbp-64]
		mov		rsi, 64
		cqo
		idiv		rsi
		mov		r13, rdx
		mov		rax, r13
		mov		rsi, 4
		cqo
		idiv		rsi
		mov		qword [rbp-224], rax
		mov		rax, qword [rbp-64]
		mov		rsi, 4
		cqo
		idiv		rsi
		mov		r13, rdx
		mov		qword [rbp-232], 3
		mov		rdi, qword [rbp-232]
		sub		rdi, r13
		mov		qword [rbp-232], rdi
		mov		r13, qword [rbp-232]
		imul		r13, 8
		mov		qword [rbp-240], 128
		mov		rcx, r13
		mov		rdi, qword [rbp-240]
		sal		rdi, cl
		mov		qword [rbp-240], rdi
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, r15
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, qword [rbp-224]
		mov		r15, qword [rbx+rcx*8+8]
		mov		rsi, qword [rbp-240]
		or		r15, rsi
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, qword [rbp-208]
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, qword [rbp-216]
		mov		qword [rbx+rcx*8+8], r15
		mov		r15, qword [rbp-48]
		sub		r15, 1
		mov		r13, r12
		sal		r13, 3
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, r15
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r15
		mov		rcx, 15
		mov		qword [rbx+rcx*8+8], r13
		mov		r13, qword [rbp-48]
		sub		r13, 1
		mov		r15, r12
		sar		r15, 29
		and		r15, 7
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, r13
		mov		r13, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, 14
		mov		qword [rbx+rcx*8+8], r15
		mov		qword [rbp-248], 1732584193
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
		mov		rdi, 43913
		mov		rsi, 61389
		call	lohi
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
		mov		qword [rbp-256], r15
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
		mov		rdi, 56574
		mov		rsi, 39098
		call	lohi
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
		mov		qword [rbp-264], r15
		mov		qword [rbp-272], 271733878
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
		mov		rdi, 57840
		mov		rsi, 50130
		call	lohi
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
		mov		qword [rbp-64], 0
		jmp		loop_cond_10
loop_body_10:
		mov		qword [rbp-72], 16
		jmp		loop_cond_11
loop_body_11:
		mov		rsi, qword [rbp-72]
		mov		qword [rbp-280], rsi
		mov		rdi, qword [rbp-280]
		sub		rdi, 3
		mov		qword [rbp-280], rdi
		mov		rsi, qword [rbp-72]
		mov		qword [rbp-288], rsi
		mov		rdi, qword [rbp-288]
		sub		rdi, 8
		mov		qword [rbp-288], rdi
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, qword [rbp-64]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-296], rsi
		mov		rbx, qword [rbp-296]
		mov		rcx, qword [rbp-280]
		mov		r8, qword [rbx+rcx*8+8]
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, qword [rbp-64]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-304], rsi
		mov		rbx, qword [rbp-304]
		mov		rcx, qword [rbp-288]
		mov		rsi, qword [rbx+rcx*8+8]
		xor		r8, rsi
		mov		rsi, qword [rbp-72]
		mov		qword [rbp-312], rsi
		mov		rdi, qword [rbp-312]
		sub		rdi, 14
		mov		qword [rbp-312], rdi
		mov		qword [rbp-320], r8
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, qword [rbp-64]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-328], rsi
		mov		rbx, qword [rbp-328]
		mov		rcx, qword [rbp-312]
		mov		rdi, qword [rbp-320]
		mov		rsi, qword [rbx+rcx*8+8]
		xor		rdi, rsi
		mov		qword [rbp-320], rdi
		mov		rsi, qword [rbp-72]
		mov		qword [rbp-336], rsi
		mov		rdi, qword [rbp-336]
		sub		rdi, 16
		mov		qword [rbp-336], rdi
		mov		rsi, qword [rbp-320]
		mov		qword [rbp-344], rsi
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, qword [rbp-64]
		mov		r14, qword [rbx+rcx*8+8]
		mov		rbx, r14
		mov		rcx, qword [rbp-336]
		mov		rdi, qword [rbp-344]
		mov		rsi, qword [rbx+rcx*8+8]
		xor		rdi, rsi
		mov		qword [rbp-344], rdi
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
		mov		rdi, qword [rbp-344]
		mov		rsi, 1
		call	rotate_left
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
		mov		qword [rbp-352], rax
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, qword [rbp-64]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-360], rsi
		mov		rbx, qword [rbp-360]
		mov		rcx, qword [rbp-72]
		mov		rsi, qword [rbp-352]
		mov		qword [rbx+rcx*8+8], rsi
		mov		r13, qword [rbp-72]
		inc		qword [rbp-72]
loop_cond_11:
		cmp		qword [rbp-72], 80
		jl		loop_body_11
		jge		loop_end_11
loop_end_11:
		mov		rsi, qword [rbp-248]
		mov		qword [rbp-368], rsi
		mov		rsi, qword [rbp-256]
		mov		qword [rbp-376], rsi
		mov		rsi, qword [rbp-264]
		mov		qword [rbp-384], rsi
		mov		r12, qword [rbp-272]
		mov		r11, r15
		mov		qword [rbp-72], 0
		jmp		loop_cond_12
loop_body_12:
		cmp		qword [rbp-72], 20
		jl		if_true_11
		jge		if_false_11
if_true_11:
		mov		rsi, qword [rbp-376]
		mov		qword [rbp-392], rsi
		mov		rdi, qword [rbp-392]
		mov		rsi, qword [rbp-384]
		and		rdi, rsi
		mov		qword [rbp-392], rdi
		mov		r9, qword [rbp-376]
		not		r9
		mov		qword [rbp-400], r9
		mov		rdi, qword [rbp-400]
		and		rdi, r12
		mov		qword [rbp-400], rdi
		mov		rsi, qword [rbp-392]
		mov		qword [rbp-408], rsi
		mov		rdi, qword [rbp-408]
		mov		rsi, qword [rbp-400]
		or		rdi, rsi
		mov		qword [rbp-408], rdi
		mov		rsi, qword [rbp-408]
		mov		qword [rbp-416], rsi
		mov		r13, 1518500249
		jmp		if_end_11
if_false_11:
		cmp		qword [rbp-72], 40
		jl		if_true_12
		jge		if_false_12
if_true_12:
		mov		rsi, qword [rbp-376]
		mov		qword [rbp-424], rsi
		mov		rdi, qword [rbp-424]
		mov		rsi, qword [rbp-384]
		xor		rdi, rsi
		mov		qword [rbp-424], rdi
		mov		rsi, qword [rbp-424]
		mov		qword [rbp-432], rsi
		mov		rdi, qword [rbp-432]
		xor		rdi, r12
		mov		qword [rbp-432], rdi
		mov		rsi, qword [rbp-432]
		mov		qword [rbp-416], rsi
		mov		r13, 1859775393
		jmp		if_end_12
if_false_12:
		cmp		qword [rbp-72], 60
		jl		if_true_13
		jge		if_false_13
if_true_13:
		mov		rsi, qword [rbp-376]
		mov		qword [rbp-440], rsi
		mov		rdi, qword [rbp-440]
		mov		rsi, qword [rbp-384]
		and		rdi, rsi
		mov		qword [rbp-440], rdi
		mov		rsi, qword [rbp-376]
		mov		qword [rbp-448], rsi
		mov		rdi, qword [rbp-448]
		and		rdi, r12
		mov		qword [rbp-448], rdi
		mov		rsi, qword [rbp-440]
		mov		qword [rbp-456], rsi
		mov		rdi, qword [rbp-456]
		mov		rsi, qword [rbp-448]
		or		rdi, rsi
		mov		qword [rbp-456], rdi
		mov		rsi, qword [rbp-384]
		mov		qword [rbp-464], rsi
		mov		rdi, qword [rbp-464]
		and		rdi, r12
		mov		qword [rbp-464], rdi
		mov		rsi, qword [rbp-456]
		mov		qword [rbp-472], rsi
		mov		rdi, qword [rbp-472]
		mov		rsi, qword [rbp-464]
		or		rdi, rsi
		mov		qword [rbp-472], rdi
		mov		rsi, qword [rbp-472]
		mov		qword [rbp-416], rsi
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
		mov		rdi, 48348
		mov		rsi, 36635
		call	lohi
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
		mov		qword [rbp-480], rax
		mov		r13, qword [rbp-480]
		jmp		if_end_13
if_false_13:
		mov		rsi, qword [rbp-376]
		mov		qword [rbp-488], rsi
		mov		rdi, qword [rbp-488]
		mov		rsi, qword [rbp-384]
		xor		rdi, rsi
		mov		qword [rbp-488], rdi
		mov		rsi, qword [rbp-488]
		mov		qword [rbp-496], rsi
		mov		rdi, qword [rbp-496]
		xor		rdi, r12
		mov		qword [rbp-496], rdi
		mov		rsi, qword [rbp-496]
		mov		qword [rbp-416], rsi
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
		mov		rdi, 49622
		mov		rsi, 51810
		call	lohi
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
		mov		qword [rbp-504], rax
		mov		r13, qword [rbp-504]
if_end_13:
		nop
if_end_12:
		nop
if_end_11:
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
		mov		rdi, qword [rbp-368]
		mov		rsi, 5
		call	rotate_left
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
		mov		qword [rbp-512], rax
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
		mov		rdi, qword [rbp-512]
		mov		rsi, r11
		call	add
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
		mov		qword [rbp-520], rax
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
		mov		rdi, qword [rbp-416]
		mov		rsi, r13
		call	add
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
		mov		qword [rbp-528], rax
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
		mov		rdi, qword [rbp-520]
		mov		rsi, qword [rbp-528]
		call	add
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
		mov		r10, rax
		mov		rbx, qword [rel _global_chunks]
		mov		rcx, qword [rbp-64]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-536], rsi
		mov		rbx, qword [rbp-536]
		mov		rcx, qword [rbp-72]
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
		mov		rsi, qword [rbx+rcx*8+8]
		call	add
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
		mov		qword [rbp-544], rax
		mov		rsi, qword [rbp-544]
		mov		qword [rbp-552], rsi
		mov		r11, r12
		mov		r12, qword [rbp-384]
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
		mov		rdi, qword [rbp-376]
		mov		rsi, 30
		call	rotate_left
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
		mov		qword [rbp-560], rax
		mov		rsi, qword [rbp-560]
		mov		qword [rbp-384], rsi
		mov		rsi, qword [rbp-368]
		mov		qword [rbp-376], rsi
		mov		rsi, qword [rbp-552]
		mov		qword [rbp-368], rsi
		mov		r13, qword [rbp-72]
		inc		qword [rbp-72]
loop_cond_12:
		cmp		qword [rbp-72], 80
		jl		loop_body_12
		jge		loop_end_12
loop_end_12:
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
		mov		rdi, qword [rbp-248]
		mov		rsi, qword [rbp-368]
		call	add
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
		mov		qword [rbp-568], rax
		mov		rsi, qword [rbp-568]
		mov		qword [rbp-248], rsi
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
		mov		rdi, qword [rbp-256]
		mov		rsi, qword [rbp-376]
		call	add
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
		mov		qword [rbp-576], rax
		mov		rsi, qword [rbp-576]
		mov		qword [rbp-256], rsi
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
		mov		rdi, qword [rbp-264]
		mov		rsi, qword [rbp-384]
		call	add
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
		mov		qword [rbp-584], rax
		mov		rsi, qword [rbp-584]
		mov		qword [rbp-264], rsi
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
		mov		rdi, qword [rbp-272]
		mov		rsi, r12
		call	add
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
		mov		qword [rbp-592], rax
		mov		rsi, qword [rbp-592]
		mov		qword [rbp-272], rsi
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
		mov		rsi, r11
		call	add
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
		mov		qword [rbp-600], rax
		mov		r15, qword [rbp-600]
		mov		r13, qword [rbp-64]
		inc		qword [rbp-64]
loop_cond_10:
		mov		rsi, qword [rbp-48]
		cmp		qword [rbp-64], rsi
		jl		loop_body_10
		jge		loop_end_10
loop_end_10:
		mov		rbx, qword [rel _global_outputBuffer]
		mov		rcx, 0
		mov		rsi, qword [rbp-248]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rel _global_outputBuffer]
		mov		rcx, 1
		mov		rsi, qword [rbp-256]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rel _global_outputBuffer]
		mov		rcx, 2
		mov		rsi, qword [rbp-264]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rel _global_outputBuffer]
		mov		rcx, 3
		mov		rsi, qword [rbp-272]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rbx, qword [rel _global_outputBuffer]
		mov		rcx, 4
		mov		qword [rbx+rcx*8+8], r15
		mov		rax, qword [rel _global_outputBuffer]
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

computeSHA1:
computeSHA1_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 48
		mov		r8, rdi
		mov		r15, 0
		jmp		loop_cond_13
loop_body_13:
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
		mov		rsi, r15
		call	string_ord
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
		mov		rbx, qword [rel _global_inputBuffer]
		mov		rcx, r15
		mov		qword [rbx+rcx*8+8], r13
		mov		r9, r15
		inc		r15
loop_cond_13:
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
		call	string_length
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
		cmp		r15, r14
		jl		loop_body_13
		jge		loop_end_13
loop_end_13:
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
		call	string_length
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
		mov		r10, rax
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
		mov		rdi, qword [rel _global_inputBuffer]
		mov		rsi, r10
		call	sha1
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
		mov		r10, rax
		mov		r13, r10
		mov		r15, 0
		jmp		loop_cond_14
loop_body_14:
		mov		rbx, r13
		mov		rcx, r15
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
		mov		rdi, qword [rbx+rcx*8+8]
		call	toStringHex
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
		mov		r14, rax
		mov		r14, r15
		inc		r15
loop_cond_14:
		mov		rbx, r13
		mov		rcx, -1
		mov		r11, qword [rbx+rcx*8+8]
		cmp		r15, r11
		jl		loop_body_14
		jge		loop_end_14
loop_end_14:
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
		mov		rdi, str_const_4
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

nextLetter:
nextLetter_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 48
		mov		r13, rdi
		cmp		r13, 122
		je		if_true_14
		jne		if_false_14
if_true_14:
		mov		r15, 1
		neg		r15
		mov		rax, r15
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_14
if_false_14:
		nop
if_end_14:
		cmp		r13, 90
		je		if_true_15
		jne		if_false_15
if_true_15:
		mov		rax, 97
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_15
if_false_15:
		nop
if_end_15:
		cmp		r13, 57
		je		if_true_16
		jne		if_false_16
if_true_16:
		mov		rax, 65
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_16
if_false_16:
		nop
if_end_16:
		mov		r14, r13
		add		r14, 1
		mov		rax, r14
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

nextText:
nextText_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 48
		mov		r11, rdi
		mov		r14, rsi
		mov		r13, r14
		sub		r13, 1
		jmp		loop_cond_15
loop_body_15:
		mov		rbx, r11
		mov		rcx, r13
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
		mov		rdi, qword [rbx+rcx*8+8]
		call	nextLetter
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
		mov		rbx, r11
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], r12
		mov		r15, 1
		neg		r15
		mov		rbx, r11
		mov		rcx, r13
		cmp		qword [rbx+rcx*8+8], r15
		je		if_true_17
		jne		if_false_17
if_true_17:
		mov		rbx, r11
		mov		rcx, r13
		mov		qword [rbx+rcx*8+8], 48
		jmp		if_end_17
if_false_17:
		mov		rax, 1
		mov		rsp, rbp
		pop		rbp
		ret
if_end_17:
		mov		r14, r13
		dec		r13
loop_cond_15:
		cmp		r13, 0
		jge		loop_body_15
		jl		loop_end_15
loop_end_15:
		mov		rax, 0
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

array_equal:
array_equal_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 48
		mov		r12, rdi
		mov		r13, rsi
		mov		rbx, r12
		mov		rcx, -1
		mov		r11, qword [rbx+rcx*8+8]
		mov		rbx, r13
		mov		rcx, -1
		mov		r14, qword [rbx+rcx*8+8]
		cmp		r11, r14
		jne		if_true_18
		je		if_false_18
if_true_18:
		mov		rax, 0
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_18
if_false_18:
		nop
if_end_18:
		mov		r14, 0
		jmp		loop_cond_16
loop_body_16:
		mov		rbx, r13
		mov		rcx, r14
		mov		r15, qword [rbx+rcx*8+8]
		mov		rbx, r12
		mov		rcx, r14
		cmp		qword [rbx+rcx*8+8], r15
		jne		if_true_19
		je		if_false_19
if_true_19:
		mov		rax, 0
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_19
if_false_19:
		nop
if_end_19:
		mov		r11, r14
		inc		r14
loop_cond_16:
		mov		rbx, r12
		mov		rcx, -1
		mov		r10, qword [rbx+rcx*8+8]
		cmp		r14, r10
		jl		loop_body_16
		jge		loop_end_16
loop_end_16:
		mov		rax, 1
		mov		rsp, rbp
		pop		rbp
		ret
		mov		rsp, rbp
		pop		rbp
		ret

crackSHA1:
crackSHA1_entry:
		push		rbp
		mov		rbp, rsp
		sub		rsp, 168
		mov		r13, rdi
		mov		rdi, 5
		inc		rdi
		imul		rdi, 8
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
		mov		rdi, rdi
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
		mov		rdi, 5
		mov		qword [rax+0], rdi
		mov		qword [rbp-16], 0
		jmp		loop_cond_17
loop_body_17:
		inc		qword [rbp-16]
loop_cond_17:
		cmp		qword [rbp-16], 5
		jl		loop_body_17
loop_end_17:
		mov		rsi, qword [rbp-8]
		mov		qword [rbp-24], rsi
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
		call	string_length
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
		mov		r9, rax
		cmp		r9, 40
		jne		if_true_20
		je		if_false_20
if_true_20:
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
		mov		rdi, str_const_5
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
		mov		r9, rax
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_20
if_false_20:
		nop
if_end_20:
		mov		qword [rbp-32], 0
		jmp		loop_cond_18
loop_body_18:
		mov		rbx, qword [rbp-24]
		mov		rcx, qword [rbp-32]
		mov		qword [rbx+rcx*8+8], 0
		mov		r9, qword [rbp-32]
		inc		qword [rbp-32]
loop_cond_18:
		cmp		qword [rbp-32], 5
		jl		loop_body_18
		jge		loop_end_18
loop_end_18:
		mov		qword [rbp-32], 0
		jmp		loop_cond_19
loop_body_19:
		mov		rax, qword [rbp-32]
		mov		rsi, 8
		cqo
		idiv		rsi
		mov		qword [rbp-40], rax
		mov		rax, qword [rbp-32]
		mov		rsi, 8
		cqo
		idiv		rsi
		mov		qword [rbp-48], rax
		mov		rsi, qword [rbp-32]
		mov		qword [rbp-56], rsi
		mov		rdi, qword [rbp-56]
		add		rdi, 3
		mov		qword [rbp-56], rdi
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
		mov		rsi, qword [rbp-32]
		mov		rdx, qword [rbp-56]
		call	string_substring
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
		mov		qword [rbp-64], rax
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
		mov		rdi, qword [rbp-64]
		call	hex2int
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
		mov		r8, rax
		mov		rax, qword [rbp-32]
		mov		rsi, 4
		cqo
		idiv		rsi
		mov		qword [rbp-72], rax
		mov		rax, qword [rbp-72]
		mov		rsi, 2
		cqo
		idiv		rsi
		mov		qword [rbp-80], rdx
		mov		qword [rbp-88], 1
		mov		rdi, qword [rbp-88]
		mov		rsi, qword [rbp-80]
		sub		rdi, rsi
		mov		qword [rbp-88], rdi
		mov		r14, qword [rbp-88]
		imul		r14, 16
		mov		r10, r8
		mov		rcx, r14
		sal		r10, cl
		mov		rbx, qword [rbp-24]
		mov		rcx, qword [rbp-48]
		mov		rsi, qword [rbx+rcx*8+8]
		mov		qword [rbp-96], rsi
		mov		rdi, qword [rbp-96]
		or		rdi, r10
		mov		qword [rbp-96], rdi
		mov		rbx, qword [rbp-24]
		mov		rcx, qword [rbp-40]
		mov		rsi, qword [rbp-96]
		mov		qword [rbx+rcx*8+8], rsi
		mov		rsi, qword [rbp-32]
		mov		qword [rbp-104], rsi
		mov		rdi, qword [rbp-104]
		add		rdi, 4
		mov		qword [rbp-104], rdi
		mov		rsi, qword [rbp-104]
		mov		qword [rbp-32], rsi
loop_cond_19:
		cmp		qword [rbp-32], 40
		jl		loop_body_19
		jge		loop_end_19
loop_end_19:
		mov		r14, 4
		mov		r10, 1
		jmp		loop_cond_20
loop_body_20:
		mov		qword [rbp-32], 0
		jmp		loop_cond_21
loop_body_21:
		mov		rbx, qword [rel _global_inputBuffer]
		mov		rcx, qword [rbp-32]
		mov		qword [rbx+rcx*8+8], 48
		mov		r13, qword [rbp-32]
		inc		qword [rbp-32]
loop_cond_21:
		cmp		qword [rbp-32], r10
		jl		loop_body_21
		jge		loop_end_21
loop_end_21:
		jmp		loop_cond_22
loop_body_22:
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
		mov		rdi, qword [rel _global_inputBuffer]
		mov		rsi, r10
		call	sha1
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
		mov		r11, qword [rbp-112]
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
		mov		rsi, qword [rbp-24]
		call	array_equal
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
		cmp		r15, 0
		jnz		if_true_21
		jz		if_false_21
if_true_21:
		mov		qword [rbp-32], 0
		jmp		loop_cond_23
loop_body_23:
		mov		rbx, qword [rel _global_inputBuffer]
		mov		rcx, qword [rbp-32]
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
		mov		rdi, qword [rbx+rcx*8+8]
		call	int2chr
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
		mov		qword [rbp-120], rax
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
		mov		rdi, qword [rbp-120]
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
		mov		r13, rax
		mov		r13, qword [rbp-32]
		inc		qword [rbp-32]
loop_cond_23:
		cmp		qword [rbp-32], r10
		jl		loop_body_23
		jge		loop_end_23
loop_end_23:
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
		mov		rdi, str_const_6
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
		mov		r13, rax
		mov		rsp, rbp
		pop		rbp
		ret
		jmp		if_end_21
if_false_21:
		nop
if_end_21:
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
		mov		rdi, qword [rel _global_inputBuffer]
		mov		rsi, r10
		call	nextText
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
		cmp		r12, 0
		jnz		if_false_22
		jz		if_true_22
if_true_22:
		jmp		loop_end_22
		jmp		if_end_22
if_false_22:
		nop
if_end_22:
		nop
loop_cond_22:
		mov		rdi, 1
		cmp		rdi, 0
		jnz		loop_body_22
		jz		loop_end_22
loop_end_22:
		mov		r13, r10
		inc		r10
loop_cond_20:
		cmp		r10, r14
		jle		loop_body_20
		jg		loop_end_20
loop_end_20:
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
		mov		rdi, str_const_7
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

SECTION .bss

stringbuffer:
		resb	256

SECTION .data

_global_asciiTable:
		dq 0
_global_MAXCHUNK:
		dq 0
_global_MAXLENGTH:
		dq 0
_global_chunks:
		dq 0
_global_inputBuffer:
		dq 0
_global_outputBuffer:
		dq 0
	dq	95
str_const_0:
	db	32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 0

	dq	0
str_const_1:
	db	0

	dq	0
str_const_2:
	db	0

	dq	18
str_const_3:
	db	110, 67, 104, 117, 110, 107, 32, 62, 32, 77, 65, 88, 67, 72, 85, 78, 75, 33, 0

	dq	0
str_const_4:
	db	0

	dq	13
str_const_5:
	db	73, 110, 118, 97, 108, 105, 100, 32, 105, 110, 112, 117, 116, 0

	dq	0
str_const_6:
	db	0

	dq	10
str_const_7:
	db	78, 111, 116, 32, 70, 111, 117, 110, 100, 33, 0

intbuffer:
        dq 0
format1:
        db "%lld", 0
format2:
        db "%s", 0
