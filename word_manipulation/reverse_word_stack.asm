section .data
  napis: db "Napis", 0

section .bss
  reversed: resb 6

section .text 
  global _start

_start:

  xor edx, edx
  mov esi, napis

  push_to_stack:
  mov al, [esi]
  cmp al, 0
  jz push_to_stack_end

  movzx eax, al
  push eax

  inc esi
  inc edx

  jmp push_to_stack
  push_to_stack_end:

  mov esi, reversed
  mov ecx, edx

  pull_from_stack:
  cmp ecx, 0
  jz pull_from_stack_end

  pop eax
  mov [esi], al

  inc esi
  dec ecx

  jmp pull_from_stack
  pull_from_stack_end:


  mov eax, 4 ;printf
  mov ebx, 1 
  mov ecx, reversed
  int 0x80

  mov eax, 1 ;end program
  int 0x80
