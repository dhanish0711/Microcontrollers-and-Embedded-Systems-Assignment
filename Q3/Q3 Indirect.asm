; A student claims that two assembly programs are equivalent because both access the same RAM address; however, this claim is incorrect due to the difference in addressing modes. In this case study, write two short assembly programs—one using direct addressing and the other using indirect addressing—such that both reference the same RAM location. Using an appropriate initial RAM configuration, demonstrate a situation where the outputs of the two programs differ even though the base address is the same. Support the observation with register and RAM snapshots from simulation, and explain that the difference arises because direct addressing accesses the data stored at the given address, whereas indirect addressing treats the contents of that address as a pointer to another memory location, leading to different data being fetched and hence different outputs.
ORG 0000H

; Initialize RAM
MOV 30H, #40H
MOV 40H, #99H

; Indirect addressing
MOV R0, 30H     ; R0 = 40H (pointer)
MOV A, @R0      ; A = data at address 40H
MOV 31H, A      ; store result

END
