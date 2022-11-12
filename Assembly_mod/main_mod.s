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
	endbr64
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 40
	mov	rbx, rsp
	mov	r15d, 512	# max_size,
    mov eax, DWORD PTR [rbp-20]
    movsx rdx, eax
    sub rdx, 1
    mov QWORD PTR [rbp-32], rdx
    movsx rdx, eax
    mov r8, rdx
    mov r9d, 0
    movsx rdx, eax
    mov rsi, rdx
    mov edi, 0
    mov edx, 16
    sub rdx, 1
    add rax, rdx
    mov ecx, 16
    mov edx, 0
    div rcx
    imul rax, rax, 16
    sub rsp, rax
    mov rax, rsp
    add rax, 0
    mov QWORD PTR [rbp-40], rax # str[]
	mov	eax, r15d
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov rdi, QWORD PTR stdin[rip]
	call	fflush@PLT
	mov	rdx, QWORD PTR stdin[rip]
	mov	ecx, r15d
	mov	rax, QWORD PTR -40[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	fgets@PLT
	mov rdi, QWORD PTR -40[rbp] # Передача str[] в change_string()
	call	change_string@PLT
	mov rsi, QWORD PTR -40[rbp]
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rsp, rbx
	mov	eax, 0
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	main, .-main