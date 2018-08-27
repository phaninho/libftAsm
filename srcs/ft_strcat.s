section .text
global _ft_strcat

; char *ft_strcat(char *dest, const char *src);
;
; rdi -> const char *dest
; rsi -> const char *src
;
; rax -> return val

_ft_strcat:
    mov rax, rdi    ; rax = dest
    cmp rdi, 0      ;if (!rdi)
        je end      ; return dest a travers rax
    cmp rsi, 0      ;if (!rsi)
        je end      ; return dest a travers rax

loop:
    cmp byte[rdi],   0  ;if (rdi[i] == '\0')
        je       cat    ;  jmp to cat
    inc rdi             ;rdi++
    jmp loop            ;jmp loop (pour boucler jusqu'a '\0')

cat:
    cmp byte[rsi], 0
        je endstring
    mov r8, [rsi]       ;r8 = *rsi
    mov byte[rdi], r8b  ;*rdi = r8b
    inc rdi             ;rdi++
    inc rsi             ;rsi++
    jmp cat             ;jmp cat (pour boucler jusqu'a *rsi == '\0')

endstring:
    mov byte[rdi], 0    ;*rdi = '\0'

end:
    ret                 ;return rax
