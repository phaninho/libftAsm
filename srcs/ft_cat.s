section .data
   buffsize equ     1024

section .bss
   buf      resb    1024

section .text
global _ft_cat

extern _ft_putstr_len

%define SYS_read    0x2000003

_ft_cat:
    mov     r8, rdi

read:
    mov     rdi, r8
    mov     rsi, buf
    mov     rdx, buffsize
    mov     rax, SYS_read
    syscall
    ;jc      return
    cmp     rax, 0
    jle     return
    mov     r9, rax

write:
    mov rdi, rsi
	mov rsi, r9
    call _ft_putstr_len
    jmp     read

return:
    ret
