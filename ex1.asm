;procedures
;print hello world
section .data
	hello_message db 'Hello, '
	hello_length equ $ - hello_message
	
	world_message db 'World!', 0xA
	world_length equ $ - world_message
section .text
;write the functions/procedures
print_hello:
	mov eax, 4	;sys_write call
	mov ebx, 1	;file description (stdout)
	mov ecx, hello_message
	mov edx, hello_length
	int 0x80
	ret
print_world:
	mov eax, 4	;sys_write call
	mov ebx, 1	;file description (stdout)
	mov ecx, world_message
	mov edx, world_length
	int 0x80
	ret
global _start	;entry point of the program
_start:
	;call the procedure
	call print_hello
	call print_world
	
	;terminate the program 
	mov ebx, 0 ; load the exit status to 0
	;system_call exit
	mov eax, 1
	int 0x80






	
	
