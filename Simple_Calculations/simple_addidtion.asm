section .data:
  result db " ", 10 

global _start

_start:

  mov bl, 255
  add bl, 3

  mov [result], ebx

  mov eax, 4
  mov bl, 1
  mov ecx, result
  mov edx, 2
  int 0x80

  mov eax, 1
  int 0x80
