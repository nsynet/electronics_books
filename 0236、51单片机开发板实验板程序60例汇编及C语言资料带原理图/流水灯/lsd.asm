;��Ŀ���ƣ�������ˮ��
;Ӳ��������AT89S52
;Ӳ��������P0�ڽӰ˸�LED
;����������LED��ˮʵ��

;*******************************************************

          ORG 0000H
          AJMP START
          ORG 0030H

START:    MOV P0,#0FFH
          MOV A,#0FEH
AAA:      MOV P0,A
          LCALL DELAY
          JNB P1.3,BBB
          RL A
          AJMP AAA  
BBB:      MOV A,#7FH
CCC:      MOV P0,A
          LCALL DELAY
          JNB P1.0,START 
          RR A
          AJMP CCC

DELAY:    MOV R7,#250
DL1:      MOV R6,#100
DL2:      MOV R5,#10
          DJNZ R5,$
          DJNZ R6,DL2
          DJNZ R7,DL1
          RET                
     
          END
          

