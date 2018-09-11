section .text

global _ft_strchr

_ft_strchr:
    mov r8, rdi
    mov rax, rsi
    cld
    repne scasb
    mov rax, rdi
    sub rax, 1
    ret
