%include 'in_out.asm'

SECTION .data
    filename db 'name.txt',0h
    msg1 db 'Как Вас зовут?',0h
    msg2 db 'Меня зовут ',0h
SECTION .bss
    contents resb 255
SECTION .text
GLOBAL _start
_start:
    mov eax,msg1 ;Вывод на экран Как вас зовут?
    call sprintLF

    mov ecx,contents
    mov edx,255
    call sread ;Ввод имени

    mov ecx,0777o
    mov ebx,filename
    mov eax,8
    int 80h ;create a file

    mov ecx,1
    mov ebx,filename
    mov eax,5
    int 80h ;open the file write only

    mov esi,eax ;save descriptor

    mov eax,msg2
    call slen ;calc. msg's size

    mov edx,eax
    mov ecx,msg2
    mov ebx,esi
    mov eax,4 ;write question into the file
    int 80h

    mov eax,contents
    call slen

    mov edx,eax
    mov ecx,contents
    mov eax,4 ;write answer into the file
    int 80h

    mov ebx,esi
    mov eax,6
    int 80h

    call quit