section .text

global _ft_strlen

_ft_strlen:
    ; mov     rdi, rdx          ;Starting address in DX (assume ES = DS)
    mov     rax, 0           ;Byte to search for (NUL)
                            ;[scas utilise la valeur dans RAX pour comparer avec le bit lue dans RDI]
    mov     rcx, -1          ;Start count at FFFFh
    cld                     ;Clear direction flag, direction flag = 0 so,
                            ;RDI and RSI will be incremented
    repne scasb             ;REPNE Repeat while RDI != RAX, RDI will increment
                ;the pointer. at the end the repeat count is specified by RCX
                            ;SCASB (scan string byte), decrementing RCX for each char
    mov     rax, -2          ;RCX will be -2 for length 0, -3 for length 1, ..
    sub     rax, rcx          ;Length in RAX
    ret
