# Virtual Machine from Scratch

This project was made around December, 2024 and is a simple virtual machine (VM) implemented in C. It provides a basic understanding of how virtual machines work by simulating a simplified computer architecture.

## Overview

The VM has its own memory, registers, and a limited instruction set. It can load and execute a program written in its assembly-like language(yup had to re-invent assembly).

## Key Components

*   **`tankvm.h`**: Header file containing definitions for data structures and function prototypes.
    *   [`VM`](tankvm.h) struct: Represents the virtual machine, including:
        *   [`CPU`](tankvm.h) struct: Represents the CPU, containing registers.
        *   [`Memory`](tankvm.h) : A byte array representing the VM's memory.
        *   `b`: Break address, indicating the end of the program in memory.
    *   Registers: 16-bit registers (`ax`, `bx`, `cx`, `dx`, `sp`, `ip`) within the [`s_register`](tankvm.h) struct.
    *   [`Opcode`](tankvm.h) enum: Defines the instruction set (e.g., `mov`, `nop`, `hlt`).
    *   [`Instruction`](tankvm.h) struct: Represents a single instruction with an opcode and arguments.
    *   `instrmap`: A lookup table mapping opcodes to instruction sizes.
*   **`tankvm.c`**: Source file containing the implementation of the VM's functionality.
    *   [`virtualmachine()`](tankvm.c): Allocates and initializes a new [`VM`](tankvm.h) struct.
    *   [`exampleprogram()`](tankvm.c): Creates a sample program in VM's memory (hardcoded).
    *   [`execute()`](tankvm.c): The main execution loop that fetches, decodes, and executes instructions.
    *   [`execinstr()`](tankvm.c): Executes a single instruction based on its opcode.
    *   [`__mov()`](tankvm.c): Implements the `mov` instruction (move value into a register).
    *   [`map()`](tankvm.c): Returns the size of an instruction based on its opcode.
    *   [`error()`](tankvm.c): Handles errors like segmentation faults or halt instructions.
    *   Utility functions: [`copy()`](tankvm.c), [`zero()`](tankvm.c), [`printhex()`](tankvm.c).
    *   [`main()`](tankvm.c): Entry point that creates a VM, loads the example program, executes it, and prints memory contents.
*   **`Makefile`**: Defines the build process.

## Instruction Set

The VM supports the following instructions:

*   `mov`: Move a value into a register.
*   `nop`: No operation.
*   `hlt`: Halt the VM.

## How it Works

1.  **Initialization**: The `main` function creates a [`VM`](tankvm.h) instance using [`virtualmachine()`](tankvm.c).
2.  **Program Loading**: The [`exampleprogram()`](tankvm.c) function creates a simple, hardcoded program in the VM's memory.
3.  **Execution**: The [`execute()`](tankvm.c) function fetches instructions, decodes them, and executes them in a loop.
4.  **Termination**: The program halts when a `hlt` instruction is encountered.

## Building

To build the project, run:

```bash
make
```

Then go ahead and execute:
```bash
./tankvm
```

## Limitations:
- Limited instruction set.
- Hardcoded program.
- No input/output.
- Limited memory (65KB).
## Future Enhancements:
- Implement more instructions.
- Allow loading programs from a file.
- Add input/output capabilities.
- Improve error handling.