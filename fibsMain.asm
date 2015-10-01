#trying to make fibonacci sequence
__start:
	addi  	$s1, $s1, 0	#first fib number
	addi	$s2, $s2, 0	#second fib number
	addi	$s3, $s3, 0	#number of fibonaccis to be done. Probably not the technical term.
	add	$s3, $s3, 8
	add	$s2, $s2, 1	#set one fib number to 1
	
addLoop:add 	$s2, $s2, -1	#the fibbin' loop
	add 	$t0, $s1, $s2	
	add 	$s1, $s2, $zero
	add 	$s2, $t0, $zero
	bge	$s2, $zero, addLoop
	addi  	$v0, $s2, 0
	syscall