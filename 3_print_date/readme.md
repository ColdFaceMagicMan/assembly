输入月日年
输出年月日
nasm -f elf main.asm
ld -m elf_i386 -s -o print_date main.o
./print_date