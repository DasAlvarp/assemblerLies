#trying to make fibonacci sequence
__start:
	addi  	$s1, $s1, 0	#first fib number
	addi	$s2, $s2, 0	#second fib number
	add	$s3, $s3, 8	#number of fibonaccis to be done. Probably not the technical term.
	add	$s2, $s2, 1	#set one fib number to 1
	
addLoop:add 	$s3, $s3, -1	#the fibbin' loop
	add 	$t0, $s1, $s2	#2 fib numbers being added to the next one.
	add 	$s1, $s2, $zero	#first fib number being set to 2nd fib number
	add 	$s2, $t0, $zero	#2nd fib number being set to the next fib number
	bge	$s3, 0, addLoop	#if s3 (current max) >= 0 then loop, else, it's OVER
	syscall			#failing to output 