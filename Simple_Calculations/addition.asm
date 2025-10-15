; 2+0+2+4
section .data
  result db " ", 10

section .text 
  global _start

_start:

  mov eax, 2
  add eax, 0
  add eax, 2
  add eax, 4

  add eax, '0' ;add 0 in front of it to covert it to ASCII (see ASCII tables)
  mov [result], al
  
  mov eax, 4
  mov ebx, 1  
  mov ecx, result 
  mov edx, 2
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80
