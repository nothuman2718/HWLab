.data
buffer: .space 128
message: .asciiz "Enter a string: "

.text
.globl main
main:
    # Print the message
    li $v0, 4
    la $a0, message
    syscall

    # Read the string
    li $v0, 8
    la $a0, buffer
    li $a1, 128
    syscall

    # Process each character
    la $t0, buffer
process:
    lb $t1, 0($t0)  # Load the character
    beqz $t1, end   # If it's null, we're done
    li $t2, 'a'
    li $t3, 'z'
    li $t4, 'A'
    li $t5, 'Z'
    blt $t1, $t2, not_lower
    bgt $t1, $t3, not_lower
    sub $t1, $t1, 32  # Convert to upper case
    j store
not_lower:
    blt $t1, $t4, not_upper
    bgt $t1, $t5, not_upper
    add $t1, $t1, 32  # Convert to lower case
    j store
not_upper:
store:
    sb $t1, 0($t0)  # Store the character back
    addiu $t0, $t0, 1  # Move to the next character
    j process

end:
    # Print the result
    li $v0, 4
    la $a0, buffer
    syscall

    # Exit
    li $v0, 10
    syscall