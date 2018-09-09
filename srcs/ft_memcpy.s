section .text
global _ft_memcpy

; void    *ft_memcpy(void *dest, const void *src, size_t len);
;
; rdi -> void *dest
; rsi -> void *src
; rdx -> size_t len
;
; rax -> return val

_ft_memcpy:
    mov r8, rdi     ;a cause de movsb rdi va etre incrementé donc on
                    ;stock le pointeur
    cmp rdx, 0
        je return

cpy:
    mov rcx, rdx    ;rcx = len
    cld             ;flag to incremente rdi and rsi
    rep movsb       ;repeat Move byte at address DS:(E/R)SI to
                    ;address ES:(E/R)DI
                    ;*rdi = *rsi, ++rdi, ++rsi

return:
    mov rax, r8     ;on recupere l'adresse du debut de la string
    ret
