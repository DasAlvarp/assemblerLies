#54 is print string and accept input in MIPS
#2.37
.data
	inputPrompt:	.asciiz"\n the thing\n"
	theString:	.space 32
.text
main:
add	$v0, $zero, 54
la	$a1, theString
la	$a0, inputPrompt
addi	$a2, $zero, 32
syscall
la	$a0, theString
la	$t2, 0



#initialize variables
addi	$s0, $zero, 0 	#  string to binary thingy with the final number
addi	$t0, $zero, 0	#  Going to hold value to add to s0 after calculations.
addi	$s1, $zero, 1	# going to be in charge of multiplying by powers of 10, using sneaky maths. 
addi	$s2, $zero, 0	# giong to be the 2 in 8 + 2 = 10
addi	$s3, $zero, 0 	# is the number negative?

#get input

lb	$t1, 0($a0)
beq	$t1, 45, neggy
neggy: 
	addi	$s3, $zero, 1
	addi	$a0, $a0, 1
	j stepTwo

stepTwo:
	lb	$t1, 0($a0) 	# load the next character into t1
	beqz	$t1, end 	# check for the null character
	beq	$t1, 10, end	# if it's equal to 10, or new line.
	bgt 	$t1, 57, error	# is it ascii?
	blt	$t1, 48, error
	addi	$t1, $t1, -48
	sll 	$s1, $s0, 3
	sll 	$s0, $s0, 1
	add	$s0, $s1, $s0	#total * 10
	add	$s0, $s0, $t1 #total += latest digit
	addi	$a0, $a0, 1 	# increment the string pointer

j stepTwo # return to the top of the loop
negative:
	sub	$a0, $zero, $s0
	li	$v0, 1
	syscall
	j exit
end:
	beq	$s3, 1, negative
	add	$a0, $s0, 0
	li	$v0, 1
	syscall
	j exit

error:
	li	$v0, -1
exit:

#to multiply by 10, take original register, SLL 3 + SLL 1, or 8 + 2 = 10. I feel so smart right now
