.global _start

.section .text

_start:

xor %rax,%rax

xor %rbx,%rbx

xor %rcx,%rcx

xor %rdx,%rdx

xor %r8,%r8

xor %r11,%r11

xor %r13,%r13

xor %r12,%r12

xor %r14, %r14

lea Adrress, %rax
mov (%rax), %rax
cmp $0, %rax
je finito_HW1

movb (Type),%bl

movl (Length),%edx

leaq LittleEndianResult, %r8
mov (%r8), %r8
cmp $0, %r8
je finito_HW1

cmpq $0, %rbx # we can do so, because rbx was zeroed and ebx now contains type

 

je finito_HW1 # rbx represents unsigned value, thus  only 0 is invalid value

cmpq $0, %rdx # we can do so, because rdx was zeroed and edx now contains length

je finito_HW1 #%rdx represents unsigned value, thus only 0 is invalid value

movq $0, %rcx # rcx := i = 0

first_loop_HW1:

    # for i = 0 to length..

    cmpq %rdx, %rcx # if (kength <= i) end

    jae finito_HW1 # return

    #define first and last

    #first should be calculated as follows : first = Adrress + i* Type 
    movq %rbx, %r10 #r10 = type

    imulq %rcx,%r10 #r10 = i*type
     movq %r10, %r11 #r11 = i*type = first
    
    

    # the order of calc and movs here is important! don't change unless you're absolutely sure you know what you do!

    movq %r11, %r13 # r13 is last , we start with last = i*type(saves some time of multiplication)

    decq %r13 # last = i*type -1

    addq %rbx, %r13 #last = (i+1)*type -1

    addq %r8, %r13 #finaly, last should be calced as follows  : last = LittleEndianResult+(i+1)*Type -1

    addq %rax, %r11 # first = Adrress +i *type

    movq $0, %r14 # j = 0

    second_loop_HW1:


        #from j=0 to Type
	xor %r12, %r12

        movb (%r11),%r12b #% %r12b = byte at (Adrress[i])[j] (think of Adrress[i] as a char of length = (val of Type))

        movb %r12b, (%r13) #this is the swap


        incq %r11 # go to next "char" in current word

        decq %r13 # go one word "back" to copy right.

        incq %r14 #j++

        cmpq %rbx,%r14 # if(unsigned Type > unsigned J)

        jb second_loop_HW1

        #jb(=type>j) second_loop_HW1

    incq %rcx # i++
#movq $60, %rax
#  movq $0, %rdi
# syscall

    jmp first_loop_HW1

finito_HW1:
xor %rax, %rax
