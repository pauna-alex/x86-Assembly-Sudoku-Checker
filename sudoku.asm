%include "../include/io.mac"

extern printf
global check_row
global check_column
global check_box
; you can declare any helper variables in .data or .bss

section .text


; int check_row(char* sudoku, int row);
check_row:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov     esi, [ebp + 8]  ; char* sudoku, pointer to 81-long char array
    mov     edx, [ebp + 12]  ; int row 
    ;; DO NOT MODIFY
   
    ;; Freestyle starts here
	 xor ebx, ebx
    xor ecx, ecx
    mov eax, edx
    mov edx, 9
    mul edx
    lea edi, [esi + eax]

start_loop_sum:
    cmp ebx, 9
    jge end_loop_sum

    movzx eax, byte [edi + ebx]
    add ecx, eax

    inc ebx
    jmp start_loop_sum
end_loop_sum:
    cmp ecx, 45
    jne not_okay

    xor ebx, ebx
    mov eax, 1

start_loop_product:
    cmp ebx, 9
    jge end_loop_product

    movzx ecx, byte [edi + ebx]
    mul ecx

    inc ebx
    jmp start_loop_product
end_loop_product:
    cmp eax, 362880
    jne not_okay

    mov eax, 1
    jmp end_check_row

not_okay:
    mov eax, 2

    ;; MAKE SURE TO LEAVE YOUR RESULT IN EAX BY THE END OF THE FUNCTION
    ;; Remember: OK = 1, NOT_OKAY = 2
    ;; ex. if this row is okay, by this point eax should contain the value 1 

    ;; Freestyle ends here
end_check_row:
    ;; DO NOT MODIFY

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
    
    ;; DO NOT MODIFY

; int check_column(char* sudoku, int column);
check_column:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov     esi, [ebp + 8]  ; char* sudoku, pointer to 81-long char array
    mov     edx, [ebp + 12]  ; int column 
    ;; DO NOT MODIFY
   
    ;; Freestyle starts here
	
 xor     ebx, ebx
    xor     ecx, ecx

sum_loop_col:
    cmp     ebx, 9
    jge     sum_end_col

    mov     eax, ebx
    imul    eax, 9
    add     eax, edx
    movzx   edi, byte [esi + eax]
    add     ecx, edi

    inc     ebx
    jmp     sum_loop_col

sum_end_col:
    cmp     ecx, 45
    jne     not_okay2

    xor     ebx, ebx
    mov     eax, 1

product_loop_col:
    cmp     ebx, 9
    jge     product_end_col

    mov     ecx, ebx
    imul    ecx, 9
    add     ecx, edx
    movzx   edi, byte [esi + ecx]
    imul    eax, edi

    inc     ebx
    jmp     product_loop_col

product_end_col:
    cmp     eax, 362880
    jne     not_okay2

    mov     eax, 1
    jmp     end_check_column

not_okay2:
    mov     eax, 2


    ;; MAKE SURE TO LEAVE YOUR RESULT IN EAX BY THE END OF THE FUNCTION
    ;; Remember: OK = 1, NOT_OKAY = 2
    ;; ex. if this column is okay, by this point eax should contain the value 1 

    ;; Freestyle ends here
end_check_column:
    ;; DO NOT MODIFY

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
    
    ;; DO NOT MODIFY


; int check_box(char* sudoku, int box);
check_box:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov     esi, [ebp + 8]  ; char* sudoku, pointer to 81-long char array
    mov     edx, [ebp + 12]  ; int box 
    ;; DO NOT MODIFY
   
    ;; Freestyle starts here

	mov eax,edx
    xor edx,edx
    mov ecx,3
    div ecx
    imul eax,ecx
    imul edx,ecx

    mov ebx,eax
    mov ecx,edx

    imul ebx,9
    add ebx,ecx

    xor edi,edi
    xor edx,edx
    xor ecx,ecx

linie_loop:
    cmp edi, 3
    jge sfarsit_bucla

    xor edx, edx

coloana_loop:
    cmp edx, 3
    jge urmatoarea_linie
    mov eax,edi
    imul eax,9
    add eax,ebx
    add eax,edx

    push ecx
    movzx ecx, byte [esi+eax]
    mov eax,ecx
    pop ecx
    add ecx,eax

    inc edx
    jmp coloana_loop

urmatoarea_linie:
    inc edi
    jmp linie_loop

sfarsit_bucla:
    cmp     ecx, 45
    jne     not_okay3

    xor edi,edi
    xor edx,edx
    xor ecx,ecx
    mov ecx,1

linie_loop2:
    cmp edi, 3
    jge sfarsit_bucla2

    xor edx, edx

coloana_loop2:
    cmp edx, 3
    jge urmatoarea_linie2

    mov eax,edi
    imul eax,9
    add eax,ebx
    add eax,edx

    movzx eax, byte [esi+eax]
    imul ecx,eax

    inc edx
    jmp coloana_loop2

urmatoarea_linie2:
    inc edi
    jmp linie_loop2

sfarsit_bucla2:
    cmp     ecx, 362880
    jne     not_okay3

    mov     eax, 1
    jmp     end_check_box

not_okay3:
    mov eax,2

    ;; MAKE SURE TO LEAVE YOUR RESULT IN EAX BY THE END OF THE FUNCTION
    ;; Remember: OK = 1, NOT_OKAY = 2
    ;; ex. if this box is okay, by this point eax should contain the value 1 

    ;; Freestyle ends here
end_check_box:
    ;; DO NOT MODIFY

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
    
    ;; DO NOT MODIFY
