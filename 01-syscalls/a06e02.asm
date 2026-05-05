; leitura do arquivo a06e02.txt
; impressão no terminal de arquivo de texto
;   cria arquivo caso inexistente

%define maxChars 20 ; no. máximo de caracteres a serem lidos

; valores em octal
%define readOnly  0o ; flag open()
%define writeOnly 1o ; flag open()
%define readwrite 2o ; flag open()
%define openrw  102o ; flag open()
%define userWR 644o  ; Read+Write+Execute
%define append 2101o ; flag open() criar/escrever no final

section .data
   fileName: db "a06e02.txt",0

section .bss
   texto: resb 25
   fileHandle: resd 1

section .text
   global _start

_start:
   ; int open(const char *pathname, int flags, mode_t mode);
   mov rax, 2        ; open file
   mov rdi, fileName ; *pathname
   mov rsi, openrw   ; flags
   mov rdx, userWR   ; mode
   syscall

   mov [fileHandle], eax
leitura:
   ; ssize_t read(int fd, void *buf, size_t count); 
   mov rax, 0            ; leitura do arquivo
   mov rdi, [fileHandle] ; fd
   mov rsi, texto        ; *buf
   mov rdx, maxChars     ; count
   syscall

escrita:
   mov rax, 1   ; escrita em terminal
   mov rdi, 1
   mov rsi, texto
   mov rdx, maxChars
   syscall

fecha:
   mov rax, 3  ; fechar arquivo
   mov rdi, [fileHandle]
   syscall

fim:
   mov rax, 60
   mov rdi, 0
   syscall
