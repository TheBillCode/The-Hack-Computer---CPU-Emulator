//Discussion wk6 CS1104 - Secret Codes
//This program translates keyboard input
//into Morse Code and is written in assembly
//language specifically for the Hack Computer.
//This is version 1.0


//Constant and variable declaration
@SCREEN 	
D=A
@320			//Starting row
D=D+A
@scrloc			//current screen location (16)
M=D
@prevloc		//previous screen location
@currentLetter	//Keyboard input (17)
M=0
@height			//char height (18)
@charLoc		//character location (19)
@letterStart	//first character in Morse letter (20)
@nWord			//number of word in character (21)


(LOOP)			//Main Loop
	//Get Keyboard Input
	@KBD
	D=M
	@LETTER
	D;JNE		//If keyboard input call LETTER
	@LOOP
	0;JMP		//Goto LOOP

(LETTER) 		
	//Check to make sure it is a letter
	@currentLetter
	M=D 		//Update current letter
	@64 		
	D=D-A
	@LOOP
	D;JLE		//If currentLetter < 65 "a" goto LOOP
	@currentLetter
	D=A
	@90
	D=D-A
	@LOOP
	D;JGE		//If currentLetter >90 "z" goto LOOP

	//Set up for Morse Letter
	@5
	D=A
	@height		//char height
	M=D

(DRAW)
	@currentLetter
	A=M
	D=M
	A=D
	@charLoc 	//number of characters
	M=D
	A=M
	D=M
	@nWord
	M=D
	@i 			//iterator
	M=D 		
	@charLoc
	D=M
	@letterStart
	M=D+1

(NEXT)
 	//Draw the characters
 	@letterStart
 	A=M
 	D=M
 	@scrloc
 	A=M
 	M=D 	//Draw character
 	@2
 	D=A
 	@scrloc
 	M=M+D
 	@letterStart
 	M=M+1
 	@i
 	M=M-1
 	D=M
 	@NEXT
 	D;JNE	//Next character

 	@nWord
 	D=M
 	@i
 	M=D
 	@j
 	M=0

(MULT)
	@j
	D=M
	@2
	D=D+A
	@j 		//holds mult value
	M=D
	@i
	M=M-1
	D=M
	@MULT
	D;JNE

	@j
	D=M
 	@32
 	D=A-D
 	@scrloc
 	M=M+D
 	@height
 	M=M-1
 	D=M
 	@DRAW	//next Line
 	D;JNE

 	@320
 	D=A
 	@scrloc
 	M=M+D
 	@24545
 	D=A
 	@scrloc
 	D=D-M
 	@END
 	D;JLT
 	@KBD
 	M=0
 	@LOOP
 	0;JMP


(END)
	@END
	0;JMP

