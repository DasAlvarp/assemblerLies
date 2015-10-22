#54 is print string and accept input in MIPS
#2.37
.data
	inputPrompt:	.asciiz "Please enter an integer:\n"
	theString:	.space 31
.text
main:
#initialize variables
addi	$s0, $zero, 0 	#string to binary thingy with the final number
addi	$t0, $zero, 0	#Going to hold value to add to s0 after calculations.
addi	$s1, $zero, 1	#going to be in charge of multiplying by powers of 10, using sneaky maths. 
addi	$s2, $zero, 0	#giong to be the 2 in 8 + 2 = 10
addi	$a2, $zero, 32

#get input

li	$v0, 8		#input
la	$a0, theString
la	$a1, 32	#load space into address
syscall


stepTwo:
	lb	$t1, 0($a0) 	# load the next character into t1
	beqz	$t1, end 	# check for the null character
	bge 	$t1, 58, error	# is it ascii?
	ble	$t1, 47, error
	addi	$t1, $t1, -48
	addi	$t2, $zero, 0	#x = 0
	multiply:	#for multiplication. While x < t1 (its proper value) a+= 10, or 100 or whatever, x++
		bge	$t2, $t1, unmultiply
		add	$s0, $s0, $s1	#s0 
		addi	$t2, $t2, 1	#x++
		j multiply
	unmultiply:
	
	addi	$a0, $a0, 1 	# increment the string pointer
	
	sll	$s2, $s1, 1	#multiply s1 by 10
	sll	$s1, $s1, 3
	add	$s1, $s1, $s2
j stepTwo # return to the top of the loop
end:
	addi	$a0, $s0, 0
	li	$v0, 1
	syscall
exit:
error:
	li	$v0, -1

#to multiply by 10, take original register, SLL 3 + SLL 1, or 8 + 2 = 10. I feel so smart right now