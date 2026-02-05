; Execute an 8051-assembly language program for a safety-certified system in which the instructions CJNE, DJNZ, and SUBB are not permitted. Two unsigned numbers are stored in internal RAM locations 50H and 51H. The program must compare these two numbers using only the allowed instruction set (MOV, INC, DEC, JZ, JNZ, CLR, SETB, ANL, ORL) and store the comparison result in a register or memory location such that 01H indicates the value at 50H is greater than the value at 51H, 00H indicates both values are equal, and FFH indicates the value at 50H is less than the value at 51H. The program should be simulated for all three possible cases (A > B, A = B, A < B), and the solution must clearly explain how flag behavior (especially the Zero flag) is utilized to achieve comparison under the given instruction constraints.
ORG 0000H

; Load test values (A > B case)
MOV 50H, #08H     ; A = 8
MOV 51H, #03H     ; B = 3

; Copy values
MOV A, 50H
MOV R2, A
MOV A, 51H
MOV R3, A

LOOP:
    MOV A, R2
    JZ  A_ZERO

    MOV A, R3
    JZ  B_ZERO

    DEC R2
    DEC R3

    MOV A, #01H
    JNZ LOOP

A_ZERO:
    MOV A, R3
    JZ  EQUAL
    MOV 52H, #0FFH     ; A < B
    SJMP DONE

B_ZERO:
    MOV A, R2
    JZ  EQUAL
    MOV 52H, #01H      ; A > B
    SJMP DONE

EQUAL:
    MOV 52H, #00H

DONE:
END
