.data
	multiplicandPrompt:	.asciiz"\n Multiplicand\n"
	multiplicand:	.space 32
	multiplierPrompt:	.asciiz"\n Multiplier\n"
	multiplier:	.space 32
.text
main:
add	$v0, $zero, 54
la	$a1, multiplicand
la	$a0, multiplicandPrompt
addi	$a2, $zero, 32
syscall
la	$a0, multiplicand
la	$t2, 0