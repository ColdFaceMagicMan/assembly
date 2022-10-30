%include    'fmt.asm'
%include    'sys.asm'

section .data    
    msg db 'WHAT IS THE DATE ?(MONTH/DAY/YEAR)', 10, 0 
    msg_len equ $-msg  

section .bss
    buffer resb 32  ;存储输入

    char resb    1   ;存要打印的字符


SECTION .text
global  _start
 
_start:

    ;打印提示信息
    mov eax,4	
    mov ebx,1	
    mov ecx,msg	
    mov edx,msg_len	
    int 80h

    ;esi用于保存输入字符串在内存中的地址
    mov esi, buffer


    mov eax,3	; linux系统调用号3，sys_read
    mov ebx,0	; 文件描述符0代表标准输入
    mov ecx,esi	; 要输入内容的首地址
    mov edx,4	; 最大输入长度
    int 80h


    push esi

    add esi, 4


    mov eax,3	
    mov ebx,0	
    mov ecx,esi	
    mov edx,4	
    int 80h



    push esi

    add esi, 4

    
    mov eax,3	
    mov ebx,0	
    mov ecx,esi	
    mov edx,4	
    int 80h



;output

    mov byte [char], '-'

    mov eax,4	
    mov ebx,1	
    mov ecx,esi	
    mov edx,4	
    int 80h

    call print_char

    ;用esi暂存日期
    pop esi

    mov eax,4	
    mov ebx,1	
    pop ecx
    mov edx,2	
    int 80h

    call print_char


    mov eax,4	
    mov ebx,1	
    mov ecx, esi
    mov edx,3	
    int 80h

    call exit
