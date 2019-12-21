//Image Test

@SCREEN		//Screen location start
D=A
@addr 		//Begining of screen
M=D

@100		//Starting location of image
D=A
@i 			//Image line counter
M=D

@ROW 		//Screen Row ccounter
M=0


(LOOP)		//Draw each line
	@i
	D=M
	@1930	//Last location of image date
	D=D-A
	@END
	D;JGT 	//If i = 0 then loop complete


	@i
	D=M
	A=D
	D=M
	@addr
	A=M
	M=D	//Draw row

	@i
	M=M+1 	//Increase counter by 1

	@addr
	M=M+1	//update screen pointer

	@10
	D=A
	@ROW
	M=M+1 //add 1 to the row counter
	D=M-D
	@LOOP
	D;JNE	//If Row not 3 goto LOOP

	@ROW
	M=0
	@22
	D=A
	@addr
	M=D+M 	//add 29 to address location
	@LOOP
	0;JMP	//goto LOOP

(END)
	@END
	0;JMP

