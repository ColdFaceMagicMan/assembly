%include 'itos.asm'

section .data
    endl db 10

print_endl:
    ;sys_write    
    mov edx, 1          
    mov ecx, endl               
    mov ebx, 1                 
    mov eax, 4                  
    int 0x80  
    ret



print_char:
    mov edx, 1                
    mov ecx, char                
    mov ebx, 1                 
    mov eax, 4                  
    int 0x80   
    ret




print_int:

    call int_to_string

    mov edx, ecx                
    mov ecx, eax                
    mov ebx, 1                 
    mov eax, 4                  
    int 0x80    

  ret
   