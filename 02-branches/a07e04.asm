; the evil lowercase papagali code!
%define maxChars 26

section .data
    strOla : db "Hello? (max 25 caracteres)", 10, 0
    strOlaL: equ $ - strOla     

    strBye : db "Voce digitou: ", 0
    strByeL: equ $ - strBye

    strErro : db "Voce digitou mais do que 25 caracteres", 10, "Programa encerrado", 10, 0
    strErroL: equ $ - strErro

    strLF  : db 10 ; quebra de linha
    strLFL : db 1

section .bss
    strLida  : resb maxChars
    strLidaL : resd 1

section .text
	global _start

_start:
    mov rax, 1
    mov rdi, 1  ; std_file
    mov rsi, strOla
    mov rdx, strOlaL
    syscall

leitura:
    mov rax, 0  ; READ
    mov rdi, 1
    mov rsi, strLida
    mov rdx, maxChars
    syscall

    mov [strLidaL], eax

verificacaoDeEntrada:
    cmp byte [strLida + eax-1], 10
    je entradaFor
    ; erro
    mov rax, 1  ; WRITE
    mov rdi, 1
    mov rsi, strErro
    mov rdx, strErroL
    syscall    
    jmp fim

; for(ecx = 0; ecx < strLidaL; ecx++){ ... }
entradaFor:
    mov ecx, 0           ; ecx = 0
    mov r8d, [strLidaL]  ; reg eh rapido
    dec r8d

    preBloco:               
        cmp ecx, r8d ; ecx < strLidaL
        jl blocoFor
        jmp saidaFor
    blocoFor:
        ; acessa String e aplica lowercase byte-a-byte
        or byte [strLida + ecx], 0x20
        inc ecx                 ; ecx++
        jmp preBloco


saidaFor:
resposta:
    mov rax, 1  ; WRITE
    mov rdi, 1
    mov rsi, strBye
    mov rdx, strByeL
    syscall

    mov rax, 1  ; WRITE
    mov ebx, 1
    mov rsi, strLida
    mov rdx, [strLidaL]
    syscall

fim:
    mov rax, 60
    mov rdi, 0
    syscall
