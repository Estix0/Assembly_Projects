; (2*1) + (2*4)
section .data
  result db " ", 10

section .bss
  num1 resd 1 ;reserve space to store the result of the first parentheses

section .text 
  global _start

_start:
  mov eax, 2
  mov ebx, 1
  mul ebx

  mov [num1], eax ;storing the result in num1

  mov eax, 2
  mov ebx, 4
  mul ebx

  ;Division to split it properly
  add eax, [num1]
  mov ebx, 10
  xor edx, edx
  div ebx

  add eax, '0'
  add edx, '0'
  mov [result], al
  mov [result+1], dl

  mov eax, 4
  mov ebx, 1
  mov ecx, result
  mov edx, 2
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80
