section .text
global _ft_isascii

_ft_isascii:

entry:
    cmp rdi, 0
    jge last_ascii      ;jump greater or equal
    jmp isnotascii

last_ascii:
    cmp rdi, 127
    jle isascii         ;jump lower or equal

isascii:
    mov rax, 1
    ret

isnotascii:
    mov rax, 0
    ret
