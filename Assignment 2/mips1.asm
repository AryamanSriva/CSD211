.data
input_prompt1:  .asciiz "Enter the first integer: "
input_prompt2:  .asciiz "Enter the second integer: "
output_add:     .asciiz "Sum of two numbers is: "
output_mul:     .asciiz "Product of two numbers is: "
output_sub:     .asciiz "Difference of two numbers is: "

.text
.globl main

# Main function
main:
    # Prompt the user to enter the first integer
    li $v0, 4
    la $a0, input_prompt1
    syscall

    # Read the first integer from the user
    li $v0, 5
    syscall
    move $t0, $v0  # Store the first integer in $t0

    # Prompt the user to enter the second integer
    li $v0, 4
    la $a0, input_prompt2
    syscall

    # Read the second integer from the user
    li $v0, 5
    syscall
    move $t1, $v0  # Store the second integer in $t1

    # Call the function to compute the sum
    jal funcADD
    move $t2, $v0  # Store the result in $t2

    # Display the sum
    li $v0, 4
    la $a0, output_add
    syscall
    move $a0, $t2
    li $v0, 1
    syscall
    li $v0, 11
    li $a0, 10
    syscall

    # Call the function to compute the product
    jal funcMUL
    move $t2, $v0  # Store the result in $t2

    # Display the product
    li $v0, 4
    la $a0, output_mul
    syscall
    move $a0, $t2
    li $v0, 1
    syscall
    li $v0, 11
    li $a0, 10
    syscall

    # Call the function to compute the difference
    jal funcSUB
    move $t2, $v0  # Store the result in $t2

    # Display the difference
    li $v0, 4
    la $a0, output_sub
    syscall
    move $a0, $t2
    li $v0, 1
    syscall

    # Exit the program
    li $v0, 10
    syscall

# Function to compute the sum
funcADD:
    add $v0, $t0, $t1
    jr $ra

# Function to compute the product
funcMUL:
    mul $v0, $t0, $t1
    jr $ra

# Function to compute the difference
funcSUB:
    sub $v0, $t0, $t1
    jr $ra
