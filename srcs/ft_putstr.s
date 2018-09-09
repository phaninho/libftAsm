section .text

global _ft_putstr

extern _ft_strlen

%define SYS_write 0x2000004

; int ft_putstr(const char *str);
;
; rdi -> const char *str
;
; rax -> return val
_ft_putstr:
    mov     r10,         rdi             ;   r8 = str;
    call    _ft_strlen                  ;   ft_strlen(str);
    mov     r11,         rax             ;   r9 = ft_strlen(str);

write:
    mov     rdi,        1               ;   write(1,
    mov     rsi,        r10             ;         str,
    mov     rdx,        r11             ;         len);
    mov     rax,        SYS_write       ; write syscall
    syscall                             ; write(int fd, const void
                                        ; *buf, size_t len);
    ret
