#trying to make fibonacci sequence
__start: 
	addi  	$s1, $zero, 0	#first fib number
	addi	$s2, $zero, 1	#second fib number to 1
	add	$s3, $zero, 8	#number of fibonaccis to be done. Probably not the technical term.
	
addLoop:add 	$s3, $s3, -1	#the fibbin' loop
	add 	$t0, $s1, $s2	#2 fib numbers being added to the next one.
	add 	$s1, $s2, $zero	#first fib number being set to 2nd fib number
	add 	$s2, $t0, $zero	#2nd fib number being set to the next fib number
	bgt	$s3, 0, addLoop	#if s3 (current max) >= 0 then loop, else, it's OVER
	syscall			#failing to output 