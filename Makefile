# -----------------------------------------------------------------------------
# Makefile for Kernel-from-scratch
#
# This Makefile compiles and builds the Kernel-from-scratch project,
# an experimental operating system kernel developed to learn about
# computer architecture and low-level programming using C and Assembly.
#
# Author: AbdulrahmanGODA
# -----------------------------------------------------------------------------

# Assembler and Compiler Definitions
ASM = nasm                     # NASM assembler for assembly files
CC = gcc                       # GCC compiler for C source files

# Compiler Flags:
# -m32                : Generate 32-bit code.
# -fno-stack-protector: Disable stack protection.
# -fno-builtin       : Do not use built-in functions (ensuring a freestanding environment).
# -c                 : Compile only, do not link.
FLAGS = -m32 -fno-stack-protector -fno-builtin -c

# Directories for Source Files and Build Artifacts
SRC_DIR = src/kernel/          # Directory containing kernel source files.
BUILD_DIR = build              # Directory to store compiled object files.

# -----------------------------------------------------------------------------
# Build Targets
# -----------------------------------------------------------------------------
# The default target builds object files, the kernel, creates a bootable ISO,
# and runs the OS in QEMU.
all: boot.obj gdts.obj idts.obj kernel.obj gdt.obj vga.obj util.obj string.obj idt.obj keyboard.obj interpreter.obj kernel GOOS.iso run 

# -----------------------------------------------------------------------------
# Assembly Object File Targets
# -----------------------------------------------------------------------------

# Assemble boot.asm to produce boot.obj.
boot.obj: $(SRC_DIR)/boot.asm
	@$(ASM) -f elf32 $(SRC_DIR)/boot.asm -o $(BUILD_DIR)/boot.obj

# Assemble gdt.asm to produce gdts.obj.
gdts.obj: $(SRC_DIR)/gdt.asm
	@$(ASM) -f elf32 $(SRC_DIR)/gdt.asm -o $(BUILD_DIR)/gdts.obj

# Assemble idt.asm (Interrupt Descriptor Table) to produce idts.obj.
idts.obj: $(SRC_DIR)/interrupts/idt.asm
	@$(ASM) -f elf32 $(SRC_DIR)/interrupts/idt.asm -o $(BUILD_DIR)/idts.obj

# -----------------------------------------------------------------------------
# C Object File Targets
# -----------------------------------------------------------------------------

# Compile kernel.c to produce kernel.obj.
kernel.obj: $(SRC_DIR)/kernel.c
	@$(CC) $(FLAGS) $(SRC_DIR)/kernel.c -o $(BUILD_DIR)/kernel.obj

# Compile gdt.c to produce gdt.obj.
gdt.obj: $(SRC_DIR)/gdt.c
	@$(CC) $(FLAGS) $(SRC_DIR)/gdt.c -o $(BUILD_DIR)/gdt.obj

# Compile vga.c (VGA driver) to produce vga.obj.
vga.obj: $(SRC_DIR)/drivers/vga.c
	@$(CC) $(FLAGS) $(SRC_DIR)/drivers/vga.c -o $(BUILD_DIR)/vga.obj

# Compile util.c (utility functions) to produce util.obj.
util.obj: src/lib/util.c
	@$(CC) $(FLAGS) src/lib/util.c -o $(BUILD_DIR)/util.obj

# Compile string.c (string manipulation functions) to produce string.obj.
string.obj: src/lib/string.c
	@$(CC) $(FLAGS) src/lib/string.c -o $(BUILD_DIR)/string.obj

# Compile idt.c (Interrupt Descriptor Table routines) to produce idt.obj.
idt.obj: $(SRC_DIR)/interrupts/idt.c
	@$(CC) $(FLAGS) $(SRC_DIR)/interrupts/idt.c -o $(BUILD_DIR)/idt.obj

# Compile keyboard.c (keyboard driver) to produce keyboard.obj.
keyboard.obj: $(SRC_DIR)/drivers/keyboard.c
	@$(CC) $(FLAGS) $(SRC_DIR)/drivers/keyboard.c -o $(BUILD_DIR)/keyboard.obj

# Compile interpreter.c (command interpreter) to produce interpreter.obj.
interpreter.obj: $(SRC_DIR)/interpreter.c
	@$(CC) $(FLAGS) $(SRC_DIR)/interpreter.c -o $(BUILD_DIR)/interpreter.obj

# -----------------------------------------------------------------------------
# Linking and Kernel Creation
# -----------------------------------------------------------------------------

# Link all object files together to create the kernel binary.
# Uses ld with the elf_i386 format and a custom linker script (linker.ld).
kernel: $(BUILD_DIR)/boot.obj $(BUILD_DIR)/kernel.obj
	@ld -m elf_i386 -T linker.ld -o kernel $(BUILD_DIR)/boot.obj $(BUILD_DIR)/kernel.obj $(BUILD_DIR)/gdts.obj $(BUILD_DIR)/gdt.obj $(BUILD_DIR)/vga.obj $(BUILD_DIR)/util.obj $(BUILD_DIR)/idts.obj $(BUILD_DIR)/idt.obj $(BUILD_DIR)/keyboard.obj $(BUILD_DIR)/string.obj $(BUILD_DIR)/interpreter.obj
	
	@mv kernel GOOS/boot/kernel   # Move the kernel binary to the boot directory

# -----------------------------------------------------------------------------
# ISO Creation and Running in Emulator
# -----------------------------------------------------------------------------

# Create a bootable ISO image using grub-mkrescue.
GOOS.iso: GOOS/boot/kernel
	@grub-mkrescue -o GOOS.iso GOOS/

# Run the OS using QEMU.
run: GOOS.iso
	@qemu-system-i386 GOOS.iso
