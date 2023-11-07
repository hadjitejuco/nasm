section	.data
	msg1 db	'Hello, programmers!',0xA,0xD 	
	len1 equ $ - msg1			

	msg2 db 'Welcome to the world of,', 0xA,0xD 
	len2 equ $- msg2 

	msg3 db 'Linux assembly programming! ', 0xA,0xD 
	len3 equ $- msg3

 
section	.text
   global _start            ;must be declared for using gcc
	
_start:                     ;tell linker entry point
	mov   eax, 4
      mov   ebx, 1
      mov   ecx, msg1
      mov   edx, len1
      int   80h
      
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, msg2
      mov   edx, len2
      int   80h
      
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, msg3
      mov   edx, len3
      int   80h
	
   mov eax,1                ;system call number (sys_exit)
   int 0x80                 ;call kernel


