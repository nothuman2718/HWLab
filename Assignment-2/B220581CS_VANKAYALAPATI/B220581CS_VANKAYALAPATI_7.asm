.data
message1: .asciiz "Enter the lower bound: "
message2: .asciiz "Enter the upper bound: "
newline: .asciiz "\n"

.text
.globl main
main:
    # Print the first message
    li $v0, 4
    la $a0, message1
    syscall

    # Read the lower bound
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 is the lower bound

    # Print the second message
    li $v0, 4
    la $a0, message2
    syscall

    # Read the upper bound
    li $v0, 5
    syscall
    move $t1, $v0  # $t1 is the upper bound

check_number:
    # If the number is greater than the upper bound, exit
    bgt $t0, $t1, exit

    # Check if the number is prime
    li $t2, 2  # $t2 is the divisor
    move $t3, $t0  # $t3 is the number to check
    j check_divisor

check_divisor:
    # If the divisor is equal to the number, print the number
    beq $t2, $t3, print_number

    # If the number is divisible by the divisor, go to the next number
    rem $t4, $t3, $t2  # $t4 is the remainder
    beqz $t4, next_number

    # Go to the next divisor
    addiu $t2, $t2, 1
    j check_divisor

print_number:
    # Print the number
    li $v0, 1
    move $a0, $t3
    syscall

    # Print a newline
    li $v0, 4
    la $a0, newline
    syscall

next_number:
    # Go to the next number
    addiu $t0, $t0, 1
    j check_number

exit:
    # Exit
    li $v0, 10
    syscall