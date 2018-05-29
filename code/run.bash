nasm -felf64 code.asm && gcc -o code code.o
./code
echo $?
