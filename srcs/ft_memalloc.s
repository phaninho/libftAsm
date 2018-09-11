section .text

global _ft_memalloc

extern _ft_bzero
extern _malloc

_ft_memalloc:
    cmp rdi, 0
    je return_null

alloc:
    call _malloc
    cmp rax, 0
    je return
    mov rsi, rdi
    mov rdi, rax
    call _ft_bzero

return:
    ret

return_null:
    mov rax, 0
    ret
