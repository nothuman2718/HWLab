.data
message: .asciiz "Enter a number: "

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

    # Initialize the first two Fibonacci numbers
    li $t1, 0  # $t1 is fib(0)
    li $t2, 1  # $t2 is fib(1)

    # If the number is 0, print fib(0)
    beqz $t0, print_result

    # If the number is 1, print fib(1)
    li $t3, 1  # $t3 is the counter
    beq $t0, $t3, print_result

calculate_fibonacci:
    # If the counter is equal to the number, print the result
    beq $t0, $t3, print_result

    # Calculate the next Fibonacci number
    add $t4, $t1, $t2  # $t4 is fib(n)
    move $t1, $t2
    move $t2, $t4

    # Increment the counter
    addiu $t3, $t3, 1

    # Repeat the calculation process
    j calculate_fibonacci

print_result:
    # Print the result
    li $v0, 1
    move $a0, $t2
    syscall

    # Exit
    li $v0, 10
    syscall