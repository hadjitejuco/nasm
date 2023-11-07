;sample.txt
section .data
	fileName db "sample1.txt"
	fileHandle dd 0
	
	errMsg db "File creation failed!", 0xA
	successMsg db "File created successfully!", 0xA

section .txt
	global _start

_start:
	mov eax, 5		;sys_open
	mov ebx, fileName
	mov ecx, 0x41
	mov edx, 0x1A4		;0644
	int 0x80

	;check error
	test eax, eax
	js create_error
	
	;file create successfully
	mov [fileHandle], eax
	
	mov edx, successMsg
	call DisplayMessage

	;close file
	mov eax, 6
	mov ebx, [fileHandle]
	int 0x80
	
	mov eax, 1
	int 0x80


create_error:
	mov eax, 1
	mov ebx, 1
	mov edx, errMsg
	call DisplayMessage
	int 0x80

DisplayMessage:
	mov eax, 4
	mov ebx, 1
	mov ecx, edx
	mov edx, 0
count_msg:
	cmp byte [ecx+edx], 0
	je done_counting
	inc edx
	jmp count_msg

done_counting:
	int 0x80
	ret
	
