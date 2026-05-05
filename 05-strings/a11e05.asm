; chamada para printf
;  x64 

; montar e ligar:
;   nasm -f elf64 a11e05.asm ; gcc -m64 -no-pie a11e05.o -o a11e05.x

%define _exit   60

section .data
    strCtrl : db 'I can kill you %s, %d times!', 10, 0 ; null-terminated
    umInt   : dd 2
    umaStr  : db 'with my brain', 0 ; null-terminated

extern printf

section .text
    global main

main:
    ; printf("Ola mundo %d %s\n", umInt, umaStr);

    ; não será salvo registradores

    ; não será passado ponto-flutuante
    xor rax,rax      ; número de registradores xmm0 é zero

    ; printf("I can kill you %s, %d times!\n", umaStr, umInt)
    ; carrega parâmetros da esquerda para direita nos registradores
    ; RDI, RSI, RDX
    mov rdi, strCtrl ; string de controle para printf
    mov rsi, umaStr  ; endereço para string 'umaStr'
    mov edx, [umInt] ; conteúdo do inteiro 'umInt'
    call printf

fim:
    mov rax, _exit
    mov rdi, 0
    syscall
