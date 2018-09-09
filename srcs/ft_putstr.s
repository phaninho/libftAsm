section .data

nullstr:    db  '(null)',0xa    ;   constant string "(null)\n"
nullstrlen: equ ($ - nullstr)   ;   constant len ($ = cur address)

section .text
global _ft_putstr

extern _ft_strlen

%define EOF -1
%define SYS_write 0x2000004

; int ft_putstr(const char *str);
;
; rdi -> const char *str
;
; rax -> return val
_ft_putstr:
    ; cmp     rdi,        0               ;   if (str == 0)
    ; je      write_null                  ;       write(1, nullstr, nullstrlen);
    mov     r8,         rdi             ;   r8 = str;
    call    _ft_strlen                  ;   ft_strlen(str);
    mov     r9,         rax             ;   r9 = ft_strlen(str);

write:
    mov     rdi,        1               ;   write(1,
    mov     rsi,        r8              ;         str,
    mov     rdx,        r9              ;         len);
    mov     rax,        SYS_write       ; write syscall
    syscall                             ; write(int fd, const void *buf, size_t len);
    ; jc      return_eof                  ; Jump if carry; if (error) return (EOF);
    ; jmp     return_true

; write_null:
;     mov     rdi,        1               ;   write(1,
;     lea     rsi,        [rel nullstr]   ;         nullstr,(lea = Load Effective Address, rel = relative address)
;     mov     rdx,        nullstrlen      ;         nullstrlen,
;     mov     rax,        SYS_write       ; write syscall
;     syscall                             ;   );
;     jmp     return_eof                  ;   return (EOF);
;
; return_true:
;     mov     rax,        1
;     ret                                 ;   return (1);
;
; return_eof:
;     mov     rax,        EOF
    ret                                 ;   return (EOF);
