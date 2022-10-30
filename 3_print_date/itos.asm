; Input:
; eax 要转换的数字
; esi 存储字符串结果的buffer
; Output:
; eax 字符串的首位指针
; ecx 字符串长度



int_to_string:
  add esi,9           ;指针后移八位(默认缓冲区大小为10，后两位为\0和换行)
  mov byte [esi],0    ; 尾0
  ;mov byte [esi],10    ; 换行

  mov ebx,10          ;要转换的进制
  mov ecx,1           ;string长度起始值，默认含有一个换行符



.next_digit:
  xor edx,edx         ; edx置0，接收余数
  div ebx             ; eax /= 10
  add dl,'0'          ; 数字转换为asc
  dec esi             ; buffer指针前移
  inc ecx             ; 长度加一
  mov [esi],dl    

  cmp  eax,0          ;也可以使用test eax,eax  ，test将两个数做与运算，常用于判断寄存器值是否为0
  jnz .next_digit     ; 直到eax==0,jnz 即jump not zero

  ; 结果string指针送入eax
  mov eax,esi

  ret