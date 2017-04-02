# subTwo.s - subtracts one number from the register

.section .data
# there are no var

.section .text
.globl _start
_start:
	movl 	$1, %eax 	# system call to exit
	movl	$10, %ebx	# move 10 to the ebx register
	subl	$4, %ebx	# remove 4 from ebx register
	int 	$0x80		# execute the exit
# use in the terminal the command echo $? to see the result
