; exemplo de 
;    chamada de sub-programas em x64

; sub-programa para encontrar o tamanho de string null-terminated
; cabeçalho em C: int strLength(char *c[]) em arquivo separado

%define _write  1
%define _exit   60

section .data
    strTeste1 : db 'string null-terminated', 0       ; 22 + 1
    strTeste2 : db 'outra string null-terminated', 0 ; 28 + 1
    strTeste3 : db 'Yes Captain', 0                  ; 11 + 1

section .bss
    str1L : resd 1
    str2L : resd 1
    str3L : resd 1

section .text
    global _start

_start:
    ; valores para teste de salvamento de registradores
    mov rax, 1
    mov rbx, 2
    mov rcx, 3
    mov rdx, 4
    mov r8 , 5
    mov r9 , 6
    mov r10, 7
    mov r11, 8
    mov r12, 9
    mov r13, 10
    mov r14, 11
    mov r15, 12
    mov rdi, 13
    mov rsi, 14

    ; passo 1 - Antes da chamada CALL
    ; salvar registradores RAX, RCX, RDX, R8 - R11
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11

    ; passo 2 - Antes da chamada CALL
    ; Passagem de parâmetros
    mov rdi, strTeste1

    ; passo 3 - chamada CALL
    call strLength

    ; retorno do sub-programa em EAX
    mov [str1L], eax ; inteiro de 32bit

    ; passo 4
    ; remover parâmetros da PILHA
    ; add rsp, 8 ; +8 para cada parâmetro empilhado
                 ; porém não existem neste exemplo
                 ; 90% dos códigos utilizam até 6 parâmetros

    ; passo 5
    ; recuperar registradores RAX, RCX, RDX, R8 - R1
    pop r11 ; último empilhado
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax  ; primeiro empilhado

fim:
    mov rax, _exit
    mov rdi, 0
    syscall

;%include "a11e03bstrLengh.asm"
%include "a11e03bfuncoes/a11e03bstrLengh.asm"
