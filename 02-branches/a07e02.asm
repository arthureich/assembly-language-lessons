section .data
    passo : db 0, 10

section .text
    global _start
_start:
    mov r8, 5
repete:
        ; codigo para imprimir o "passo"
        mov rax, 1
        mov rdi, 1
        mov [passo], r8b
        add byte [passo], 0x30
        mov rsi, passo
        mov rdx, 2
        syscall

    dec r8
    jnz repete

fim:
    mov rax, 60
    mov rdi, 0
    syscall
