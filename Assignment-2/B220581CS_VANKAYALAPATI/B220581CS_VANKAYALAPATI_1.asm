.data
string: .asciiz "Enter a number\n"
string3: .asciiz "Entered number is odd\n"
string2: .asciiz "Entered number is even\n"
.text
main:
la $a0,string
li $v0,4
syscall
li $v0,5
syscall
move $s0,$v0
li $s1,2
div $s0,$s1
mfhi $s2
li $v0,4
beq $s2,1,odd
la $a0,string2
syscall
j exit


odd:
la $a0,string3
syscall

exit:
li $v0,10
syscall



