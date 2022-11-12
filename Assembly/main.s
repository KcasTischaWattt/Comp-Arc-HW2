	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Your string (maximum %d characters):"
.LC1:
	.string	"\nYour string: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 40
	.cfi_offset 3, -24
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -24[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	mov	DWORD PTR -44[rbp], 512     # int max_size
	mov	eax, DWORD PTR -44[rbp]     # начало создания массива char str
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -40[rbp], rdx
	movsx	rdx, eax
	mov	r8, rdx
	mov	r9d, 0
	movsx	rdx, eax
	mov	rsi, rdx
	mov	edi, 0
	cdqe
	mov	edx, 16
	sub	rdx, 1
	add	rax, rdx
	mov	ecx, 16
	mov	edx, 0
	div	rcx
	imul	rax, rax, 16
	mov	rdx, rax
	and	rdx, -4096
	mov	rcx, rsp
	sub	rcx, rdx
	mov	rdx, rcx
.L2:
	cmp	rsp, rdx
	je	.L3
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L2
.L3:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L4
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L4:
	mov	rax, rsp
	add	rax, 0
	mov	QWORD PTR -32[rbp], rax     #конец создания массива char str, -32 - указатель на начало массива
	mov	eax, DWORD PTR -44[rbp]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fflush@PLT
	mov	rdx, QWORD PTR stdin[rip]
	mov	ecx, DWORD PTR -44[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	fgets@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	change_string@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rsp, rbx
	mov	eax, 0
	mov	rbx, QWORD PTR -24[rbp]
	xor	rbx, QWORD PTR fs:40
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4: