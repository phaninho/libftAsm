section .data

null_str    db      "(null)",0xa
null_len    equ     $-null_str
endl        db      0xa

section .text

global _ft_puts

extern _ft_strlen

%define SYS_exit    0x2000001
%define SYS_write   0x2000004
%define STDOUT_FILENO 1

_ft_puts:

entry:
    cmp rdi, 0
    je error
    mov rax, rdi
    call _ft_strlen
    mov rdx, rax
    mov rax, SYS_write
    mov rsi, rdi
    mov rdi, 1
    ; syscall
    ;
    ; mov rax, SYS_exit
    syscall
    jc      end

write_nl:
    mov     rax,    SYS_write       ; write(
    mov     rdi,    STDOUT_FILENO   ;   STDOUT_FILENO,
    mov     rsi,    endl            ;   "\n",
    mov     rdx,    1               ;   1)
    syscall
    jc      end
    jmp     ret_success

error:
    mov     rax,    SYS_write       ; write(
    mov     rdi,    STDOUT_FILENO   ;   STDOUT_FILENO,
    mov     rsi,    null_str        ;   null_str,
    mov     rdx,    null_len        ;   null_len)
    syscall
    jc      end

ret_success:
    mov     rax,    10              ; always ret 10 on success

end:
    ret
