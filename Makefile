

CFLAGS=-std=gnu99 -ffreestanding -O2 -Wall -Wextra



.PHONY: clean


ASM_SRC :=  $(wildcard source/libk/asm/*.asm)
C_SRC:= $(wildcard source/libk/c/*.c)
KERNEL_SRC =  source/kernel/kernel/kernel.c
ASM_OBJ:=$(wildcard source/libk/asm/*.o)
C_OBJ:= $(wildcard source/libk/c/*.o)
KERNEL_OBJ =  source/kernel/kernel/kernel.o
d1.kernel:
	nasm -felf32 $(ASM_SRC)
	i686-elf-gcc -c $(C_SRC) $(CFLAGS)
	i686-elf-gcc -c $(KERNEL_SRC) -o source/kernel/kernel/kernel.o $(CFLAGS)
	i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib $(C_OBJ) $(KERNEL_OBJ) $(ASM_OBJ) -lgcc





clean:
	rm source/libk/asm/*.o
	rm source/libk/c/*.o
	rm source/libc/c/*.d

