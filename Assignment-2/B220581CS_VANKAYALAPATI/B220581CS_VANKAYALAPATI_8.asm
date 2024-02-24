.data
string1: .asciiz "Enter length of array: \n" 
string2: .asciiz "Found\n"
string3: .asciiz "Not Found\n"
string4: .asciiz "Enter numbers: \n"          
string5: .asciiz "Enter the target: \n"      
array  : .space 200

.text
main:
    # Prompt to enter length of array
    li $v0, 4
    la $a0, string1
    syscall
    
    # Take length of array input
    li $v0, 5
    syscall
    
    # Store the length of array
    move $s0, $v0
    
    # Show prompt to enter numbers
    li $v0, 4
    la $a0, string4
    syscall

    # Load the starting address of array into $s1
    la $s1, array
    
    # Loop for taking numbers input
    li $t0, 0 # Initialize a counter
input_loop:
    beq $t0, $s0, iterator_end # Exit loop when counter reaches array length
    
    # Read the number
    li $v0, 5
    syscall
    
    # Store the number at the current position in array
    sw $v0, ($s1)
    addi $s1, $s1, 4 # Move to the next position in array
    
    addi $t0, $t0, 1 # Increment the counter
    j input_loop     # Repeat the loop

iterator_end:
    # Enter prompt for taking target
    li $v0, 4
    la $a0, string5
    syscall
    
    # Take target number into input
    li $v0, 5
    syscall
    
    # Store the input
    move $s3, $v0
    
    # Initialize a variable to 0
    li $t0, 0
    
check_num_loop:
    beq $t0, $s0, notfound # Exit loop if end of array is reached
    
    lw $t1, ($s1)   # Load a number from array
    beq $t1, $s3, found # Check if it matches the target
    
    addi $s1, $s1, -4 # Move to the next element in array
    addi $t0, $t0, 1 # Increment loop counter
    j check_num_loop # Repeat the loop

found:
    # Print "Found"
    li $v0, 4
    la $a0, string2
    syscall
    j exit

notfound:
    # Print "Not Found"
    li $v0, 4
    la $a0, string3
    syscall
    j exit

exit:
    # Exit program
    li $v0, 10
    syscall
