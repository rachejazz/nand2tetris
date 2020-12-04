// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

@screenstat
M=-1//setting whole line black
D=0 //setting whole line white
@screenset
0;JMP//loop infinite to set screen till given block

(kbloop)
@24576
D=M//scan code of key in D
@screenset
D;JEQ//if no key, D=0 then jump
D=-1//set line black otherwise

(screenset)
@prevstat
M=D//saving previous b&w situation
@screenstat
D=D-M//check if prev and current screen stat is same or not
@kbloopa	//THIS LINE I HAVE CHANGED. WHY WORKING THOUGH??
D;JEQ//if D is eq 0, keep jumping/looping

@prevstat//equate prevstat to the current stat
D=M
@screenstat
M=D

@16384
D=A//stored starting address of screen to D
@8000 //block till screen fill
D=D+A //go on till the starting add+8000
@i
M=D //store last add to i

(mainloop)//to print from start to end add, loop
@i
D=M-1
M=D//i=i-1
@kbloop
D;JLT//if i<0 goto kbloop

@screenstat
D=M//prev stat now stored in D
//I'm guessing sth wrong here. I thought of this M[prev screen block add] = screenstat
//idk how to make the add move
@i
A=M
M=D//storing present stat of current screen block
@mainloop
0;JMP//inf loop

