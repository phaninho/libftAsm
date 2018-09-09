section .text
global _ft_bzero

; void (void * mem, size_t len)
;              |            |
;              v            v
;             rdi          rsi

; _ft_bzero:
;
; loop:
;     cmp     rsi,    0   ; if (rsi == 0)
;     je      end         ;   goto end;
;     mov     byte[rdi], 0    ; *rdi = 0;
;     inc     rdi         ; rdi++;
;     dec     rsi         ; rsi--;
;     jmp     loop   ; goto loop
;
; end:
;     ret
;
_ft_bzero:
    cmp rsi, 0
    je return

loop:
    mov rcx, rsi
    mov rax, 0
    cld
    rep stosb

return
    mov rax, rdi
    ret
