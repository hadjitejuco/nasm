;this program display's hello world
section .data
    msg db 'Hello World',0xA
    len equ $ - msg 
    msg2 db 'Hello', 0xA
    len2 equ  $ - msg2

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80
    ;exit 

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 0x80

    mov eax, 1
    int 0x80