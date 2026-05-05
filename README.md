# Assembly Lessons

## Description
Curated Linguagens de Montagem exercises collected from the strongest lesson folders. This repo focuses on source code examples instead of PDFs, object files, screenshots, and archives.

## Tech Stack
- x86/x86-64 Assembly
- NASM-style Linux examples
- Linux syscalls
- C interoperability examples

## Structure
- `01-syscalls/` covers basic Linux syscall programs and console I/O.
- `02-branches/` covers jumps, comparisons, loops, and conditional control flow.
- `03-c-interop/` includes assembly exercises plus a small C file used with assembly.
- `04-exercises/` collects additional intermediate exercises.
- `05-strings/` includes the most substantial string-processing exercises.
- `06-advanced-exercises/` contains the later, larger assembly exercises.

## How to Run
Most `.asm` files are NASM-style Linux examples. A typical build flow is:

```bash
nasm -f elf64 path/to/file.asm -o file.o
ld file.o -o file
./file
```

Some older examples may target 32-bit Linux interrupts or require linking with C; check the source before compiling.
