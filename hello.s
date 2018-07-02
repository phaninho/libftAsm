; extern _ft_strcat

%define SYS_exit    0x2000001
%define SYS_read    0x2000003
%define SYS_write   0x2000004

section .data
    msg    db "Hello, world!", 10
; .len:   equ     $ - msg
    msg2   db "it's good", 10
; .len:   equ     $ - msg2

section .text
    global start

start:
    mov     rax, msg ; write system call
    call    _print

    mov     rax, msg2
    call    _print

    mov     rax, SYS_exit ; exit system call
    xor     rdi, rdi        ; equivalent --> mov rdi, 0
    syscall

_print:
    push rax
    mov rbx, 0
_printLoop:
    inc rax
    inc rbx
    mov cl, [rax]
    cmp cl, 0
        jne _printLoop

    mov     rax, SYS_write ; write system call
    mov     rdi, 1         ; stdout = 1
    pop rsi                ; address of the message to print
    mov rdx, rbx           ; length of message
    ; xor     rdi, rdi        ; equivalent --> mov rdi, 0
    syscall

    ret
