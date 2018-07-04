section .text
global _ft_strcat

; char *ft_strcat(char *dest, const char *src);
;
; rdi -> const char *dest
; rsi -> const char *src
;
; rax -> return val

_ft_strcat:

loop:
    cmp byte[rdi],   0
        je       cat
    inc rdi
    jmp loop

cat:
    mov rdi, rsi
    jmp end

end:
    ret
