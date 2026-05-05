; Identifica que v1 é maior, menor ou igual à v2
; Entradas:
;     v1 e v2 (dígitos)
; Saída:
;     string maior, menor ou igual

section .data
   maior    : db "v1 eh maior do que v2", 10
   menor    : db "v1 eh menor do que v2", 10
   mTamanho : equ $-menor

   iguais   : db "v1 eh igual a v2", 10
   iTamanho : equ $-iguais

   d1 : db "Entre com único digito v1: "
   d2 : db "Entre com único digito v2: "
   dTamanho : equ $-d2

section .bss
   v1: resb 2 ; 2 char, antecipando "enter"
   v2: resb 2 ; 

section .text
   global _start

_start:

   ; entrada de v1
   mov rax, 1
   mov rdi, 1
   mov rsi, d1
   mov rdx, dTamanho
   syscall

   ; leitura de v1
   mov rax, 0
   mov rdi, 1
   mov rsi, v1
   mov rdx, 2
   syscall

   ; entrada de v2
   mov rax, 1
   mov rdi, 1
   mov rsi, d2
   mov rdx, dTamanho
   syscall

   ; leitura de v2
   mov rax, 0
   mov rdi, 1
   mov rsi, v2
   mov rdx, 2
   syscall

   ; compara v1 com v2 (valores ASCII)
   mov al, [v1]
   cmp al, [v2]
   je lIguais ; v1 = v2 ; observação: linha logicamente opcional
   jl lMenor  ; v1 < v2
   jg lMaior  ; v1 > v2

lIguais:
   mov rax, 1
   mov rdi, 1
   mov rsi, iguais
   mov rdx, iTamanho
   syscall   
   jmp fim  ; se acessou esta perna, não pode continuar

lMenor:
   mov rax, 1
   mov rdi, 1
   mov rsi, menor
   mov rdx, mTamanho
   syscall
   jmp fim  ; se acessou esta perna, não pode continuar

lMaior:
   mov rax, 1
   mov rdi, 1
   mov rsi, maior
   mov rdx, mTamanho
   syscall
   jmp fim  ; observação: linha logicamente opcional

fim:
   mov rax, 60
   mov rdi, 0
   syscall
