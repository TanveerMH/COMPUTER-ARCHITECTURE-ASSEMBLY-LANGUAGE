# Name: Hasan Tanveer Mahmood
# Matric no: 1725413
# CSC 3402, Sec: 2
.data
 	
 	WelcomeMsg: .asciiz "Welcome to Lab 1 exercise. Please Enter Your Name: "       
  	HelloMsg:  .asciiz  "Hi, "
        name:  .space 10
        EncryptMsg: .asciiz "your encrypted user name is : "
 
.text
	main:
	
	# Print out a message string with a welcome message.
        li $v0,4
        la $a0, WelcomeMsg
        syscall
 
 	# Get an input from user to enter his/her name
 	la $a0,name
	la $a1,10  		
 	li $v0,8
 	syscall
 	la $t0,($a0) # stored name in the  register t0
 	li $t1,0     # string length
 	
        