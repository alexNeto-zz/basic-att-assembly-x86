# addTwo.s - sum 2 pre def numbers

.section .data
# there are no var
.section .text
.globl _start
_start:
	movl $1, %eax	# system call to exit the program
	movl $2, %ebx	# put decimal value 2 in ebx register
	addl $4, %ebx	# sum more 4 in the ebx register
	int $0x80		# run the exit command
# use echo $? in the terminal to see the result
