%define maxChars 10

section .data
   strOla : db "Digite algo: "
   strOlaL: equ $ - strOla

   strBye : db "Você digitou: "
   strByeL: equ $ - strBye

   strLF  : db 10 ; quebra de linha
   strLFL : equ 1

section .bss
   strLida   : resb maxChars
   strLidaL : resd 1

section .text
	global _start

_start:
   ; ssize_t write(int fd , const void *buf, size_t count);
   ; rax     write(int rdi, const void *rsi, size_t rdx  );
   mov rax, 1  ; WRITE
   mov rdi, 1
   mov rsi, strOla
   mov rdx, strOlaL
   syscall

leitura:
   mov dword [strLidaL], maxChars

   ; ssize_t read(int fd , const void *buf, size_t count);
   ; rax     read(int rdi, const void *rsi, size_t rdx  );
   mov rax, 0  ; READ
   mov rdi, 1
   mov rsi, strLida
   mov edx, [strLidaL]
   syscall

   mov [strLidaL], eax

resposta:
   mov rax, 1  ; WRITE
   mov rdi, 1
   mov rsi, strBye
   mov rdx, strByeL
   syscall

   mov rax, 1  ; WRITE
   mov rdi, 1
   mov rsi, strLida
   mov edx, [strLidaL]
   syscall

quebradeLinha:
   mov rax, 1  ; WRITE
   mov rdi, 1
   mov rsi, strLF
   mov rdx, strLFL
   syscall

fim:
   ; void _exit(int status);
   ; void _exit(int rdi   );
   mov rax, 60
   mov rdi, 0
   syscall
