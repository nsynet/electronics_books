        ORG 0000H
        LJMP MAIN
        ORG 0003H
        LJMP INTT0
        ORG 0013H
        LJMP INTT1
        ORG 0030H
MAIN:   MOV TMOD,#01H
        MOV TL0,#00H
        MOV TH0,#00H
        MOV IE,#0FFH
        SETB IT1
        CLR EX1
        CLR IT0
        CLR P3.4
DDD:    JB P1.0,JJJ
        SETB P3.4
        SETB EX1
        MOV 30H,#00H
        MOV 31H,#00H
        MOV 32H,#00H
JJJ:    LCALL DIS
        LJMP DDD
               
INTT0:  CLR P3.4
        CLR EX1
        RETI
        
INTT1:   MOV   A,30H
         CJNE  A,#09H,L1
         MOV   30H,#00H
         MOV   A,31H
         CJNE  A,#09H,L2
         MOV   31H,#00H
         MOV   A,32H
         CJNE  A,#09H,L3
         MOV   32H,#00H
         LJMP  L4
L1:      ADD   A,#01H
         MOV   30H,A
         LJMP  L4
L2:      ADD   A,#01H
         MOV   31H,A
         LJMP  L4
L3:      ADD   A,#01H
         MOV   32H,A
         LJMP  L4
L4:      RETI

                
DIS:    MOV R0,#30H
        MOV R1,#03H
        MOV R2,#0FEH
LLL:    MOV A,R2
        MOV DPTR,#0BFFFH
        MOVX @DPTR,A
        MOV A,@R0
        MOV DPTR,#TAB
        MOVC A,@A+DPTR
        MOV DPTR,#7FFFH
        MOVX @DPTR,A
        LCALL TIME
        INC R0
        MOV A,R2
        RL A
        MOV R2,A
        DJNZ R1,LLL
        RET
        
TIME:   MOV R7,#04H
KKK:    MOV R6,#0FFH
        DJNZ R6,$
        DJNZ R7,KKK
        RET
                
TAB:    DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH
        END
        