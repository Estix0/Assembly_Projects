section .data
  opener db "Napisz slowo do odwrocenia:  ", 10

section .bss
  input: resb 64
  output: resb 64

section .text 
  global _start

_start:

  mov eax, 4 ;printf 
  mov ebx, 1
  mov ecx, opener
  mov edx, 32
  int 0x80

  mov eax, 3 ;scanf
  mov ebx, 0
  mov ecx, input
  mov edx, 64
  int 0x80

  mov esi, input
  xor edx, edx

counter_loop:
  movzx ecx, byte [esi]
  inc esi
  cmp cl, ''
  je counter_loop_end
  inc edx
  jmp counter_loop
counter_loop_end:

  dec esi
  dec esi
  mov edi, output
  mov ecx, edx

reverse_word_loop:
  cmp ecx, 0
  jz reverse_word_loop_end
  mov al, [esi]
  mov [edi], al
  dec esi
  inc edi
  dec ecx
  jmp reverse_word_loop
reverse_word_loop_end:

  mov eax, 4 ;printf
  mov ebx, 1 
  mov ecx, output
  int 0x80

  mov eax, 1 ;end program
  int 0x80
