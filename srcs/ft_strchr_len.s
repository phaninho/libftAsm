section .text

global _ft_strchr_len

_ft_strchr_len:
    mov r8, rdi
    mov rax, rsi
    cld
    repne scasb
    sub rdi, r8
    mov rax, rdi
    ret
