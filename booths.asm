.data
	multiplicandPrompt:	.asciiz"\n Multiplicand\n"
	multiplicand:		.space 12
	multiplierPrompt:	.asciiz"\n Multiplier\n"
	multiplier:		.space 12
.text
main:


#s4 = multiplicand
#s5 = multiplier
#conversion done by copying and pasting old mips project for both variables. Very technical :P
#loading multiplicand
add	$v0, $zero, 54
la	$a1, multiplicand
la	$a0, multiplicandPrompt
addi	$a2, $zero, 32
syscall
la	$a0, multiplicand
la	$t2, 0

#initialize variables
addi	$s0, $zero, 0 	#  string to binary thingy with the final number
addi	$t0, $zero, 0	#  Going to hold value to add to s0 after calculations.
addi	$s1, $zero, 1	# going to be in charge of multiplying by powers of 10, using sneaky maths. 
addi	$s2, $zero, 0	# giong to be the 2 in 8 + 2 = 10
addi	$s3, $zero, 0 	# is the number negative?

#get input

lb	$t1, 0($a0)
bne	$t1, 45, stepTwo
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
	sub	$s4, $zero, $s0
	j exit1
end:
	beq	$s3, 1, negative
	add	$s4, $s0, 0
	j exit1
exit1:


add	$v0, $zero, 54
la	$a1, multiplier
la	$a0, multiplierPrompt
addi	$a2, $zero, 32
syscall
la	$a0, multiplier
la	$t2, 0
#multiplicand
#initialize variables
addi	$s0, $zero, 0 	#  string to binary thingy with the final number
addi	$t0, $zero, 0	#  Going to hold value to add to s0 after calculations.
addi	$s1, $zero, 1	# going to be in charge of multiplying by powers of 10, using sneaky maths. 
addi	$s2, $zero, 0	# giong to be the 2 in 8 + 2 = 10
addi	$s3, $zero, 0 	# is the number negative?

#get input

lb	$t1, 0($a0)
bne	$t1, 45, stepTwo2
neggy2: 
	addi	$s3, $zero, 1
	addi	$a0, $a0, 1
	j stepTwo2

stepTwo2:
	lb	$t1, 0($a0) 	# load the next character into t1
	beqz	$t1, end2 	# check for the null character
	beq	$t1, 10, end2	# if it's equal to 10, or new line.
	bgt 	$t1, 57, error	# is it ascii?
	blt	$t1, 48, error
	addi	$t1, $t1, -48
	sll 	$s1, $s0, 3
	sll 	$s0, $s0, 1
	add	$s0, $s1, $s0	#total * 10
	add	$s0, $s0, $t1 #total += latest digit
	addi	$a0, $a0, 1 	# increment the string pointer

j stepTwo2 # return to the top of the loop
negative2:
	sub	$s5, $zero, $s0
	j exit
end2:
	beq	$s3, 1, negative2
	add	$s5, $s0, 0
	j exit
exit:
	#intitialization for ProperMUltiplyMain
	add	$s0, $zero, 0	#product register half 1
	add	$s1, $s5, 0	#product register half 2
	add 	$t0, $zero, 0	#a massive waste of space! It's the previous bit

properMultilplyMain:
	#output the '64 bit' variable. Kind of 64 bits. Not really. At all.
	li 	$v0, 35
	add 	$a0, $s0, $zero
	syscall
	add 	$a0, $s1, $zero
	syscall
	








error:
	li	$v0, -1