nasm -felf64 code.asm && gcc -o code code.o
# nasm -g -f win64 code.asm -o code.o
# nasm -felf64 code.asm
# gcc code.o -g -o code -m64
./code
echo $?
