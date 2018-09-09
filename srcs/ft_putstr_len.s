section .text

global _ft_putstr_len

%define SYS_write 0x2000004

_ft_putstr_len:
	mov rdx, rsi		; mov la len dans rdx (third param)
	mov rsi, rdi		; passing str in second param
	mov rdi, 1			; passing fd 1 in first param
	mov rax, SYS_write	; write syscall
	syscall
	ret
