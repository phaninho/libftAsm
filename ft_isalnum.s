section .text
global _ft_isalnum

extern _ft_isalpha
extern _ft_isdigit

_ft_isalnum:

entry:
    call _ft_isalpha
    cmp rax, 1
    je isalnum
    call _ft_isdigit
    cmp rax, 1
    je isalnum
    jmp isnotalnum

isalnum:
    mov rax, 1
    ret

isnotalnum:
    mov rax, 0
    ret
