.data
string1: .asciiz "Enter a number = "
string2: .asciiz "YES\n"
string3: .asciiz "NO\n"

.text
main:
la $a0,string1
li $v0,4
syscall

li $v0,5
syscall

move $s0,$v0
move $s1,$v0
li $s3,10
li $s2,0


compute:
mul $s2,$s2,10
div $s1,$s3
div $s1,$s1,10
mfhi $t2
add $s2,$s2,$t2
bne $s1,0,compute

beq $s2,$s0,yes
j no

yes:
la $a0,string2
li $v0,4
syscall
j exit

no:
la $a0,string3
li $v0,4
syscall
j exit

exit:
li $v0,10
syscall
