section .text
global _ft_bzero

; void (void * mem, size_t len)
;              |            |
;              v            v
;             rdi          rsi

_ft_bzero:

loop:
    cmp     rsi,    0   ; if (rdi == 0)
    je      end         ;   goto end;
    mov     byte[rdi], 0    ; *rdi = 0;
    inc     rdi         ; rdi++;
    dec     rsi         ; rsi--;
    jmp     loop   ; goto loop

end:
    ret
