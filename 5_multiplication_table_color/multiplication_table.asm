
%include    'fmt.asm'
%include    'sys.asm'

section .data    
    lines db 9  


color_red:      db  1Bh, '[31;1m', 0
.len            equ $ - color_red
color_blue:     db  1Bh, '[34;1m', 0
.len            equ $ - color_blue
color_default:  db  1Bh, '[37;0m', 0
.len            equ $ - color_default




section .bss
    buffer resb 10  ;用于存储字符串的buffer，未初始化放bss段
    char resb    1   ;存要打印的字符


SECTION .text
global  _start
 
_start:


    mov     eax, 4
    mov     ebx, 1
    mov     ecx, color_blue
    mov     edx, color_blue.len
    int     80h

 
    mov     ecx, 1        ;ecx存行数
    mov     esi,buffer    ;初始化打印缓冲区指针



loop1:  
    push ecx

    mov eax, 1 ;eax存列数，从一开始
    loop2:

        push eax
        push eax
        push ecx        


        call    print_int ;打印eax

        mov byte [char], 'X'
        call    print_char

        pop ecx
        mov eax, ecx
        push ecx        

        call print_int

        mov byte [char], '='
        call print_char

        pop ecx
        pop eax

        mul ecx         ;mul将eax与操作数相乘，结果在eax中

        call print_int

        mov byte [char], ' '
        call    print_char

        pop eax
        inc eax
        pop ecx
        cmp eax, ecx
        push ecx
        jna loop2


    call print_endl
    pop ecx
    inc ecx
    cmp ecx, [lines]
    jna loop1

    call exit                 
