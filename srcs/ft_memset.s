section .text
global _ft_memset

; void *ft_memset(void *mem, int c, size_t len);
;
; rdi -> void *mem
; rsi -> int c
; rdx -> size_t len
;
; rax -> return val

_ft_memset:
	mov		r8,			rdi	;	r8 = rdi (void *mem)
							;(on garde l'adresse du pointeur)
    cmp     rdx,        0   ;   if (len == 0)
    je      return          ;       return;

set:
	mov     rax,    rsi		;	rax = rsi (int c)
    mov     rcx,    rdx		;	rcx = rdx (size_t len)
    cld						;	cld: direction flag -> ++, std: direction flag -> --
    rep		stosb			;	repeat *rdi = c, ++rdi

return:
	mov		rax,	r8
    ret                     ;   return(mem);

; stosb = STOre String Byte
