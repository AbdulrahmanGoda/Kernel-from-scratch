# Kernel-from-scratch

Kernel-from-scratch is an experimental operating system kernel developed as a personal learning project. Its primary goal is to deepen understanding of computer architecture and low-level programming by building an OS kernel from the ground up. This project is written mainly in C, with critical components in Assembly, and covers everything from bootloading to basic driver development.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Build and Testing](#build-and-testing)
- [Contributing](#contributing)
- [Roadmap](#roadmap)
- [License](#license)
- [Contact](#contact)

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

## Installation

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

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch for your feature or fix (e.g., `git checkout -b feature-improvement`).
3. Commit your changes with clear, descriptive messages.
4. Open a pull request describing your changes.

For detailed guidelines, see our [CONTRIBUTING.md](CONTRIBUTING.md) (to be added).

## Roadmap

Future enhancements include:
- **Advanced Memory Management:** Implementing more sophisticated memory handling techniques.
- **Process Scheduling:** Adding basic multitasking support.
- **File System Integration:** Exploring rudimentary file system support.
- **Additional Drivers:** Expanding hardware support through new driver implementations.
- **Enhanced Documentation:** Further improving documentation and code comments for clarity.

## License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute the code as per the license terms.

## Contact

For questions or feedback, please open an issue on GitHub or contact me directly at [5377abdulrahman@example.com].

---

*Happy Coding and Learning!*
```

---