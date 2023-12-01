
;硬件描述：P0口接LED数码管；P3.7 控制数码管  P1.0控制加P1.1控制减
;功能描述：数码显示实验

          
           ORG 0000H  
           AJMP START
           ORG 0030H

START:     MOV P1,#0FFH
           MOV R0,#0
           CLR P3.7
           LCALL SHOW  
AAA:       JNB P1.0,INCH
           JNB P1.1,DECH
           AJMP AAA
 
INCH:      LCALL DELAY1
           MOV A,R0
           INC A
           MOV R0,A
           LCALL SHOW
           AJMP AAA
           RET      
          
DECH:      LCALL DELAY1
           MOV A,R0
           DEC A
           MOV R0,A
	   LCALL SHOW
	   AJMP AAA
           RET

SHOW:      MOV A,R0
           MOV DPTR,#LED
           MOVC A,@A+DPTR
           MOV P0,A
           LCALL DELAY
           RET

DELAY:     MOV R7,#250
DL1:       MOV R6,#100
DL2:       MOV R5,#10
           DJNZ R5,$
           DJNZ R6,DL2
           DJNZ R7,DL1
           RET 

DELAY1:    MOV R4,#2
           DJNZ R4,$
           RET       


LED:       DB 0C0H,0F9H,0A4H,0B0H,99H,92H,82H,0F8H,80H,90H
           
           DB 88H,83H,0C6H,0A1H,86H,8EH
           

           END

