section .text
global _ft_isprint

_ft_isprint:

entry:
    cmp rdi, 32
    jge last_isprint    ;jump greater or equal
    jmp isnotprint

last_isprint:
    cmp rdi, 126
    jg isnotprint         ;jump lower or equal

isprint:
    mov rax, 1
    ret

isnotprint:
    mov rax, 0
    ret
