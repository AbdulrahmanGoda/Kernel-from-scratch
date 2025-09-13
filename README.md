# Kernel-from-scratch

I believe in learning by doing, so to sharpen my C programming skills and deepen my understanding of low-level operations, I started this simple kernel-from-scratch project.

This repository documents my hands-on journey into operating system development, beginning from the basics and incrementally building up fundamental kernel features. It’s a practical exploration of topics such as bootloaders, memory management, hardware interaction, and more—all implemented in C (and some Assembly).

This project is not only educational, but also satisfies a deeper, lifelong fascination with computers that has captivated me since childhood.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Usage](#usage)
- [Build and Testing](#build-and-testing)
- [Demo](#demo)
- [Roadmap](#roadmap)
- [Contact Me](#contact-me)

## Overview

Kernel-from-scratch was created to:

- **Learn Computer Architecture:** Gain hands-on experience with how operating systems interact with hardware.
- **Practice Low-Level Programming:** Develop skills in C programming and Assembly by implementing essential OS components.
- **Explore OS Internals:** Delve into bootloading, memory management, and driver development as part of an experimental kernel project.

While this is primarily a personal learning journey, the repository is structured and documented to serve as a resource for anyone interested in OS development and low-level programming.

## Features

- **GRUB Bootloader Integration:** Supports booting via the GRUB bootloader.
- **VGA Driver:** Implements a basic VGA text mode driver for display output.
- **Global Descriptor Table (GDT):** Sets up memory segmentation crucial for x86 architectures.
- **Modular Code Structure:** Organized into clear directories for boot components, kernel code, and supporting libraries.
- **Build Automation:** Uses a Makefile and linker script (`linker.ld`) to automate the build process.
- **Pre-built ISO Image:** Provides a `GOOS.iso` file for quick testing using emulators like QEMU.

## Architecture

The repository is organized as follows:

```
.
├── .vscode/             # VS Code settings for a consistent development environment.
├── GOOS/boot/           # Bootloader components and boot scripts.
├── build/               # Build scripts and intermediary build artifacts.
├── src/                 # Main source code: kernel core, drivers, and libraries.
├── GOOS.iso             # Pre-built ISO image for testing the operating system.
├── Makefile             # Build automation script.
├── boot.bin             # Bootloader binary.
└── linker.ld            # Linker script defining the memory layout.
```

### Detailed Breakdown

- **Bootloader:** Located in the `GOOS/boot/` directory, responsible for initializing hardware and booting the OS using GRUB.
- **Kernel Core:** Found in `src/`, it includes system initialization, basic I/O, and memory management routines.
- **Drivers and Libraries:** Implements essential drivers (e.g., VGA) and utility functions to support core functionality.
- **Build System:** The Makefile automates compilation and linking, ensuring reproducible builds. The linker script defines memory sections and layout.


### Prerequisites

- Unix-like environment (Linux, macOS, or Windows with WSL)
- GNU Make
- GCC (or a compatible C compiler)
- NASM (for assembly code)
- QEMU (or another emulator) for testing the ISO

### Cloning the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/AbdulrahmanGODA/Kernel-from-scratch.git
cd Kernel-from-scratch
```

### Building the Kernel

Run the following command to build the project:

```bash
make
```

This will compile the source code and generate the `GOOS.iso` image.

## Usage

Test the operating system using an emulator like QEMU:

```bash
qemu-system-x86_64 -cdrom GOOS.iso
```

The OS should boot, displaying output via the VGA text mode driver.

## Build and Testing

- **Automated Builds:** Consider setting up GitHub Actions or another CI tool for automated building and testing.
- **Debugging:** Enable debug flags in the Makefile and use GDB with QEMU for step-by-step debugging where necessary.

## Demo

https://drive.google.com/drive/folders/1rt9n40fLjpFTAW9mnXefthCm9n4aec7_?usp=drive_link

## Roadmap

Future enhancements include:
- **Advanced Memory Management:** Implementing more sophisticated memory handling techniques.
- **Process Scheduling:** Adding basic multitasking support.
- **File System Integration:** Exploring rudimentary file system support.
- **Additional Drivers:** Expanding hardware support through new driver implementations.
- **Enhanced Documentation:** Further improving documentation and code comments for clarity.
 

## Contact Me

If you encounter an issue, have a question, or need clarification about this project, feel free to open an issue on this repository.  
You can also reach out to me directly via [LinkedIn](https://www.linkedin.com/in/abdulrahman-goda-899700233/) or Email: abdulrahmangoda@hotmail.com.

---

*Happy Coding and Learning!*

---
