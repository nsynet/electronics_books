
            
           ORG 0000H
           AJMP START
           ORG 0030H
  
START:     MOV P0,#0FFH
           MOV P1,#0FFH

AAA:       JNB P1.0,SHOW1
           JNB P1.1,SHOW2
           JNB P1.2,SHOW3
           JNB P1.3,SHOW4
           AJMP AAA

SHOW1:     MOV A,#0FEH
BBB:       MOV P0,A
           LCALL DELAY
           JNB P0.7,START         
           RL A
           LCALL BBB
           RET
           
SHOW2:     MOV A,#7FH
DDD:       MOV P0,A
           LCALL DELAY
	   JNB P0.0,START
           RR A
           LCALL DDD
           RET

SHOW3:     MOV A,#0F0H
EEE:       MOV P0,A
           LCALL DELAY1
 	   JNB P0.7,START
           CPL A
           LCALL EEE
           RET

SHOW4:     MOV A,#33H
FFF:       MOV P0,A
           LCALL DELAY1
           JNB P0.0,START
           CPL A
           LCALL FFF
           RET

DELAY:     MOV R7,#250
DL1:       MOV R6,#200
           DJNZ R6,$
           DJNZ R7,DL1
           RET

DELAY1:    MOV R5,#10
DL2:       LCALL DELAY
           DJNZ R5,DL2
           RET

           END           

