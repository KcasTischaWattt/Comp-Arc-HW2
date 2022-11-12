# Модификация

Код был модифицирован про помощи команды
>     gcc -masm=intel 
>     -fno-asynchronous-unwind-tables
>     -fno-jump-tables
>     -fno-stack-protector 
>     -fno-exceptions 
>     -fverbose-asm 
>     ./file.c -S -o ./file_mod.s
После чего все файлы были отредактированны вручную:

1. Из всех файлов удалены cdqe;
2. Из всех файлов удалены все строки после 
   ```.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0```
   <br> за ненадобностью;
3. Удалены лишние переприсваивания - они перечислены в конце файла.
4. Была изменена инициализация массива str[] в main_mod.s.
<br> Было:
>     mov   eax, DWORD PTR -20[rbp]
>     movsx	rdx, eax
>     sub	rdx, 1
>     mov	QWORD PTR -32[rbp], rdx
>     movsx	rdx, eax
>     mov	r8, rdx
>     mov	r9d, 0
>     movsx	rdx, eax
>     mov	rsi, rdx
>     mov	edi, 0
>     mov	edx, 16
>     sub	rdx, 1
>     add	rax, rdx
>     mov	ecx, 16
>     mov	edx, 0	
>     div	rcx
>     imul	rax, rax, 16
>     mov	rdx, rax
>     and	rdx, -4096
>     mov	rcx, rsp
>     sub	rcx, rdx
>     mov	rdx, rcx
>     .L2:
>     cmp	rsp, rdx
>     je	.L3
>     sub	rsp, 4096
>     or	QWORD PTR 4088[rsp], 0
>     jmp	.L2
>     .L3:
>     mov	rdx, rax
>     and	edx, 4095
>     sub	rsp, rdx
>     mov	rdx, rax
>     and	edx, 4095
>     test	rdx, rdx
>     je	.L4
>     and	eax, 4095
>     sub	rax, 8
>     add	rax, rsp
>     or	QWORD PTR [rax], 0
>     .L4:
>     mov	rax, rsp
>     add	rax, 0
>     mov	QWORD PTR -40[rbp], rax	# str


<br>Стало:

>     movsx rdx, eax
>     sub rdx, 1
>     mov QWORD PTR [rbp-32], rdx
>     movsx rdx, eax
>     mov r8, rdx
>     mov r9d, 0
>     movsx rdx, eax
>     mov rsi, rdx
>     mov edi, 0
>     mov edx, 16
>     sub rdx, 1
>     add rax, rdx
>     mov ecx, 16
>     mov edx, 0
>     div rcx
>     imul rax, rax, 16
>     sub rsp, rax
>     mov rax, rsp
>     add rax, 0
>     mov QWORD PTR [rbp-40], rax

## Удалённые переприсваивания
### main_mod.s
>  - mov	rax, rsp
>  - mov	rbx, rax
>  + mov	rbx, rsp

<br>

>  - mov	rax, rsp
>  - mov	rbx, rax
>  + mov	rbx, rsp

<br>

>  -- mov	rax, rsp
>  -- mov	rbx, rax
>  ++ mov	rbx, rsp

<br>

>  - mov	rax, rsp
>  - mov	rbx, rax
>  + mov	rbx, rsp

<br>

>  - mov	rax, rsp
>  - mov	rbx, rax
>  + mov	rbx, rsp

<br>
