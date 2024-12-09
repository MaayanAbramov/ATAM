.global _start

.section .text
#don't forget to xor all the registers
_start:
xor %rax, %rax 
xor %rbx, %rbx
xor %rcx, %rcx #saw_space_1
xor %rdx, %rdx #saw_space_2
xor %rsi, %rsi #saw_char_after_space1
xor %rdi, %rdi #saw_char_after_space2
xor %r8, %r8 #before_equal_is_valid
xor %r9, %r9 #after_equal_is_valid
xor %r10, %r10
xor %r11, %r11
xor %r12, %r12 
xor %r13, %r13 
xor %r14, %r14
xor %r15, %r15



lea command(%rip), %rax			#rax = address of string
lea command(%rip), %r15
movb (%rax), %bl   #curr char		#bl = curr char
mov $1, %r9
cmpb $0, %bl #if null, return 0 (which means check if other cases are able
je case_2_HW1

Loop1_HW1:
cmp $0, %bl
je contin1_HW1
cmp $32, %bl
je true_contin_2_HW1
cmp $9, %bl
je true_contin_2_HW1

false_contin2_HW1:
jmp contin3_HW1 


true_contin_2_HW1:
mov $1, %rcx
cmp $1, %rsi
jne contin3_HW1
mov $1, %rdx
jmp contin3_HW1


contin3_HW1:#if (*p == 61 && saw_space_1 == true) {
cmp $61, %bl
jne contin5_HW1
cmp $1, %rcx
jne contin5_HW1
cmp $1, %rcx
jne here_HW1
cmp $1, %rdx
jne here_HW1
cmp $1, %rsi
jne here_HW1
cmp $1, %rdi
jne here_HW1
jmp case_2_HW1 #return false

here_HW1:
mov $1, %r9 #after_equal_is_valid
mov %rax, %r10                     # r10 = *p_temp = p
inc %r10
movb (%r10), %r11b #r11 = curr letter = ++p_temp, r12 = saw_non_space_char, r13 = saw_space_temp

Loop2_HW1:
cmp $0, %r11b
je contin4_HW1
cmp $9, %r11b
je true_case_HW1
cmp $32, %r11b
je true_case_HW1
false_case_HW1:
cmp $9, %r9
je p_temp_inc_HW1
cmp $32, %r9
je p_temp_inc_HW1
mov $1, %r12
jmp p_temp_inc_HW1


p_temp_inc_HW1:
inc %r10
movb (%r10), %r11b
jmp Loop2_HW1


true_case_HW1:
cmp $1,%r12
jne else_HW1
mov $0, %r9
jmp contin4_HW1

else_HW1:
mov $1, %r13
jmp false_case_HW1

contin4_HW1:
cmpb $0, %r11b
jne contin5_HW1
cmpb $1, %r9b
jne contin5_HW1
jmp finito_true_HW1


contin5_HW1:
cmp $32, %bl
je preperation_Loop1_HW1
cmp $9, %bl
je preperation_Loop1_HW1
cmp $1, %rcx
jne next_HW1
mov $1, %rsi
next_HW1:
cmp $1, %rdx
jne preperation_Loop1_HW1
mov $1, %rdi
jmp preperation_Loop1_HW1


preperation_Loop1_HW1:
inc %rax
movb (%rax), %bl
jmp Loop1_HW1

contin1_HW1:
cmp $0, %r8
je case_2_HW1
cmp $0, %r9
je case_2_HW1 
#int number_of_strings= r14, same char = r8, r15 = ptr to command, r9 = curr letter
xor %r9, %r9
movq $0, %r8 #same_char = false
movq $0, %r14 #num_strings = 0
movb (%r15), %r9b  #r9 = curr letter
Loop3_HW1:
cmp $0, %r9b
je check_bigger_4_HW1
cmp $1, %r8
jne sec_if_HW1
cmp $9, %r9b
je true_true_HW1
cmp $32, %r9b
je true_true_HW1
jmp sec_if_HW1


true_true_HW1:
mov $0, %r8
jmp sec_if_HW1

sec_if_HW1:
cmp $9, %r9b
je next_iteration_HW1
cmp $32, %r9b
je next_iteration_HW1
cmp $0, %r8
je up_one_HW1
back_HW1:
mov $1, %r8
jmp next_iteration_HW1


up_one_HW1:
inc %r14
jmp back_HW1


next_iteration_HW1:
inc %r15
movb (%r15), %r9b
jmp Loop3_HW1


check_bigger_4_HW1:
cmp $4, %r14
ja case_2_HW1
jmp finito_true_HW1






case_2_HW1:
xor %rax, %rax 
xor %rbx, %rbx #p = curr letter
xor %rcx, %rcx #num of strings
xor %rdx, %rdx #same_char = false
xor %rsi, %rsi #command
xor %rdi, %rdi 
xor %r8, %r8   #saw_space_1
xor %r9, %r9   #saw_space_2
xor %r10, %r10   #saw_char
xor %r11, %r11   #before_equal_is_valid
xor %r12, %r12   #after_equal_is_valid
xor %r13, %r13 
xor %r14, %r14
xor %r15, %r15

lea command(%rip), %rax	
lea command(%rip), %rsi
movb (%rax), %bl

Loop11_HW1:
cmp $0, %bl
je check_strings_bigger_then_3_HW1
cmp $1, %rdx
jne second_if__HW1
cmp $9, %bl
je true_true_true_HW1
cmp $32, %bl
je true_true_true_HW1
jmp second_if__HW1


true_true_true_HW1:
mov $0, %rdx
jmp second_if__HW1

second_if__HW1:
cmp $9, %bl
je loop_next_it_HW1
cmp $32, %bl
je loop_next_it_HW1
cmp $0, %rdx
je inc_s_HW1
contin_back_HW1:
mov $1, %rdx
jmp loop_next_it_HW1

inc_s_HW1:
inc %rcx
jmp contin_back_HW1

loop_next_it_HW1:
inc %rax
movb (%rax), %bl
jmp Loop11_HW1



check_strings_bigger_then_3_HW1:
cmp $3, %rcx
ja case_3_HW1
movb (%rsi), %bl
mov $1, %r11
mov $1, %r12
cmp $0, %bl
je case_3_HW1

Loop22_HW1:
cmp $0, %bl
je return_false_case2_end_of_while_HW1 ###
cmp $32, %bl
je ttrue_HW1
cmp $9, %bl
je ttrue_HW1
jmp fourth_if_HW1

telse_HW1:
cmp $1, %r10
jne else_else_HW1
mov $1, %r9
pplusplus_HW1:
inc %rsi
movb (%rsi), %bl
jmp Loop22_HW1


else_else_HW1: #else { //saw_char=false
mov $1, %r8
jmp pplusplus_HW1


ttrue_HW1: #if (saw_space_1 == true && saw_char == true)
cmp $1, %r8
jne telse_HW1
cmp $1, %r10
jne telse_HW1
mov $1, %r9
jmp pplusplus_HW1


fourth_if_HW1: #if (*p != 9 && *p != 32) {
cmp $9, %bl
je ifif_HW1
cmp $32, %bl
je ifif_HW1
cmp $1, %r8
jne ifif_HW1
mov $1, %r10
jmp ifif_HW1

ifif_HW1:
cmp $61, %bl
jne iterator_HW1
cmp $1, %r8
jne continental_HW1
cmp $1, %r9
jne continental_HW1
cmp $1, %r10
jne continental_HW1
jmp case_3_HW1


continental_HW1: #saw_space_1 = saw_char = false;
mov $0, %r8
mov $0, %r10
inc %rsi
movb (%rsi), %bl #p++
mov %rsi, %rdi #rdl = *p_temp
movb (%rdi), %r13b
Loop33_HW1:
cmp $0, %r13
je the_if_HW1 #if (after_equal_is_valid) return true;
cmp $9, %r13
je true_r13_HW1
cmp $32, %r13
je true_r13_HW1
else_r13_HW1: #} else {
mov $1, %r10
inc_temp_HW1:#p_temp++
inc %rdi
movb (%rdi), %r13b
jmp Loop33_HW1


true_r13_HW1:
cmp $1, %r10
je assign_after_equal_HW1
jmp inc_temp_HW1

assign_after_equal_HW1:
mov $0, %r12
jmp the_if_HW1


the_if_HW1:
cmp $1, %r12
je finito_true_HW1
mov $1, %r12
jmp iterator_HW1


iterator_HW1:
inc %rsi
movb (%rsi), %bl
jmp Loop22_HW1 #having doubts about line 190

return_false_case2_end_of_while_HW1:
jmp case_3_HW1

case_3_HW1:

xor %rax, %rax 
xor %rbx, %rbx 
xor %rcx, %rcx 
xor %rdx, %rdx 
xor %rsi, %rsi 
xor %rdi, %rdi 
xor %r8, %r8   
xor %r9, %r9   
xor %r10, %r10   
xor %r11, %r11   
xor %r12, %r12   
xor %r13, %r13 
xor %r14, %r14
xor %r15, %r15

lea command(%rip), %rax
mov %rax, %rcx
movb (%rax), %bl
movb (%rcx), %dl
cmp $0, %bl
je case_4_HW1
Loop44_HW1:
cmp $40, %dl
je Loop55_HW1
cmp $0, %dl
je Loop55_HW1
inc %rcx
movb (%rcx), %dl
jmp Loop44_HW1


Loop55_HW1:
cmp $32, %dl
je true_inc_HW1
cmp $9, %dl
je true_inc_HW1
jmp false_inc_HW1


true_inc_HW1:
inc %rcx
movb (%rcx), %dl
jmp Loop55_HW1


false_inc_HW1:  #if (*p_3 == 40) {
cmp $40, %dl
jne case_4_HW1
inc %rcx
movb (%rcx), %dl
Loop66_HW1:
cmp $0, %dl
je contin66_HW1
inc %rcx
movb (%rcx), %dl
jmp Loop66_HW1


contin66_HW1:
dec %rcx
movb (%rcx), %dl
cmp $41, %dl
je finito_true_HW1
jmp case_4_HW1

case_4_HW1:
xor %rax, %rax 
xor %rbx, %rbx 
xor %rcx, %rcx 
xor %rdx, %rdx 
xor %rsi, %rsi 
xor %rdi, %rdi 
xor %r8, %r8   
xor %r9, %r9   
xor %r10, %r10   
xor %r11, %r11   
xor %r12, %r12   
xor %r13, %r13 
xor %r14, %r14
xor %r15, %r15

lea command(%rip), %rax
movb (%rax), %bl
Loop77_HW1:
cmp $0, %bl
je finito_true_HW1
cmp $9, %bl
je finito_false_HW1
cmp $32, %bl
je finito_false_HW1
inc %rax
movb (%rax), %bl
jmp Loop77_HW1


finito_false_HW1:
movb $0, (result)
jmp finito


finito_true_HW1:
movb $1, (result)
jmp finito

finito:
