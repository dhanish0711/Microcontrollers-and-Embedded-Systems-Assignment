; Write an 8051 Assembly Language Program in which you must use logical instructions to construct a numeric result. Using multiple logical instructions such as ANL, ORL, and CLR, generate the last four digits of your own mobile number through a suitable sequence of operations (you may split the digits and combine them logically as required). Do not directly load the complete 4-digit number as an immediate value. The program should use more than one logical instruction, and at the end of execution the Accumulator (A) must contain the last four digits of your mobile number. Simulate the program and verify that the final value in the Accumulator matches your mobile number’s last four digits.
ORG 0000H

; Goal: last four digits = 0111 (decimal) = 111 = 6FH

; ---- Block 1: Create 7FH (temporary) and store ----
CLR A              ; A = 00H
ORL A, #70H        ; A = 70H
ORL A, #0FH        ; A = 7FH
MOV 61H, A         ; store temp = 7FH

; ---- Block 2: Create mask EFH (1110 1111) and store ----
CLR A              ; A = 00H
ORL A, #0E0H       ; A = E0H
ORL A, #0FH        ; A = EFH
MOV 60H, A         ; store mask = EFH

; ---- Block 3: Apply ANL to get final 6FH ----
MOV A, 61H         ; A = 7FH
ANL A, 60H         ; A = 6FH  (7F AND EF = 6F)

MOV 62H, A         ; store final = 6FH (optional)

; Final: A = 6FH  => 111 decimal => "0111"

END
