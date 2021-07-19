#			  GROUP MEMBERS
#-------------------------------+-----------------------+
# 	   Name: 		|	Matric No:	|
#-------------------------------+-----------------------+
# Hasan Tanveer Mahmood 	|	1725413		|
# Islam Md Raisul 		|	1725501		|
# Queen Fatema Mehrin		|	1726578		|
# Murtaj Sheikh Mohammad Tahsin |	1817537		|
#-------------------------------+-----------------------+

#-------------------------------+-----------------------+---------------+
# Title: Smart Home System	| Course: CSC - 3402	|   Sec: 02	|
#-------------------------------+-----------------------+---------------+

# 			Short Description
#--------------------------------------------------------------------------------------------------
# This program is about Smart Home System. By using user name and Password they can access the home.
# Moreover, They can also control their appliances such as light,Fan, Aircon by using this program.
# Additionally, user can also get alert for opening or closing the windows or the Door.
# To Sum up, This program will help the user to make their home smart and secured.

.data
	layout1:		.asciiz "\t|---------------------------------------------------------|"
	helloMsg:		.asciiz "\n\t+\t\tWelcome to Smart Home System.\t\t  +\n"
	info:			.asciiz "\n\t\tPlease Provide Your Details.\n"
	userNMsg:		.asciiz "\t\tEnter your username: "
	passMsg:		.asciiz "\t\tEnter your password: "
	wrongMsg:		.asciiz "\n\t\tWrong User Name or Password. Re-enter please!!!\n\n"
	menu:			.asciiz "\n\t\tChoose an option:\n\t\t 1: Door Status\n\t\t 2: Window Status\n\t\t 3: Light\n\t\t 4: Fan\n\t\t 5: Air-Con\n\t\t 6: Exit\n\n\t\tOption is: "
	wrongOpt:		.asciiz "\t\tInvalid option. Choose valid one!!!\n"
	
	# Door
	doormsg:		.asciiz "\n\t\tType Open/Close to Open/Close the door: "
	doorisOpen:		.asciiz "Open"
	doorisClose:		.asciiz "Close"
	doorOpenmsg:		.asciiz "\n\t\tThe door is open !!"
	doorWarn:		.asciiz  " kindly close the door\n"
	doorClosemsg:		.asciiz "\t\tThe door is closed\n"
	
	# Window
	windowmsg:		.asciiz "\n\t\tType Open/Close to Open/Close the window: "
	windowisOpen:		.asciiz "Open"
	windowisClose:		.asciiz "Close"
	windowOpenmsg:		.asciiz "\n\t\tThe window is open!!"
	windowWarn:		.asciiz " kindly close the window"
	windowClosemsg:		.asciiz "\t\tThe window is closed"
	
	# Light
	lightMsg:               .asciiz "\n\t\tType On/Off to switch Light to On/Off: "
	lightOn:                .asciiz "On"
	lightOff:               .asciiz "Off"
	QnaLight:               .asciiz "\n\t\tSwitch off the light:"
	AQnaLight1:             .asciiz "Off"
	MsgLightOn:             .asciiz "\t\tThe light is switched on.\n"
	MsgLightOff:            .asciiz "\t\tThe light is switched off.\n"
	
	#Fan
	FanMsg:                 .asciiz "\n\t\tType On/Off to switch Fan to On/Off: "
	FanOn:                  .asciiz "On"
	FanOff:                 .asciiz "Off"
	QnaFan1:                .asciiz "\n\t\tSwitch off the Fan:"
	QnaFan2:                .asciiz "\n\t\tSwitch on the Fan:"
	AQnaFan1:               .asciiz "On"
	AQnaFan2:               .asciiz "Off" 
	MsgFanOn:               .asciiz "\t\tThe Fan is switched on.\n"
	MsgFanOff:              .asciiz "\t\tThe Fan is switched off.\n" 
	
	# AirCon
	airConMsg: 		.asciiz "\n\t\tType On/Off to switch Air-con to On/Off: "
	isOn:			.asciiz "on"
	isOff:			.asciiz "off"
	airOnMsg:		.asciiz "\t\tAir condition is ON !"
	airOffMsg:		.asciiz "\t\tAir condition is OFF!"
	wrngInput:		.asciiz "\t\tInvalid Input!!"
	tempMsg:		.asciiz "\n\t\tEnter temperature: "
	tempIsNow:		.asciiz "\t\tThe Temperature is set\n"
	tempLowMsg:		.asciiz "\t\tInvalid Temperature.\n\t\tTemperature can not be less than 16\n"
	tempOverMsg:		.asciiz "\t\tInvalid Temperature.\n\t\tTemperature can not be higher than 24\n"
		
	# User Name
	user1:			.asciiz "Tanveer"
	user2:			.asciiz "Queen"
	user3:			.asciiz "Raisul"
	user4:			.asciiz "Tahsin"
	
	# Password
	password1:		.word	1234
	password2:		.word	2345
	password3:		.word	5432
	password4:		.word	4321	
	userName:		.space	10
	input: 			.space 10
	doorinput:		.space 10
	windowinput:		.space 10
	
.text
# display welcome message
	la	$a0, layout1			# This line is for loading the layout of welcoming in display
	jal	displayNotification		# jump and link to the display function.
	la	$a0, helloMsg			# Load Welcoming Message 
	jal	displayNotification		# Display Welcoming Message in console
	la	$a0, layout1			# Load 2nd Layout
	jal	displayNotification		# Display the 2nd Layout in console
	la	$a0, info			# Lode "Provide User info message
	jal	displayNotification		# Display User info message

# This is main function here user authentication will occured.
main:
# display username message
	la	$a0, userNMsg			# Load "Enter User Name: " Message
	jal	displayNotification		# Display the message.

# read username from user
	la	$a0, userName
	li	$a1, 11				# 10 charcaters can be read from user
	jal	readStrInput			# Jump and Link to Read String Input Function, Where it will check whether the input is String or not

# print password message
	la	$a0, passMsg			# Load "Enter Password: " Message
	jal	displayNotification		# Display the message

# read password from user
	jal	readIntInput			# Jump and Link to Read Integer Input Function, Where it will check whether the input is integer or not.
	move	$t0, $v0			# move password into t0

# This Function will check user name.
checkUser:
	la	$a0, user1			# Load 1st user name in a0 register, Which already set in line 81.
	la	$a1, userName			# Load User input in a1 register. 
	jal	stringCompare			# check username and user1 are equal or not in string compare function. if equal then thansfer value 0 to v0 register.
	beqz	$v0, checkPassword1		# if v0 == 0 goto checkPassword
	
	la	$a0, user2			# Load 2nd user name in a0 register, Which already set in line 82.
	la	$a1, userName			# Load User input in a1 register.
	jal	stringCompare			# check username and user2 are equal or not
	beqz	$v0, checkPassword2		# if v0 == 0 goto checkPassword
	
	la	$a0, user3			# Load 2nd user name in a0 register, Which already set in line 83.
	la	$a1, userName			# Load User input in a1 register.
	jal	stringCompare			# check username and user2 are equal or not
	beqz	$v0, checkPassword3		# if v0 == 0 goto checkPassword
	
	la	$a0, user4
	la	$a1, userName
	jal	stringCompare			# check username and user2 are equal or not
	beqz	$v0, checkPassword4		# if v0 == 0 goto checkPassword
	j	inValid				# else jump on inValid

# This function will Check password
checkPassword1:
	lw	$t1, password1			# load password into t1
	bne	$t0, $t1, inValid		# If register t0 is not equal to t1 the call invalid function.
	j DisplayMenu				# If equal then go to display menu function.
	
checkPassword2:
	lw	$t1, password2			# load password into t1
	bne	$t0, $t1, inValid		# If register t0 is not equal to t1 the call invalid function.
	j DisplayMenu				# If equal then go to display menu function.
	
checkPassword3:
	lw	$t1, password3			# load password into t1
	bne	$t0, $t1, inValid		# If register t0 is not equal to t1 the call invalid function.
	j DisplayMenu				# If equal then go to display menu function.
	
checkPassword4:
	lw	$t1, password4			# load password into t1
	bne	$t0, $t1, inValid		# If register t0 is not equal to t1 the call invalid function.
	j DisplayMenu				# If equal then go to display menu function.

# This Function will show the Display option, Where user can choose which application they want to use.
DisplayMenu:
	# display menu on console
	la	$a0, menu			# Load display menu in a0 register.
	jal	displayNotification		# Print the display menu.
	
	# read option from user
	jal	readIntInput
	move	$t0, $v0			# move choice into t0
	beq	$t0, 1, door			# if choice == 1 goto door status
	beq	$t0, 2, window			# else if choice == 2 goto window status
	beq	$t0, 3, light			# else if choice == 3 goto light status
	beq	$t0, 4, fan			# else if choice == 4 goto Fan status
	beq	$t0, 5, aircon			# else if choice == 5 goto Air-Con status
	beq	$t0, 6, exit			# else if choice == 6 goto exit and program will finish executing.
	la	$a0, wrongOpt			# else print wrong option message. And go back to main menu
	jal	displayNotification		
	j	DisplayMenu			# jump on DisplayMenu

# This function is for operating door.
door:
	la	$a0, doormsg			# Load door message. Which is set at line 33
	jal	displayNotification		# Print the message on console

	la	$a0, doorinput			# Take input from the user
	li	$a1, 11				# 10 charcaters can be read from user
	jal	readStrInput			# Check user input whether it is string or not.
	
	j dooroption				# Go to the sub function "Door Option"

# This is the sub function for operating the door.
dooroption:	
	la	$a0, doorisOpen			# Load door open message in a0 register.
	la	$a1, doorinput			# Load user input in a1 register.
	jal	stringCompare			# check command and user input are equal or not
	beqz	$v0, doorOpen			#if input and the conditions are same go to the another sub function, which is door open.

	
	la	$a0, doorisClose
	la	$a1, doorinput
	jal	stringCompare			# check username and user2 are equal or not
	beqz	$v0, doorClose			# if input and the conditions are the same go to the sub function.
	
	la	$a0, wrongOpt			# Load wrong output message in a0 register.
	jal	displayNotification		# Print Worng output message
	j 	door				# jump to door option

# Another sub function of Door Option. The purpose of this function is to open the door	
doorOpen:
	la	$a0,doorOpenmsg		# Show door open message upon selecting "Open"
	jal	displayNotification	# Print the door open message.
	j 	gotoOpenmsg		# Jump to the door opening message upon selecting "Open"

# This also the sub function for closing the door.
doorClose:
	la	$a0,doorClosemsg	# Show door close message upon selecting "Close"
	jal	displayNotification	
	j 	DisplayMenu

# This function is for warning sensor. If door is open the sensor will send message to the actuators
gotoOpenmsg:
	la	$a0, doorWarn		# Show warning message that door is open. please  Close the door.
	jal	displayNotification	# Print the message usingdisplay function notification.
	j	DisplayMenu		# Jump to the main menu
	
# This function is for operating the windows.
window:
	la	$a0, windowmsg
	jal	displayNotification

	la	$a0, windowinput
	li	$a1, 11				# 10 charcaters can be read from user
	jal	readStrInput
	
	j windowoption				# Go to the Window Option

windowoption:	
	la	$a0, windowisOpen
	la	$a1, windowinput
	jal	stringCompare			# check username and user2 are equal or not
	beqz	$v0, windowOpen			#if input and the conditions are same go to the sub function.
	
	la	$a0, windowisClose
	la	$a1, windowinput
	jal	stringCompare			# check username and user2 are equal or not
	beqz	$v0, windowClose		#if input and the conditions are the same go to the sub function.
	la	$a0, wrongOpt			# else print wrong option message
	jal	displayNotification
	j 	window		

windowOpen:
	la	$a0,windowOpenmsg	#Show window open message upon selecting "Open"
	jal	displayNotification	
	j 	gotoWindowOpenmsg	# Jump to the window opening message upon selecting "Open"
	
windowClose:
	la	$a0,windowClosemsg	# Show window close message upon selecting "Close"
	jal	displayNotification
	j 	DisplayMenu
gotoWindowOpenmsg:
	la	$a0, windowWarn		# Show warning message to Close the window
	jal	displayNotification
	j	DisplayMenu	
		
light:
        la      $a0, lightMsg
        jal     displayNotification
        
        la	$a0, input
	li	$a1, 11				# 10 charcaters can be read from user
	jal	readStrInput
        
	j	lightController

lightController:
        la      $a0, lightOn
        la      $a1, input
        jal     stringCompare			#Confirming the correct input
        beqz    $v0, lightISon
        
        la      $a0, lightOff
        la      $a1, input
        jal     stringCompare            	#Confirming the correct input
        beqz    $v0, LightIsoff
        la	$a0, wrongOpt			# else print wrong option message
        jal	displayNotification
        j       light
        
lightISon:
        la    $a0, MsgLightOn
        jal   displayNotification
                  
        la    $a0, QnaLight
        jal   displayNotification
                  
        la    $a0, input              		 #Input for QnaLight
        la    $a1, 11
        jal	readStrInput
                  
        la    $a0, AQnaLight1
        la    $a1, input
        jal   stringCompare			#Confirming the correct input
        beqz  $v0, LightIsoff			#If user input is 'Off'
        la	$a0, wrongOpt			# else print wrong option message
        jal  displayNotification
        j     DisplayMenu
                  
LightIsoff:
        la   $a0, MsgLightOff
        jal  displayNotification
        j    DisplayMenu
        
fan:
        la      $a0, FanMsg
        jal     displayNotification
        
        
        la	$a0, input
	li	$a1, 11				# 10 charcaters can be read from user
	jal	readStrInput
        
	j	FanController

FanController:
        la      $a0, FanOn
        la      $a1, input
        jal     stringCompare            #Confirming the correct input
        beqz    $v0, FanISon
        
        la      $a0, FanOff
        la      $a1, input
        jal     stringCompare            #Confirming the correct input
        beqz    $v0, FanIsoff
        la	$a0, wrongOpt		# else print wrong option message
        j       fan
        
FanISon:
        la    $a0, MsgFanOn
        jal   displayNotification
                  
        la    $a0, QnaFan1
        jal   displayNotification
                  
        la    $a0, input                    #Input for QnaFan1
        la    $a1, 11
        jal	readStrInput
                  
        la    $a0, AQnaFan2
        la    $a1, input
        jal   stringCompare            #Confirming the correct input
        beqz  $v0, FanIsoff        #If user input is 'Off'
        la	$a0, wrongOpt		# else print wrong option message
        jal   displayNotification
        j     DisplayMenu
                  
FanIsoff:
        la   $a0, MsgFanOff
        jal  displayNotification
                   
        la    $a0, QnaFan2
        jal   displayNotification
                  
        la    $a0, input
        la    $a1, 11
        jal	readStrInput
                  
        la    $a0, AQnaFan1
        la    $a1, input
        jal   stringCompare            #Confirming the correct input
        beqz  $v0, FanISon        #If user input is 'Off'
        la	$a0, wrongOpt		# else print wrong option message
        jal   displayNotification
        j    DisplayMenu
	
aircon:
	la	$a0, airConMsg
	jal	displayNotification

	la	$a0, input
	li	$a1, 11			# 10 charcaters can be read from user
	jal	readStrInput
	
	j option			# Go to the Option

option:	
	la	$a0, isOn
	la	$a1, input
	jal	stringCompare			# check username and user2 are equal or not
	beqz	$v0, airOn		#if input and the condition is same go to the sub function.
	
	la	$a0, isOff
	la	$a1, input
	jal	stringCompare			# check username and user2 are equal or not
	
	beqz	$v0, airOff		#if input and the condition is same go to the sub function.
	la	$a0, wrongOpt		# else print wrong option message
	jal	displayNotification
	j 	aircon		
airOn:
	la	$a0,airOnMsg
	jal	displayNotification	
	j 	gotoTemperature
airOff:
	la	$a0,airOffMsg
	jal	displayNotification
	j 	DisplayMenu
	
gotoTemperature:
# print enter temperature message
	la	$a0, tempMsg		
	jal	displayNotification
# read temperature from user
	jal	readIntInput	
	move	$t3, $v0		# move temperature into t3
	blt	$t3, 16, tempAlert1	# if temperature < 16 . The sensor will detect and will call tempAlert1 sensor 
	bgt	$t3, 24, tempAlert2	# else if temperature > 24. The sensor will detect and will call goto tempAlert2 sensor
	la	$a0, tempIsNow
	jal	displayNotification
	j	DisplayMenu		# jump on DisplayMenu
	
# Temparature alert sensor1 
tempAlert1:
# print temperature over loaded message
	la	$a0, tempLowMsg
	jal	displayNotification
	la $a0,	tempIsNow
	j	gotoTemperature		# jump on Temperature Menu
	
# Temparature alert sensor2 
tempAlert2:
# print temperature over loaded message
	la	$a0, tempOverMsg
	jal	displayNotification
	j	gotoTemperature		# jump to Temperature Menu

	
# if username or password wrong then this block of code execute
inValid:
	# print invalid message
	la	$a0, wrongMsg
	jal	displayNotification
	j	main	# jump on main


printstring:
	li	$v0,4
	syscall
	jr	$ra
		
# Procedure for ending the program
exit:
	li	$v0, 10
	syscall


# This function display a string on console
displayNotification:
	li	$v0, 4
	syscall
	jr	$ra
	
# This function read integer value from user
readIntInput:
	li	$v0, 5
	syscall	
	jr	$ra

# this function read string value from user
readStrInput:
	li	$v0, 8
	syscall	
	jr	$ra
	
# this function print integer value on console
displayIntegerValue:
	li	$v0, 1
	syscall	
	jr	$ra

# this function compare two string if both strings are equal then $v0 = 0	
stringCompare:
	add	$s0,$zero,$zero 	# s0 = 0
	add	$s1,$zero,$a0 		# s1 = first string address
	add	$s2,$zero,$a1 		# s2 = second string address
loop:
	lb	$s3,0($s1) 		# load a byte from string 1
	lb	$s4,0($s2) 		# load a byte from string 2
	beq	$s3, 10, returnStrCmp	# Return the value to string compare function
	beqz	$s3, returnStrCmp
	bne	$s3, $s4, setMinusOne 		
	li	$v0, 0
	j	nextChars

setMinusOne:
	li	$v0, -1

nextChars:
	addi	$s1,$s1,1 		# s1 points to the next byte of str1
	addi	$s2,$s2,1
	j	loop
returnStrCmp:
	jr	$ra
