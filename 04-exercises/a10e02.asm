; deslocamento lógico

section .text
    global _start

_start:
    mov ax, 0xEE01
    mov bx, 0xEE01
desloc1:
    shl ax, 1
    shr bx, 1
desloc2:
    shl ax, 4
    shr bx, 4
fim:
    mov rax, 60
    mov rdi, 0
    syscall
