section .text
global _ft_tolower

_ft_tolower:

entry:
    cmp rdi, 'A'
    jge last_letter
    jmp notletter

last_letter:
    cmp rdi, 'Z'
    jle tolower

tolower:
    add rdi, 32
    mov rax, rdi
    ret

notletter:
    mov rax, rdi
    ret
