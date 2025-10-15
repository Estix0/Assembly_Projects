; (2*1) + (2*4) using the stack
section .data
  result db " ", 10

section .text
  global _start

_start:
  mov eax, 2

  mov ebx, 1
  mul ebx

  ;push the result to the stack
  push eax

  mov eax, 2 
  mov ebx, 4
  mul ebx

  ;pop the result of the first parentheses and store it in ecx
  pop ecx
  add eax, ecx ;add the stored value from ecx to eax

  ;divide to make sure it's properly split
  mov ebx, 10
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
