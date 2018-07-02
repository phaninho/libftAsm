section .text
global _ft_isascii

_ft_isascii:
    cmp rdi, 0
    jge last_ascii
    jmp isnotascii

last_ascii:
    cmp rdi, 127
    jle isascii

isascii:
    mov rax, 1
    ret

isnotascii:
    mov rax, 0
    ret
