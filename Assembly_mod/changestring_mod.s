	.file	"changestring.c"
	.intel_syntax noprefix
	.text
	.globl	change_string
	.type	change_string, @function
change_string:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 56
	mov	QWORD PTR -56[rbp], rdi # Переданный в метод массив str[](rdi - первый аргумент в функции)
	mov	DWORD PTR -33[rbp], 1970235749	# vowels
	mov	BYTE PTR -29[rbp], 121	# vowels
	mov	r12d, 0	# i
	jmp	.L2
.L9:
	movsx rdx, r12d
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 97
	jle	.L3
	movsx rdx, r12d
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 122
	jg	.L3
	mov	r14d, 0	# flag
	mov	r13d, 0	# j
	jmp	.L4
.L7:
	mov	eax, r13d
	movzx	edx, BYTE PTR -33[rbp+rax]
	movsx	rcx, r12d
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rcx
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jne	.L5
	mov	r14d, 1
	jmp	.L6
.L5:
	add	r13d, 1	# j++
.L4:
	cmp	r13d, 4
	jle	.L7
.L6:
	cmp	r14d, 1
	je	.L10
	movsx	rdx, r12d
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	lea	ecx, -32[rax]
	movsx	rdx, r12d
	mov	rax, QWORD PTR -56[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	jmp	.L3
.L10:
	nop
.L3:
	add	r12d, 1	# i++
.L2:
	movsx	rbx, r12d
	mov  rdi, QWORD PTR -56[rbp]
	call	strlen@PLT
	cmp	rbx, rax
	jb	.L9
	nop
	nop
	add	rsp, 56
	pop	rbx
	pop	rbp
	ret
	.size	change_string, .-change_string