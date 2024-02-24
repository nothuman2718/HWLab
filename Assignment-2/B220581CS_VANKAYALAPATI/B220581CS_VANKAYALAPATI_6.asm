.data
message: .asciiz "Enter a number: "
yes: .asciiz "YES"
no: .asciiz "NO"

.text
main:
    # Print the message
    li $v0, 4
    la $a0, message
    syscall

    # Read the number
    li $v0, 5
    syscall
    move $t0, $v0  # Store the number in $t0

    # Initialize the sum to 0
    li $t1, 0

    # Process each digit
process:
    beqz $t0, end  # If the number is 0, we're done
    li $t2, 10
    div $t0, $t2  # Divide the number by 10
    mfhi $t3  # Get the remainder (the last digit)
    mflo $t0  # Get the quotient (the number without the last digit)

    # Cube the digit and add it to the sum
    move $t4,$t3
    mul $t3, $t3, $t3
    mul $t3, $t3, $t4
    add $t1, $t1, $t3

    j process

end:
    # Compare the sum to the original number
    move $t0, $v0
    beq $t0, $t1, armstrong
    j not_armstrong

armstrong:
    # Print "YES"
    li $v0, 4
    la $a0, yes
    syscall
    j exit

not_armstrong:
    # Print "NO"
    li $v0, 4
    la $a0, no
    syscall

exit:
    # Exit
    li $v0, 10
    syscall