; Lê e escreve o que foi lido em terminal
; não usa variável não-inicializada para tamanho lido
;   usa push -> pop para salvar temporáriamente na pilha
%define maxChars 21

section .data
    strOla  : db "Entrada (max 20 char): ",0
    strBye  : db "Vc digitou           : ",0
    strByeL : equ $-strBye

section .bss
    strLida : resb maxChars ; "char + enter"

section .text
    global _start

_start:
    ; write
    mov rax, 1
    mov rdi, 1
    mov rsi, strOla
    mov rdx, strByeL ; mesmo tamanho
    syscall

    ; read
    mov rax, 0
    mov rdi, 1
    mov rsi, strLida
    mov rdx, maxChars
    syscall

l1:
    ; guarda no. chars lidos
    push rax 

l2:
    ; write
    mov rax, 1
    mov rdi, 1
    mov rsi, strBye
    mov rdx, strByeL ; mesmo tamanho
    syscall    
 
    ; write
    mov rax, 1
    mov rdi, 1
    mov rsi, strLida
l3:
    ; retorna no. de chars lidos
    pop rdx             
l4:
    syscall  

fim:
    mov rax, 60
    mov rdi, 0
    syscall
