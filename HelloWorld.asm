; helloworld.asm
; Author: frknozr

global _start

section .text

_start:
	
	;print hello world to screen
	;ssize t write(int fd, const void *buf, size_t count);
	mov eax, 0x4 ; syscall number for write
	mov ebx, 0x1 ; file descriptor for stdout
	mov ecx, message ; buffer which sends to write syscall
	mov edx, 0xC ; buffer length
	int 0x80 ; interrupt
	
	;exit gracefully
	;void _exit(int status);
	mov eax, 0x1 ; syscall number for exit
	mov ebx, 0x0 ; exit status(0)
	int 0x80

section .data
	message: db "Hello World!"
	mlen equ $-message ; length of message
