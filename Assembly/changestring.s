	.file	"changestring.c"
	.intel_syntax noprefix
	.text
	.globl	change_string
	.type	change_string, @function
change_string:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 56
	.cfi_offset 3, -24
	mov	QWORD PTR -56[rbp], rdi     # Передача параметра char *str в метод
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -24[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -29[rbp], 1970235749      # Создание массива vowels, -29 - указатель на начало массива
	mov	BYTE PTR -25[rbp], 121
	mov	DWORD PTR -44[rbp], 0   # int i во внешнем for
	jmp	.L2
.L9:
	mov	eax, DWORD PTR -44[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 97
	jle	.L3
	mov	eax, DWORD PTR -44[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 122
	jg	.L3
	mov	DWORD PTR -40[rbp], 0   # int flag
	mov	DWORD PTR -36[rbp], 0   # int j во внутреннем for
	jmp	.L4
.L7:
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	movzx	edx, BYTE PTR -29[rbp+rax]
	mov	eax, DWORD PTR -44[rbp]
	movsx	rcx, eax
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rcx
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jne	.L5
	mov	DWORD PTR -40[rbp], 1
	jmp	.L6
.L5:
	add	DWORD PTR -36[rbp], 1
.L4:
	cmp	DWORD PTR -36[rbp], 4
	jle	.L7
.L6:
	cmp	DWORD PTR -40[rbp], 1
	je	.L11
	mov	eax, DWORD PTR -44[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	lea	ecx, -32[rax]
	mov	eax, DWORD PTR -44[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	jmp	.L3
.L11:
	nop
.L3:
	add	DWORD PTR -44[rbp], 1
.L2:
	mov	eax, DWORD PTR -44[rbp]
	movsx	rbx, eax
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	strlen@PLT
	cmp	rbx, rax
	jb	.L9
	nop
	mov	rax, QWORD PTR -24[rbp]
	xor	rax, QWORD PTR fs:40
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	add	rsp, 56
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	change_string, .-change_string
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