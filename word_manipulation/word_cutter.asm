section .data
  napis: db "Napis", 0

section .text 
  global _start

_start:

  mov esi, napis
  xor edx, edx

  counter:
  mov al, [esi]
  cmp al, 0
  jz counter_end

  inc esi
  inc edx

  jmp counter
  counter_end:

  mov [esi-1], 0

  mov eax, 4 ;sys write
  mov ebx, 1  
  mov ecx, napis 
  int 0x80

  mov eax, 1 ;end program
  mov ebx, 0
  int 0x80
