section .text
global _ft_bzero

; void (void * mem, size_t len)
;              |            |
;              v            v
;             rdi          rsi

_ft_bzero:
    cmp rsi, 0
    je return

loop:
    push rdi
    mov rcx, rsi
    mov rax, 0
    cld
    rep stosb

return
    pop rax
    ret
