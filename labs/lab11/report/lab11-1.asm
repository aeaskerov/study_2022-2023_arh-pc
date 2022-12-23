%include 'in_out.asm'
SECTION .data
    filename db 'readme.txt',0h
    msg db 'Введите строку для записи в файл: ',0h

SECTION .bss
    contents resb 255

SECTION .text
GLOBAL _start
_start:
    ;Печать сообщения msg
    mov eax,msg
    call sprint

    ;Запись введённой с клавиатуры строки в 'contents'
    mov ecx,contents
    mov edx,255
    call sread

    ;Открытие существующего файла ('sys_open')
    mov ecx,2
    mov ebx,filename
    mov eax,5
    int 80h

    ;Запись дескриптора файла в 'esi'
    mov esi,eax

    ;Расчёт длины введённой строки
    mov eax,contents
    call slen

    ;Записываем в файл 'contents' ('sys_write')
    mov edx,eax
    mov ecx,contents
    mov ebx,esi
    mov eax,4
    int 80h

    ;Закрываем файл ('sys-close')
    mov ebx,esi
    mov eax,6
    int 80h

    call quit