section .text
global _ft_isalpha

; void (int c)
;         |
;         v
;        rdi

_ft_isalpha:

entry:
    cmp rdi, 'a'               ;if(rdi >= 'a')
    jge check_last_low         ;    check_last_low()
    cmp rdi, 'A'               ;if(rdi >= 'A')
    jge check_last_high        ;    check_last_high()
    jmp isnotalpha             ;isnotalpha()

check_last_low:
    cmp rdi, 'z'        ;if(rdi <= 'z')
    jle isalpha         ;    check_last_low()
    jmp isnotalpha      ;isnotalpha()

check_last_high:
    cmp rdi, 'Z'        ;if(rdi <= 'Z')
    jle isalpha         ;    check_last_low()
    jmp isnotalpha      ;isnotalpha()

isalpha:
    mov rax, 1          ;valeur de retour = 1
    ret                 ;return

isnotalpha:
    mov rax, 0          ;valeur de retour = 0
    ret                 ;return
