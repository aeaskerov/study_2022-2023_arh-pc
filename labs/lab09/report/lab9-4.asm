%include 'in_out.asm'
SECTION .data
    function db "Функция: f(x)=8x-3",0
    result db "Результат: ",0

SECTION .text
    global _start:
_start:
    mov eax,function
    call sprintLF

    pop ecx ;num. of arg-ts
    pop edx ;prog. name
    sub ecx,1 ;decrement ecx
    mov esi,0 ;current sum
    mov ebx,8
    ;mov edx,3
next:
    cmp ecx,0h ;if ecx is not empty
    jz _end ;then: end prog.
    pop eax ;else: take next ecx value from stack
    call atoi ;int(eax)
    mul ebx
    sub eax,3
    add esi,eax
    loop next
_end:
    mov eax,result
    call sprint
    mov eax,esi
    call iprintLF
    call quit