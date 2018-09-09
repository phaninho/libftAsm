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
	cmp rdx, 0		; if (rdx == 0) { if (c == 0)}
		je return	; return (rdi)  {return(mem) }

loop:
	mov rax, rsi	;STOS utilise RAX pour savoir quoi stocker dans RDI
	mov rcx, rdx	; et RCX pour connaitre sur combien de bit les stocker
	cld				;flag pour incrementer RDI et RSI (l'inverse est STD)
	rep stosb		;	while (index < rcx)
					;	{
					;		rdi[index] = rax;
					;		index++;
					;	}

return:
	mov rax, rdi	; rax = rdi
	ret				; return (rax);
