section .text
global _ft_bzero

; void (void * mem, size_t len)
;              |            |
;              v            v
;             rdi          rsi

_ft_bzero:
    push rdi
	cmp rdi, 0
	je return
    cmp rsi, 0
    je return

loop:
    mov rcx, rsi
    mov rax, 0
    cld
    rep stosb

return
    pop rax
    ret
