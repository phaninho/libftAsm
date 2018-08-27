section .data

nullstr:    db  '(null)',0xa    ;   constant string "(null)\n"
nullstrlen: equ ($ - nullstr)   ;   constant len ($ = cur address)
endlstr:    db  0xa             ;   constant string "\n"

section .text
global _ft_puts

extern _ft_strlen

%define EOF -1
%define SYS_write 0x2000004

; int ft_puts(const char *str);
;
; rdi -> const char *str
;
; rax -> return val
_ft_puts:
    cmp     rdi,        0               ;   if (str == 0)
    je      write_null                  ;       write(1, nullstr, nullstrlen);
    mov     r8,         rdi             ;   r8 = str;
    call    _ft_strlen                  ;   ft_strlen(str);
    mov     r9,         rax             ;   r9 = ft_strlen(str);

write:
    mov     rax,        SYS_write       ;   size_t write(int fd, const void *buf, size_t count);
    mov     rdi,        1               ;   write(1,
    mov     rsi,        r8              ;         r8,
    mov     rdx,        r9              ;         r9,
    syscall                             ;   );
    jc      return_eof                  ;   if (write fail) return (EOF);

write_endl:
    mov     rax,        SYS_write       ;   size_t write(int fd, const void *buf, size_t count);
    mov     rdi,        1               ;   write(1,
    lea     rsi,        [rel endlstr]   ;         endlstr,      (lea = Load Effective Address, rel = relative address)
    mov     rdx,        1               ;         1,
    syscall                             ;   );
    jc      return_eof                  ;   if (write fail) return (EOF);
    jmp     return_true                 ;

write_null:
    mov     rax,        SYS_write       ;   size_t write(int fd, const void *buf, size_t count);
    mov     rdi,        1               ;   write(1,
    lea     rsi,        [rel nullstr]   ;         nullstr,      (lea = Load Effective Address, rel = relative address)
    mov     rdx,        nullstrlen      ;         nullstrlen,
    syscall                             ;   );
    jmp     return_eof                  ;   return (EOF);

return_true:
    mov     rax,        1
    ret                                 ;   return (1);

return_eof:
    mov     rax,        EOF
    ret                                 ;   return (EOF);
