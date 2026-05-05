; repetição infinita
; comando "top" linux -> k: PID -> sigkill
;         ou ctrl+c
section .bss
    destino: resq 1

section .text
    global _start

_start:
    ; play dead
    jmp _start      ; label é o destino
   
    ;mov rax, _start
    ;jmp rax        ; registrador contém destino

    ;mov qword [destino], _start
    ;jmp [destino]  ; variavel contém destino 

fim:
    mov rax, 60
    mov rdi, 0
    syscall
