// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//no direct "multiply" so add R1 R0 times and store in R2

@R2
M=0 //R2=0

(loop)
@R1
D=M
@end
D;JEQ//works as next in for-next loop
@R0
D=M//D=R0
@R2
M=M+D//R2=R2+R0
@R1
D=M-1
M=D//R1=R1-1

@loop
0;JMP

(end)
@end
0;JMP//inf loop
