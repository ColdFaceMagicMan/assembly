%include    'itos.asm'
section .data    

section .bss
    buffer resb 10  ;用于存储字符串的buffer，未初始化放bss段

SECTION .text
global  _start
 
_start:
 
    mov     ebx, 1          ; ebx初始化为1
    mov     ecx, 100        ;循环次数

s:  add     eax, ebx
    inc     ebx
    loop s

;jump写法
;    dec ecx
;    jnz s

    mov    esi,buffer   
    call   int_to_string

    ;sys_write
    mov edx, ecx                
    mov ecx, eax                
    mov ebx, 1                 
    mov eax, 4                  
    int 0x80                    

    ;exit
    mov ebx, 0                 
    mov eax, 1                 
    int 0x80                    