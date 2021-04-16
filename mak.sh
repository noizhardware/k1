set -x

i686-elf-as boot.s -o boot.o
i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-gcc -T linker.ld -o myKernel.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
rm kernel.o
rm boot.o
if grub-file --is-x86-multiboot myKernel.bin; then
  echo multiboot confirmed
else
  echo the file is not multiboot
fi

mkdir -p iso/boot/grub
cp myKernel.bin iso/boot/myKernel.bin
cp grub.cfg iso/boot/grub/grub.cfg
grub-mkrescue -o myKernel.iso iso
