; exemplo de chamada de procedimento

; leading zeros dos endereços foram ocultados

%define _exit  60
%define _write 1

section .data
    strOla  : db "You can't take the sky from me", 10
    strOlaL : equ $-strOla

section .text
    global _start

_start:             ; RSP = 0x7fffffffdf00
   ; PUSH fim       ; RIP = 0x401000 <_start>
   ; PC = procAsk  
    call procAsk    ; end: 0x401000  
                    ; 0x0000000ce8 -> e8(call) + deslocamento 

fim:                ; RSP = 0x7fffffffdf00
    mov rax, _exit  ; RIP = 0x401005 <fim>
    mov rdi, 0
    syscall        

procAsk:            ; RSP = 0x7fffffffdef8 (8 bytes)
    mov rax, _write ; RIP = 0x401011 <procAsk>
    mov rdi, 1      ; [RSP] = 0x401005 <fim>
    mov rsi, strOla
    mov rdx, strOlaL
    syscall
   
   ; POP PC
    ret
