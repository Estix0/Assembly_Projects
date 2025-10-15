; 2 * 1 * 2 * 4
section .data
  result db " ", 10

section .text 
  global _start

_start:

  mov eax, 2

  mov ebx, 1
  mul ebx

  mov ebx, 2
  mul ebx

  mov ebx, 4
  mul ebx

  ;The result of this multiplication equals to 16
  ;so to print it we need to first split it in two to then convert it to ASCII

  mov ebx, 10
  xor edx, edx ;empty edx to make sure it only has the rest of the division
  div ebx

  ;Now we can add 0 in front of both our numbers to convert them to ASCII
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
