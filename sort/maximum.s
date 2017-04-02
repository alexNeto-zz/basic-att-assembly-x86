# form Programming Ground Up 1.0 book

#variables: the registers have the following uses:
#	%edi - Holds the index of the data item being examined
#	%ebx - Largest data item found
#	%eax - Current data item

# The following memory locations are used:
# data_items - conteins the item data.
# A 0 is used to terminate the data

.section .data
data_items:
	.long 3, 67, 34, 222, 45, 75, 54, 34, 44, 22, 11, 66, 0

.section .text
.globl _start
_start:
	movl	$0, %edi		# move 0 into the index register
	movl	data_items(, %edi, 4), %eax # load the first byte of data
	movl	%eax, %ebx		# since this is the first item, %eax is
							# the biggest
start_loop:
	cmpl	$0, %eax		# check to see if we'ev hit the end
	je		loop_exit
	incl	%edi			# load nex value
	movl	data_items(, %edi, 4), %eax
	cmpl	%ebx, %eax		# compare values
	jle start_loop			# jump to loop biggining if the new
							# one isn't bigger
	movl	%eax, %ebx		# move the values as largest
	jmp start_loop			# jump to loop beginning
loop_exit:
	# %ebx is the status code for the exit system call
	# and it already has the maximum number
	movl	$1, %eax		# 1 is the exit() syscall
	int		$0x80

# use echo $? in the terminal to see the result
