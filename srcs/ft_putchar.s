default	rel

section		.data
char:		db	0, 0

section .text

global _ft_putchar

extern _ft_debug

%define SYS_write 0x2000004

_ft_putchar:
    cmp rdi, 0
    je return
;
write:
	mov		[char], rdi
	mov		rax, SYS_write
	lea		rsi, [char]
	mov		rdi, 1
	mov		rdx, 1
	syscall
return:
	ret
