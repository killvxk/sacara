header_VmAlloca
vm_alloca PROC
	push ebp
	mov ebp, esp	

	; read the immediate to push	
	push 4
	push [ebp+arg0]
	call vm_read_opcode

	; read stack frame header
	mov ebx, [ebp+arg0]
	mov ebx, [ebx+vm_sp] 
	
	; increment stack	
	mov ecx, [ebx+vm_stack_top]
	lea ecx, [ecx+TYPE DWORD*eax]
	mov [ebx+vm_stack_top], ecx
	
	mov ebp, esp
	pop ebp
	ret
vm_alloca ENDP