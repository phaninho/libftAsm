section .text
global _ft_toupper

_ft_toupper:

entry:
    cmp rdi, 'a'
    jge last_letter
    jmp notletter

last_letter:
    cmp rdi, 'z'
    jle toupper

toupper:
    sub rdi, 32
    mov rax, rdi
    ret

notletter:
    mov rax, rdi
    ret
