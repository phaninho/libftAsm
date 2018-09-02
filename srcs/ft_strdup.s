section .text
global _ft_strdup

extern _ft_strlen
extern _malloc

; char  *strdup(const char *str);
;
; rdi -> void *str
;
; rax -> return val

_ft_strdup:
    cmp     rdi,        0   ;   if (str == 0)
    je      ret_null        ;       return (0);

strlen:
    push    rdi             ;   save rdi on stack
    call    _ft_strlen      ;   ft_strlen(str);
    pop     rdi             ;   restore rdi from stack
    inc     rax             ;   ++rax (len + 1)

alloc:
    mov     r12,        rdi ;   r12 = rdi (str)
    mov     rdi,        rax ;   rdi = len
    push    rdi             ;   save rdi
    call    _malloc         ;   malloc(len)
    pop     rdi             ;   restore rdi
    cmp     rax,        0   ;   if (malloc(len) == 0)
    je      return          ;       return (0);

cpy:
    mov     rcx,        rdi ;   rcx = rdi (len)
    mov     rdi,        rax ;   rdi = rax (new malloc)
    mov     rsi,        r12 ;   rsi = r12 (str)
    cld                     ;   cld: direction flag -> ++, std: direction flag -> --
    rep     movsb           ;   repeat *rdi = *rsi, ++rdi, ++rsi

return:
    ret                     ;   return (rax);

ret_null:
    mov     rax,        0
    ret                     ;   return (0);
