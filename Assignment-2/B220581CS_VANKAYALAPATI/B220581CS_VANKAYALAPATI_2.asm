
## This program work for the numbers in the range from 0 to 12 only
.data
string: .asciiz "Enter a number "
string1: .asciiz "Factorial of given number=\n"
string2: .asciiz "! = "

.text
main:
la $a0,string
li $v0,4
syscall

li $v0,5
syscall
move $t0,$v0

move $a0,$v0
li $v0,1
syscall

la $a0,string2
li $v0,4
syscall

beq $t0,0,zero
beq $t0,1,zero
move $s0,$t0
move $s1,$s0

compute:
addi $s1,$s1,-1
mul $s0,$s1,$s0
bne $s1,1,compute

li $v0,1
move $a0,$s0
syscall
j exit

zero:
li $a0,1
li $v0,1
syscall
j exit

exit:
li $v0,10
syscall





