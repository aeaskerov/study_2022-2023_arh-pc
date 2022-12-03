%include 'in_out.asm'
section .data
    msg1 db 'Введите A: ',0h
    msg2 db 'Введите B: ',0h
    msg3 db 'Введите C: ',0h
    msg db 'Наименьшее число: ',0h

section .bss
    min resb 10
    A resb 10
    B resb 10
    C resb 10

section .text
    global _start

_start:
    ; ------ Вывод сообщения Введите A
    mov eax,msg1
    call sprint
    ; ------ Ввод A
    mov ecx,A
    mov edx,10
    call sread
    ; ------ Преобразование A из символа в число
    mov eax,A
    call atoi
    mov [A],eax
    ; ------ Вывод сообщения Введите B
    mov eax,msg2
    call sprint
    ; ------ Ввод B
    mov ecx,B
    mov edx,10
    call sread
    ; ------ Преобразование B из символа в число
    mov eax,B
    call atoi
    mov [B],eax
    ; ------ Вывод сообщения Введите C
    mov eax,msg3
    call sprint
    ; ------ Ввод C
    mov ecx,C
    mov edx,10
    call sread
    ; ------ Преобразование C из символа в число
    mov eax,C
    call atoi
    mov [C],eax
    ; ------ Записываем A в переменную min
    mov ecx,[A]
    mov [min],ecx
    ; ------ Сравниваем А и С как числа, наверное
    cmp ecx,[C] ; Сравниваем А и С
    jl check_B ; Если А < С, то переход на метку check_B
    mov ecx,[C] ; Иначе ecx = C
    mov [min],ecx
    ; ------ Преобразование min(A,C) из символа в число
    check_B:
    ; ------ Сравниваем min(A,C) и B как числа
	mov ecx,[min]
	cmp ecx,[B] ; Сравниваем min(A,C) и B
	jl fin ; Если min(A,C)<B, то переход на fin
	mov ecx,[B] ; Иначе ecx = B
	mov [min],ecx
    ; Вывод результата
    fin:
	mov eax,msg
	call sprint ; Вывод сообщения Наименьшее число
	mov eax,[min]
	call iprintLF ; Вывод min(A,B,C)
	call quit ; Выход