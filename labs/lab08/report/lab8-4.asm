%include 'in_out.asm'

section .data
    msg1 db 'Введите x: ',0h
    msg2 db 'Введите a: ',0h
    result db 'Результат: ',0h

section .bss
    x resb 10
    a resb 10

section .text
    global _start

_start:
    ; dealing with 'x'
    mov eax,msg1
    call sprint

    mov ecx,x
    mov edx,10
    call sread ; entering 'x'

    ;mov eax,x
    ;call atoi
    ;mov [x],eax ; converting x to int

    ; dealing with 'a'
    mov eax,msg2
    call sprint

    mov ecx,a
    mov edx,10
    call sread ; entering 'a'
    
    mov eax,result
    call sprint

    ;mov eax,a ; not a number, so without brackets
    ;call atoi
    ;mov [a],eax ; converting a to int

    ; Comparing x and a
    mov eax,a
    call atoi
    mov ecx,eax
    mov eax,x
    call atoi
    ;mov ecx,[x] ; x is a num, so with brackets
    cmp eax,ecx
    jg _label1
    ; Otherwise
    ;mov eax,result
    ;call sprint
    ;mov eax,[x]
    call iprintLF
    jmp _label2

_label1:
    ;mov eax,[x]
    add eax,ecx
    call iprintLF

_label2:
    call quit
