section .data
    msg db "The sum is:", 0xA,0xD,0xA 
    len equ $- msg   

segment .bss
    res resb 1

section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point
   mov	ecx,'4'         ;4 - 34
   sub  ecx, '0'        ; 34-30 = 4
	
   mov 	edx, '5'        ; 5 - 35
   sub  edx, '0'        ;35 - 30 = 5
	
   call    sum          ;call sum procedure
   mov 	[res], eax      ;move value of 39 to res
   
   ;print "The sum is:", 0xA,0xD
   mov	eax,4	        ;system call number (sys_write)
   mov	ebx,1	        ;file descriptor (stdout)
   mov	ecx, msg	
   mov	edx, len
   int	0x80	        ;call kernel
	
  
   mov	eax, 4	        ;system call number (sys_write)
   mov	ebx, 1	        ;file descriptor (stdout)
   mov	ecx, res
   mov	edx, 1
   int	0x80	        ;call kernel
	
   mov	eax,1	        ;system call number (sys_exit)
   int	0x80	        ;call kernel
sum:
   mov     eax, ecx     ;4
   add     eax, edx     ;4+5 = 9
   add     eax, '0'     ;9+30 = 39
   ret
	

