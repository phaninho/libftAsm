section .data
    msg db "debug", 10

section .text

global _ft_debug

extern _ft_putstr

_ft_debug:
    push rdi
    push rsi
    push rdx
    mov rdi, msg
    call _ft_putstr
    pop rdx
    pop rsi
    pop rdi
    ret
