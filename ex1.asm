.global _start

.section .text
_start:


mov (Num1), %r9 #r9 = num1
mov (Num2), %r10 #r10 = num2
xorq %rax, %rax #temp1
xorq %r13, %r13 #temp2
xorq %rcx, %rcx #num of bits in num1
xorq %rdx, %rdx #num of bits in num2
xorq %r11, %r11 #i
xorq %r12, %r12 #j
movb $0, (BitCheck)

Loop_HW1:
cmp $32, %r11 #check if we are on the end of the loop
je Loop2_HW1

movl %r9d, %eax #eax = shifted_num
and $1, %eax #eax = the lsb of shifted_num
cmp $1, %eax
je inc_HW1
inc %r11
shr %r9
jmp Loop_HW1


inc_HW1:
inc %rcx
inc %r11
shr %r9
jmp Loop_HW1
  
#----------------------------------------------
xorq %rax, %rax

Loop2_HW1:
cmpl $32, %r12d #check if we are on the end of the loop
je end_HW1

movl %r10d, %eax #eax = shifted_num
and $1, %eax #eax = the lsb of shifted_num
cmp $1, %eax
je inc2_HW1
inc %r12
shr %r10
jmp Loop2_HW1


inc2_HW1:
inc %rdx
inc %r12
shr %r10
jmp Loop2_HW1
#---------------------------------------------

end_HW1:
cmp %rcx, %rdx
je good_end_HW1
jmp bad_end_HW1


good_end_HW1:
movb $1, (BitCheck)
jmp finito_HW1

bad_end_HW1:
movb $0, (BitCheck)
jmp finito_HW1


finito_HW1:

