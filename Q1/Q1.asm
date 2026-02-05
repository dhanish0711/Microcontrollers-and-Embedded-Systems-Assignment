ORG 0000H

MOV A,#0AH     ; 0AH = 10
MOV B,#64H     ; 64H = 100
MUL AB         ; B:A = 03E8H (1000)

ADD A,#13H     ; 13H = 19 → 1000 + 19 = 1019
INC A          ; +1 → 1020

; Final result: B:A = 03FCH = 1020

END
