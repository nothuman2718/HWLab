.data
buffer: .space 33
message: .asciiz "Enter a 32-bit binary number: "

.text
.globl main
main:
    # Print the message
    li $v0, 4
    la $a0, message
    syscall

    # Read the binary string
    li $v0, 8
    la $a0, buffer
    li $a1, 33
    syscall

    # Initialize the result to 0
    move $t0, $zero

    # Initialize the string pointer
    la $t1, buffer

convert:
    # Load the current character
    lbu $t2, 0($t1)

    # Check if we reached the end of the string
    beqz $t2, print_result

    # Subtract '0' to get the binary digit
    sub $t2, $t2, '0'

    # Shift the result to the left
    sll $t0, $t0, 1

    # Add the binary digit to the result
    add $t0, $t0, $t2

    # Move to the next character
    addiu $t1, $t1, 1

    # Repeat the conversion process
    j convert

print_result:
    # Print the result
    li $v0, 1
    move $a0, $t0
    syscall

    # Exit
    li $v0, 10
    syscall