; Q1. Write an 8051 Assembly Language Program (ALP) to generate the last four digits of your PRN using any arithmetic instructions. The program should not directly load the complete PRN number as an immediate value. Instead, it must use appropriate arithmetic operations such as ADD, MUL, or INC to form the number logically. The final result must be stored in the Accumulator register (AX). For example, if a student’s PRN is 24070521211, the last four digits are 1211, and the value 1211 should be available in AX at the end of program execution. 
ORG 0000H

MOV A,#0AH     ; 0AH = 10
MOV B,#64H     ; 64H = 100
MUL AB         ; B:A = 03E8H (1000)

ADD A,#13H     ; 13H = 19 → 1000 + 19 = 1019
INC A          ; +1 → 1020

; Final result: B:A = 03FCH = 1020

END
