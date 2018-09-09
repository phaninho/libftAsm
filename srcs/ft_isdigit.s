section .text
global _ft_isdigit

_ft_isdigit:

entry:
    cmp rdi, '0'
    jge check_last_digit    ;jump greater or equal
    jmp isnotdigit

check_last_digit:
    cmp rdi, '9'
    jle isdigit             ;jump lower or equal
    jmp isnotdigit

isdigit:
    mov rax, 1
    ret

isnotdigit:
    mov rax, 0
    ret
