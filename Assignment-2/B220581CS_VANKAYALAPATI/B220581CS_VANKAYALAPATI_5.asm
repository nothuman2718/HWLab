.data
message: .asciiz "Enter a number: "
yes: .asciiz "YES"
no: .asciiz "NO"

.text
.globl main
main:
    # Print the message
    li $v0, 4
    la $a0, message
    syscall

    # Read the number
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 is the number

    # Initialize the sum to 0
    move $t1, $zero  # $t1 is the sum

    # Initialize the divisor to 1
    li $t2, 1  # $t2 is the divisor

check_divisor:
    # If divisor is equal to the number, go to print_result
    beq $t2, $t0, print_result

    # If divisor is a proper divisor, add it to the sum
    rem $t3, $t0, $t2  # $t3 is the remainder
    beqz $t3, add_divisor

    # Go to the next divisor
    addiu $t2, $t2, 1
    j check_divisor

add_divisor:
    add $t1, $t1, $t2
    addiu $t2, $t2, 1
    j check_divisor

print_result:
    # If the sum is equal to the number, print "YES"
    beq $t1, $t0, print_yes

    # Otherwise, print "NO"
    li $v0, 4
    la $a0, no
    syscall
    j exit

print_yes:
    li $v0, 4
    la $a0, yes
    syscall

exit:
    # Exit
    li $v0, 10
    syscall