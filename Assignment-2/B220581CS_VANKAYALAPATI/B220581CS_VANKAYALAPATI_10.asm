.data
message: .asciiz "Enter a number: "

.text
.globl main
main:
    # Print the message
    li $v0, 4
    la $a0, message
    syscall

    # Read the number A
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 is the number A

    # Calculate the 2's complement of A
    not $t1, $t0  # $t1 is the bitwise NOT of A
    addiu $t1, $t1, 1  # $t1 is the 2's complement of A

    # Perform the addition operation
    add $t2, $t0, $t1  # $t2 is the result

    # Print the result
    li $v0, 1
    move $a0, $t2
    syscall

    # Exit
    li $v0, 10
    syscall