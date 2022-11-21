%include 'itos.asm'

section .data
    endl db 10

%macro print 2;
    mov edx, %2          
    mov ecx, %1               
    mov ebx, 1                 
    mov eax, 4                  
    int 0x80  
%endmacro


print_endl:
    print endl, 1  
    ret



print_char:
    print char, 1 
    ret




print_int:

    call int_to_string

    mov edx, ecx                
    mov ecx, eax                
    mov ebx, 1                 
    mov eax, 4                  
    int 0x80    

    ret
   