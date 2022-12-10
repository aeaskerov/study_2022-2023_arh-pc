%include 'in_out.asm'

SECTION .data
    msg db "Результат: ",0

SECTION .text
    global _start

_start:
    pop ecx
    pop edx
    sub ecx,1
    mov ebx,1

next:
    cmp ecx,0h
    jz _end
    pop eax
    call atoi
    mul ebx
    mov ebx,eax
    loop next

_end:
    mov eax,msg
    call sprint
    mov eax,ebx
    call iprintLF
    call quit