;2/2 + 2/0
section .data
  result db " ", 10

section .bss 
  num1 resd 1

section .text
  global _start

_start:
  xor edx, edx
  mov eax, 2
  mov ebx, 2
  div ebx

  mov [num1], eax
  xor eax, eax
  xor ebx, ebx

  mov eax, 2
  div ebx

  add eax, [num1]
  add eax, '0'

  mov [result], al

  mov eax, 4 
  mov ebx, 1
  mov ecx, result
  mov edx, 2
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80


