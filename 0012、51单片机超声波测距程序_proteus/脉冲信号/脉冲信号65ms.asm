            ORG    0000H
LOOP:       SETB   P1.0
	    NOP
            NOP
	    MOV    R1,#249
TAB1:  	    NOP
 	    NOP
   	    DJNZ   R1,TAB1
	    CLR    P1.0
	    MOV    R2,#64
TAB2:	    MOV    R3,#249
TAB3:	    NOP
	    NOP
	    DJNZ   R3,TAB3
	    DJNZ   R2,TAB2
             MOV    R4,#15
TAB4:	    NOP
	    NOP
	    DJNZ   R4,TAB4
	    NOP
	    SJMP   LOOP
	    END
