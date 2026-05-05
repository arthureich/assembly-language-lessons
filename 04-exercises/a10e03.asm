; deslocamento aritmético

section .text
    global _start

_start:
    mov ax, 0xEE01
    mov bx, 0xEE01
desloc1:
    sal ax, 1
    sar bx, 1
desloc2:
    sal ax, 4
    sar bx, 4
fim:
    mov rax, 60
    mov rdi, 0
    syscall
