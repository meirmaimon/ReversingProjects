include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable

	num		dd		?
	total	dd		0
; ======================================	
section '.text' code readable writeable executable	
start:	
	call	read_hex
	mov		[num],eax
	mov		ecx,eax			;ecx = num
	inc		ecx
	xor		eax,eax			;eax = 0
for_loop:
	add		[total],eax
	inc		eax
	loop	for_loop
; =======================================
	mov		eax,[total]
	call	print_eax
	push	0
	call	[ExitProcess]
	
include 'training.inc'