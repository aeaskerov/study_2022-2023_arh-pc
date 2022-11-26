%include 'in_out.asm'

SECTION .data
    expression: DB 'Выражение: f(x)=(x*1/3+5)*7',0h
    request: DB 'Введите x: ',0h
    result: DB 'Результат: ',0h

SECTION .bss
    buf1: RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax,expression
    call sprintLF

    mov eax,request
    call sprint

    mov ecx,buf1
    mov edx,80
    call sread ; Вводим x в ecx

    mov eax,result
    call sprint

    xor eax,eax
    mov eax,buf1
    call atoi
    xor edx,edx ; Обнуляем остаток
    mov ebx,3
    div ebx ; Деление x на 3. Деление eax на ebx. Результат в eax

    add eax,5 ; Прибавляем 5 к eax

    mov ebx,7
    mul ebx ; Умножение на 7. Результат в eax

    call iprintLF ; Печать eax. Результат вычислений

    call quit