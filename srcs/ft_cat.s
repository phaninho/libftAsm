section .data
   buffsize equ     1024

section .bss
   buf      resb    1024

section .text
global _ft_cat

%define SYS_read    0x2000003
%define SYS_write   0x2000004

_ft_cat:
    ; push    r12
    mov     r8, rdi

read:
    mov     rdi, r8
    mov     rsi, buf
    mov     rdx, buffsize
    mov     rax, SYS_read
    syscall
    jc      return
    cmp     rax, 0
    je      return
    mov     r9, rax

write:
    mov     rdi, 1
    ; mov     rsi, buf
    mov     rdx, r9
    mov     rax, SYS_write
    syscall
    jc      return
    jmp     read

return:
    ; pop     r12
    ret
