org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

start:
	jmp main

puts:
	;Prints a string to the screen
	push si
	push ax
	push bx

.loop:
	lodsb		;loads next character in al
	or al, al	;verify if next character is null
	jz .done

	mov ah, 0x0e	;calling BIOS interrupt for video out
	int 0x10
	jmp .loop

.done:
	pop ax
	pop si
	ret

main:
	;setup data segments
	mov ax, 0	;cannot write to ds/es directly
	mov dx, ax
	mov es, ax

	;setup stack
	mov ss, ax
	mov sp, 0x7C00	;stack grows downwards from is base addr
	
	;printing message
	mov si, msg
	call puts

	hlt

.halt:
	jmp .halt

msg: db 'Hello World!', ENDL, 0

times 510-($-$$) db 0
dw 0AA55h
