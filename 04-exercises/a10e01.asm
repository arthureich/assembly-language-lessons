; negação

section .text
    global _start

_start:
    mov ax, 0xEE01
negacao:
    neg ax

fim:
    mov rax, 60
    mov rdi, 0
    syscall
