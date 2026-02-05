; An embedded logger stores event codes in internal RAM from 40H to 5FH, but due to strict memory limitations the data must be compacted in-place without using any additional RAM or the stack. Write an assembly language program that scans the memory range 40H–5FH using only indirect addressing, removes all occurrences of the value FFH, shifts the remaining valid data bytes to the left to eliminate gaps, and fills the unused memory locations at the end of the range with 00H. Execute the program to show the RAM contents before and after execution, and clearly explain the pointer movement logic used to identify valid data, shift it correctly, and overwrite invalid entries under the given constraints.
ORG 0000H

; -------- Initial RAM contents (40H–5FH) --------
; FFH values represent invalid entries

MOV 40H, #11H
MOV 41H, #0FFH
MOV 42H, #22H
MOV 43H, #33H
MOV 44H, #0FFH
MOV 45H, #44H
MOV 46H, #0FFH
MOV 47H, #55H
MOV 48H, #66H
MOV 49H, #0FFH
MOV 4AH, #77H
MOV 4BH, #88H
MOV 4CH, #0FFH
MOV 4DH, #99H
MOV 4EH, #0AAH
MOV 4FH, #0FFH

MOV 50H, #0BBH
MOV 51H, #0CCH
MOV 52H, #0DDH
MOV 53H, #0FFH
MOV 54H, #0EEH
MOV 55H, #0FFH
MOV 56H, #12H
MOV 57H, #34H
MOV 58H, #0FFH
MOV 59H, #56H
MOV 5AH, #78H
MOV 5BH, #0FFH
MOV 5CH, #9AH
MOV 5DH, #0BCH
MOV 5EH, #0FFH
MOV 5FH, #0DEH

; -------- Pointer initialization --------
MOV R0, #40H        ; R0 → read pointer (scans original data)
MOV R1, #40H        ; R1 → write pointer (stores compacted data)

; -------- Scan and compact loop --------
SCAN:
      MOV A, @R0    ; Read byte from memory using indirect addressing
      INC R0        ; Move read pointer to next location
      CJNE A, #0FFH, COPY   ; If data ≠ FFH, it is valid
      SJMP NEXT     ; If data = FFH, skip copying

COPY:
      MOV @R1, A    ; Store valid data at write pointer
      INC R1        ; Move write pointer forward

NEXT:
      CJNE R0, #60H, SCAN   ; Continue until end address (5FH)

; -------- Fill remaining memory with 00H --------
FILL:
      MOV A, #00H   ; Load 00H
      MOV @R1, A    ; Fill unused location with 00H
      INC R1        ; Move write pointer
      CJNE R1, #60H, FILL   ; Fill till end of range

END
