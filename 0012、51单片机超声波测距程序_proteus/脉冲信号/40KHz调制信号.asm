             ORG   0000H
LOOP0:       MOV   R2,#80
LOOP1:       CPL   P1.0
	     MOV   R1,#03
LOOP2:       NOP
             DJNZ  R1,LOOP2
             DJNZ  R2,LOOP1   
             CLR   P1.0
             MOV    R5,#64
TAB2:	     MOV    R3,#249
TAB3:	     NOP
	     NOP
	     DJNZ   R3,TAB3
	     DJNZ   R5,TAB2
             MOV    R4,#15
TAB4:	     NOP
	     NOP
	     DJNZ   R4,TAB4
	     NOP
	     SJMP    LOOP0
	     END

                  
             