section .data
  result db " ", 10
  opener db "Napisz slowo do skrocenia:  ", 10
  opener_len equ $-opener

section .bss
  input: resb 64

section .text 
  global _start

_start:

  mov eax, 4
  mov ebx, 1
  mov ecx, opener
  mov edx, opener_len
  int 0x80

  mov eax, 3
  mov ebx, 0
  mov ecx, input
  mov edx, 64
  int 0x80

  xor esi, esi

  
  mov eax, 4
  mov ebx, 1  
  mov ecx, input 
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80
