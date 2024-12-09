.global _start


.section .text
_start:
xor %rax, %rax
xor %r11, %r11 
xor %rcx, %rcx
xor %rdx, %rdx
xor %r9, %r9
xor %r12, %r12
xor %r14, %r14
xor %r13, %r13
xor %r15, %r15

leaq node, %r11 #r11 = &node;
movq $0, %r9 #bool is_inserted = false

cmpq $0, root
je root_is_null_HW1
movq root, %rax #rax = temp = root*
jmp Loop_HW1


root_is_null_HW1:
movl $1, %r9d   #is_inserted = true
movq $0, 12(%r11)
movq $0, 0(%r11)
movq %r11, root
jmp finito_HW1

Loop_HW1:

movl 8(%r11), %ecx #rcx = node->data
movl 8(%rax), %edx #rdx = temp->data
cmpl %ecx, %edx
movl $0, %r9d   #is_inserted = false
je finito_HW1
cmp %ecx, %edx # node->data > temp->data
jl right_case_HW1 

cmpq $0, (%rax) #check if temp has left son
je insert_from_left_of_rax_HW1
mov (%rax), %rax    #temp = temp->left
jmp Loop_HW1

right_case_HW1:
cmpq $0, 12(%rax) #check if temp has right son
je insert_from_right_of_rax_HW1
movq 12(%rax), %r15
movq %r15, %rax
jmp Loop_HW1

insert_from_left_of_rax_HW1:
movl $1, %r9d   #is_inserted = true
movq $0, 12(%r11)
movq $0, 0(%r11)
movq %r11, %r15
movq %r15, (%rax)
jmp finito_HW1

insert_from_right_of_rax_HW1:
movl $1, %r9d   #is_inserted = true
movq $0, 12(%r11)
movq $0, 0(%r11)
movq %r11, %r15
movq %r15, 12(%rax)
jmp finito_HW1


finito_HW1:





