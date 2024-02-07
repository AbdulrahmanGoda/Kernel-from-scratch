#include "gdt.h"
#include "drivers/vga.h"
#include "interrupts/idt.h"
#include "drivers/keyboard.h"

void kmain(void);

void kmain(void){
    initGdt();
	initIdt();
	terminal_initialize();
	initKeyboard();
}
