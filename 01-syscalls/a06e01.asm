; the evil papagali code!
%define maxChars 10

section .data
   strOla : db "Hello?", 10, 0
   strOlaL: equ $ - strOla      ; cuidado: strOlaL "non-ecxiste!" (equ)

   strBye : db "Voce digitou: ", 0
   strByeL: equ $ - strBye

   strLF  : db 10 ; quebra de linha
   strLFL : db 1

section .bss
   strLida  : resb maxChars
   strLidaL : resd 1

section .text
	global _start

_start:
   ; ssize_t write(int fd , const void *buf, size_t count);
   ; eax     write(int ebx, const void *ecx, size_t edx  );
   mov rax, 1
   mov rdi, 1  ; std_file
   mov rsi, strOla
   mov rdx, strOlaL
   syscall

leitura:
   mov dword [strLidaL], maxChars

   ; ssize_t read(int fd , const void *buf, size_t count);
   ; eax     read(int ebx, const void *ecx, size_t edx  );
   mov rax, 0  ; READ
   mov rdi, 1
   mov rsi, strLida
   mov rdx, [strLidaL]
   syscall

   mov [strLidaL], eax

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
   ; void _exit(int status);
   ; void _exit(int ebx   );
   mov rax, 60
   mov rdi, 0
   syscall
