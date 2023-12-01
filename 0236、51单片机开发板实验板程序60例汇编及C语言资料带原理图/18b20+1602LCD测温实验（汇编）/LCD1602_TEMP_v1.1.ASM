ORG 00H
JMP INPORT
ORG 0BH
;JMP TM0
ORG 30H
INPORT:
TMP_H EQU 29H ;温度高字节
TMP_L EQU 28H
RS EQU P3.0;确定具体硬件的连接方式 
RW EQU P3.1 ;确定具体硬件的连接方式
E  EQU P3.2 ;确定具体硬件的连接方式
KEY_SET EQU P1.1
KEY_UP  EQU P1.0
KEY_DOWN EQU P1.2
DS18B20_FLAG EQU 70h
SET_FLAG EQU 01H
FLASH_FLAG EQU 02H
K_ON EQU 03H
MOV 25H,#0FFH ;位00h-07h全部置1
MOV R4,#14
MOV TMOD,#01H
MOV TL0,#0B0H
MOV TH0,#3CH
MOV IE,#10000010B ;(8:总控,2:定时0溢出中断控制位)


LCD_INIT:
;15MS
MOV R6,#30
CALL DELAY_BY_R6 ;15ms
MOV P0,#38H ;写38h
ACALL WRITE_NOT_CHECK_BUSY 
MOV R6,#10
CALL DELAY_BY_R6 ;5ms																														
MOV P0,#38H
ACALL WRITE_NOT_CHECK_BUSY
MOV R6,#10
CALL DELAY_BY_R6 ;5ms
;-----设转初始值
SETB E
MOV P0,#00000001B ;清屏并光标复位
ACALL ENABLE;调用写入命令子程序 
MOV P0,#00111000B ;8位2行5x7点阵 
ACALL ENABLE ;调用写入命令子程序 
MOV P0,#00001110B ;显示器开、光标开、光标允许闪烁
ACALL ENABLE ;调用写入命令子程序
MOV P0,#00000110B;文字不动，光标自动右移 
ACALL ENABLE ;调用写入命令子程序


STORE_DEFINE_DATA: ;把自定义字符存入CGRAM
MOV P0,#40H ;CGRAM起始地址
ACALL ENABLE
MOV R2,#8
MOV DPTR,#DEFINE_DATA
MOV R3,#0
NEXTP:
MOV A,R3
MOVC A,@A+DPTR
MOV P0,A
CALL WRITE_DATA_TO_LCD
INC R3
DJNZ R2,NEXTP

;****************主程序*******************
START:
CALL RESET
JNB  70h,MAIN1
MOV P0,#0C0H ;写入显示起始地址（第二行第一个位置）
ACALL ENABLE ;调用写入命令子程序

DS18B20_NOT_READY: 
CALL DISPLAY_18B20_ERROR

LOOP1: 
CALL RESET
JNB 70h,MAIN1
JMP LOOP1 ;如果栓测不到18b20程序下面不执行

MAIN1: 
MOV P0,#00000001B ;清屏并光标复位
ACALL ENABLE;调用写入命令子程序 
CALL DISPLAY_WATING ;等待第一次结果.
CALL SKIP_ROM 
CALL TEMP_CONV
CALL DELAY_600MS 
MOV P0,#00000001B ;清屏并光标复位
ACALL ENABLE;调用写入命令子程序



   
MAIN :
CALL RESET
CALL SKIP_ROM 
CALL RECALL_EPROM ;调入温度限值.
MAIN_MAIN:
CALL READ_TEMP ;读18b20的内部温度
JB 70h,DS18B20_NOT_READY ;中途失败!
CALL DATA_CONV ; 数据转换
CALL DISPLAY_18B20_TEMP
CALL DISPLAY_18B20_TEMP_XZ;显示限值.
CALL CONTROL
JNB KEY_SET,S1
JMP MAIN_MAIN


CONTROL:
JNB 03H,CONTROL1
LCALL DISPLAY_OFF
AJMP CONTROL_END
CONTROL1:
LCALL DISPLAY_ON
CONTROL_END:
RET 

S1:
LCALL DELAY_2MS ;延时消抖
JB KEY_SET,MAIN
JNB KEY_SET,$
LCALL KEY ;有键输入
AJMP MAIN


;***************键处理程序******************
KEY: SETB 01H
KEY_IN:;有键输入的程序
MOV P0,#00000001B ;清屏并光标复位
ACALL ENABLE;调用写入命令子程序
JNB 01H,DSP_SET_L ;01如果是0,则显示L:
DSP_SET_H: ;显示高温的限值
MOV P0,#10000000B
ACALL DISPLAY_SETING_TEMP_H ;显示SETING_TEMP:H ..
MOV DPTR,#LED_DATA
MOV R1,42H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示温度限值低位
MOV DPTR,#LED_DATA
MOV R1,41H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示温度限值低位
MOV DPTR,#LED_DATA
MOV R1,40H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
AJMP KEY_SELECT

DSP_SET_L:;显示低温的限值
MOV P0,#10000000B
ACALL DISPLAY_SETING_TEMP_L ;显示SETING_TEMP:L ..
MOV DPTR,#LED_DATA
MOV R1,45H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示温度限值低位
MOV DPTR,#LED_DATA
MOV R1,44H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示温度限值低位
MOV DPTR,#LED_DATA
MOV R1,43H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
AJMP KEY_SELECT 


KEY_SELECT:
JNB KEY_SET,K_SET
JNB KEY_UP,K_UP
JNB KEY_DOWN,K_DOWN
AJMP KEY_SELECT 


K_SET:
LCALL DELAY_2MS
lcall delay_2ms
lcall delay_2ms
JB KEY_SET,KEY_SELECT 


MOV R5,#250
KSET_LOOP:
JB KEY_SET,KEY_CPL
LCALL DELAY_2MS
LCALL DELAY_2MS
DJNZ R5,KSET_LOOP
AJMP EXT_KEY


K_UP:
LCALL DELAY_2MS
lcall delay_2ms
JB KEY_UP,KEY_SELECT
JNB  01H,K_UP_LOW

K_UP_HIGH:
JNB KEY_UP,$
MOV A,2AH
INC A 
MOV 2AH,A
JMP K_UP_DOWN_END

K_UP_LOW:
JNB KEY_UP,$
MOV A,2BH
INC A 
MOV 2BH,A
JMP K_UP_DOWN_END

;*********************

K_DOWN:
LCALL DELAY_2MS
JB KEY_DOWN,KEY_SELECT
JNB  01H,K_DOWN_LOW

K_DOWN_HIGH:
JNB KEY_DOWN,$
MOV A,2AH
DEC A 
MOV 2AH,A
JMP K_UP_DOWN_END

K_DOWN_LOW:
JNB KEY_DOWN,$
MOV A,2BH
DEC A 
MOV 2BH,A

K_UP_DOWN_END:

MOV A,2AH
MOV B,#10
DIV AB
MOV 40H,B ;高温限值个位 
MOV B,#10
DIV AB
MOV 41H,B;十位
MOV 42H,A;百位
;----------------------------
MOV A,2BH
MOV B,#10
DIV AB
MOV 43H,B ;低温限值位个位 
MOV B,#10
DIV AB
MOV 44H,B ;十位
MOV 45H,A ;百位

AJMP KEY_IN 


KEY_CPL:
CPL 01H
AJMP KEY_IN




EXT_KEY:
MOV P0,#00000001B ;清屏并光标复位
CALL ENABLE;调用写入命令子程序
CALL DISPLAY_SAVE

CALL RESET
CALL SKIP_ROM
MOV A,#4EH
CALL WRITE
MOV A,2AH ;2A数据送高温限值寄存器.
CALL WRITE
MOV A,2BH ;2B数据送低温限什寄存器.
CALL WRITE

CALL RESET 
CALL SKIP_ROM
MOV A,#48H ;将高低温限值寄存器数据送18B20-EPROM保存.
CALL WRITE
A_END:

RET







;***************18b20指令子程序**********************
READ_TEMP:  ;读1820内部温度子程序.
     CALL RESET
     JB 70h,EXT1 
     CALL SKIP_ROM 
     CALL TEMP_CONV ;温度AD变换
     CALL DELAY_600MS  ;时........
     CALL RESET
     CALL SKIP_ROM 
     CALL TEMP_GET ;发取温度的命令
     CALL READ ;接收...
	  EXT1:
     RET 

SKIP_ROM:;跳过ROM检测
    MOV A,#0CCH ;#0CCH为跳过rom命令
    CALL WRITE
    RET 

RECALL_EPROM:;重调Eprom
    MOV A,#0B8H
    CALL WRITE
    RET 

 
TEMP_CONV:
    MOV A,#44H ;AD变换
	 CALL WRITE
	 RET

TEMP_GET:
    MOV A ,#0BEH;读18b20命令
    CALL WRITE
    RET 


;****************************18B20基本时序子程序*********************************
RESET:  ;初始化子程序
   SETB P2.7 
   NOP 
   CLR P2.7    ;拉低
   MOV R3,#150 ; *4=600US
   CALL DELAY_BY_R3
   SETB P2.7    ;拉高
   MOV R3,#15  ; 60US
   CALL DELAY_BY_R3
   MOV R3,#60 ;4个周期*60=240US内检测 
A1: JNB P2.7,A2 ;检测到低平信号
    DJNZ R3,A1 ;如果没有应答的低电平信号,返回A1重新检测,超时后下一行,
    SETB 70h ;DS1820不存在.
    JMP A3
A2: CLR 70h
    MOV R3,120;240US;等恢复时间2*120=240us
    DJNZ R3, $
A3: 
   RET
;------------------------

WRITE:
    MOV R2,#8;一个字节为8位
    CLR C ;C位清0 C位用来放A的一位数据,用移位的方法放入C
B1: SETB P2.7
	 NOP 
    CLR P2.7
	 MOV R3,#4 ;16US
	 CALL DELAY_BY_R3
	 RRC A        ;把A中的数送入C
	 MOV P2.7,C   ;把C送入总线
    MOV R3,#12    ;48US(一位数据的发送:60us<tx<120us)
	 CALL DELAY_BY_R3
	 SETB P2.7  ;拉高1us结束一位
	 NOP 
	 DJNZ R2,B1
         RET

READ:
MOV R1,#4 ;接收4个字节数据依次是1.低位 2.高位. 3.高限 4.低限
MOV R0,#28H;低位放28H;高位放29h (1. 28H,2. 29H 3. 2AH 4. 2BH )
C0: MOV R2,#8;一字节数据8位
C1: CLR C ;清除C
SETB P2.7
NOP 
NOP 
CLR P2.7 ;拉低.
NOP ;1us秒后拉高?
SETB P2.7
MOV R3,#4  ;16us后采数据
CALL DELAY_BY_R3
MOV C,P2.7 ;读出18b20的数据
RRC  A ;移入A
MOV R3,#12;48US恢复时间
CALL DELAY_BY_R3
DJNZ R2,C1 ;一个字节收完
MOV @R0,A  ;移入存储位
INC  R0     ;下一位;29h
DJNZ R1,C0 ;全部取完吗?没有重复
RET 
;*********************************************************************************



;*****************LCD_控制命令***************
DISPLAY: MOV A,R1
MOVC A,@A+DPTR
MOV P0,A
CALL WRITE_DATA_TO_LCD
INC R1
DJNZ R0,DISPLAY
RET 


WRITE_NOT_CHECK_BUSY:
SETB E 
NOP
NOP 
CLR RS ;写入控制命令的子程序
CLR RW 
CLR E 
RET 


ENABLE:
SETB E
NOP
NOP
CLR RS ;写入控制命令的子程序
CLR RW 
CLR E 
ACALL TEST_BUSY
SETB E 
RET


TEST_BUSY:
SETB E 
NOP
NOP 
MOV P0,#0FFH ;判断液晶显示器是否忙的子程序
CLR RS 
SETB RW
CLR E 
NOP 
SETB E 
JB P0.7,TEST_BUSY ;如果P0.7为高电平表示忙就循环等待 
RET


WRITE_DATA_TO_LCD:
SETB E 
NOP
NOP
SETB RS ;RS=1 
CLR RW ;RW=0 ;准备写入数据
CLR E ;E=0 ;执行显示命令
ACALL TEST_BUSY ;判断液晶模块是否忙?
SETB E ;E=1 ;显示完成,程序停车
RET 




;***************************数据转换***************************
DATA_CONV:  ;数据转换
MOV A,28H ;低字节
ANL A,#0FH;去除高位
MOV B,#6;乘6得到实际数值的100倍.
MUL AB
MOV B,#10
DIV AB
MOV 33H,A;小数位高
MOV 32H,B; 小数位低
MOV A,28H
MOV C,29H.0 ;29h高位的低4字节
RRC A 
MOV C,29H.1
RRC A 
MOV C,29H.2
RRC A 
MOV C,29H.3
RRC A 
MOV 28H,A ;重新合成.结果存在28H.
MOV A,28H
MOV B,#10
DIV AB 
MOV 26H,A ;整数位高
MOV 25H,B ;整数位低 
;-------------------------
MOV A,2AH
MOV B,#10
DIV AB
MOV 40H,B ;高温限值个位 
MOV B,#10
DIV AB
MOV 41H,B;十位
MOV 42H,A;百位
;----------------------------
MOV A,2BH
MOV B,#10
DIV AB
MOV 43H,B ;低温限值位个位 
MOV B,#10
DIV AB
MOV 44H,B ;十位
MOV 45H,A ;百位

CLR C 
MOV A,28H;现温度值与高温限值比较
SUBB A,2AH
JC BIG ;如果高.则关机器
CLR C 
MOV A,2BH;现温度与低温限值比较
SUBB A,28H
JC X_BIG ;低温限值比现温高,则开机器
AJMP CONVERT_END
BIG:
CLR K_ON
AJMP CONVERT_END
X_BIG:
SETB K_ON 
CONVERT_END:
RET 







;********************显示温度*************************
DISPLAY_18B20_TEMP: ;LCD_显示子程序
MOV P0,#10000000B; 显示位置
ACALL ENABLE ;执行指令
MOV DPTR,#TAB3;显示'WENDU:'
MOV R1,#0 ;码表初值
MOV R0,#7;字数
CALL DISPLAY
;---------------显示温度值高位
MOV DPTR,#LED_DATA
MOV R1,26H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示温度值低位
MOV DPTR,#LED_DATA
MOV R1,25H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示小数点
MOV DPTR,#DOT
MOV R1,#0 ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示温度值小数高位
MOV DPTR,#LED_DATA
MOV R1,33H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示温度值小数低位
MOV DPTR,#LED_DATA
MOV R1,32H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示单位度
MOV DPTR,#SIGN
MOV R1,#0 ;码表初值
MOV R0,#2;字数
CALL DISPLAY
RET 



;******************显示限值.*****************
DISPLAY_18B20_TEMP_XZ:
MOV P0,#11000000B; 显示位置
ACALL ENABLE ;执行指令
MOV DPTR,#TAB_L ; 显示'L:'
MOV R1,#0 ;码表初值
MOV R0,#2;字数
CALL DISPLAY

;---------------显示温度限值高位
MOV DPTR,#LED_DATA
MOV R1,45H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示温度限值低位
MOV DPTR,#LED_DATA
MOV R1,44H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;-----------------
MOV DPTR,#LED_DATA
MOV R1,43H ;码表初值
MOV R0,#1;字数
CALL DISPLAY

MOV P0,#11000111B; 显示位置
ACALL ENABLE 
;----
MOV DPTR,#TAB_H ; 显示'H:'
MOV R1,#0 ;码表初值
MOV R0,#2;字数
CALL DISPLAY
;---------------显示高温度限值高位
MOV DPTR,#LED_DATA
MOV R1,42H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;---------------显示高温度限值低位
MOV DPTR,#LED_DATA
MOV R1,41H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
;-------------------
MOV DPTR,#LED_DATA
MOV R1,40H ;码表初值
MOV R0,#1;字数
CALL DISPLAY
RET 



      
;**********************提示语**********************
DISPLAY_18B20_HELLO:
MOV P0,#10000000B; 显示位置
ACALL ENABLE ;执行指令
MOV DPTR,#TAB_HELLO
MOV R1,#0 ;码表初值
MOV R0,#16;字数
CALL DISPLAy
RET 

/*
DISPLAY_18B20_TESTING:
MOV P1,#10000000B; 显示位置
ACALL ENABLE ;执行指令
MOV DPTR,#TAB_TESTING
MOV R1,#0 ;码表初值
MOV R0,#16;字数
CALL DISPLAy
RET 
*/


DISPLAY_18B20_ERROR:
MOV P0,#00000001B ;清屏并光标复位
ACALL ENABLE
MOV DPTR,#TAB1
MOV R1,#0 ;码表初值
MOV R0,#16;字数
CALL DISPLAy
RET 



DISPLAY_WATING: 
MOV P0,#00000001B ;清屏并光标复位
ACALL ENABLE;调用写入命令子程序
MOV P0,#10000000B; 显示位置
ACALL ENABLE ;执行指令
MOV DPTR,#TAB2
MOV R1,#0 ;码表初值
MOV R0,#13;字数
CALL DISPLAy
RET 

DISPLAY_SAVE: 
MOV P0,#00000001B ;清屏并光标复位
ACALL ENABLE;调用写入命令子程序
MOV P0,#10000000B; 显示位置
ACALL ENABLE ;执行指令
MOV DPTR,#TAB_SAVE
MOV R1,#0 ;码表初值
MOV R0,#10;字数
CALL DISPLAy
RET 


DISPLAY_SETING_TEMP_H:
MOV P0,#00000001B ;清屏并光标复位
ACALL ENABLE;调用写入命令子程序
MOV P0,#10000000B; 显示位置
ACALL ENABLE ;执行指令
MOV DPTR,#TAB_SETING_TEMP_H
MOV R1,#0 ;码表初值
MOV R0,#13;字数
CALL DISPLAy
RET

DISPLAY_SETING_TEMP_L:
MOV P0,#00000001B ;清屏并光标复位
ACALL ENABLE;调用写入命令子程序
MOV P0,#10000000B; 显示位置
ACALL ENABLE ;执行指令
MOV DPTR,#TAB_SETING_TEMP_L
MOV R1,#0 ;码表初值
MOV R0,#13;字数
CALL DISPLAy
RET


DISPLAY_ON:
MOV P0,#11001101B; 显示位置
ACALL ENABLE ;执行指令
MOV DPTR,#TAB_ON
MOV R1,#0 ;码表初值
MOV R0,#3;字数
CALL DISPLAy
RET

DISPLAY_OFF:
MOV P0,#11001101B; 显示位置
ACALL ENABLE ;执行指令
MOV DPTR,#TAB_OFF
MOV R1,#0 ;码表初值
MOV R0,#3;字数
CALL DISPLAy
RET



/*
ADJ_FLASH:
JB FLASH_FLAG,
MOV P1,#1 ;在显示数字的位置用三个空格..
ACALL ENABLE;
*/ 
;*****************提示语**********************
/*
TM0:;定时器程序.
DJNZ R0,N1
CPL  02H
MOV R0,#14H
N1:
MOV TL0,#0B0H
MOV TH0,#3CH
RETI
*/


;**************廷时程序************************
DELAY_BY_R3: 
NOP
NOP 
DJNZ R3,DELAY_BY_R3
RET 

DELAY_BY_R6:
D1: MOV R7,#0
DJNZ R7,$
DJNZ R6,D1
RET




DELAY_2MS:
          MOV R6,#2
F2:       MOV R7,#75
F1:       NOP 
	  NOP 
	  DJNZ R7,F1
          DJNZ R6,F2
	  RET 

DELAY_600MS:
          MOV R6,#0
G2:       MOV R7,#0
G1:       NOP 
	  NOP
          NOP
          NOP 
          NOP 
          NOP
          NOP 
          NOP
	  DJNZ R7,G1
          DJNZ R6,G2
	  RET 
 
DELAY_1M:
MOV R6,#0
MOV R7,#0
E1:  NOP
NOP
DJNZ R7,E1
DJNZ R6,E1
RET 




DEFINE_DATA:
DB 0CH,12H,12H,0CH,00H,00H,00H,00H;度
;DB 04H,0CH,12H,0DH,1EH,04H,08H,00H;今
;DB 0EH,04H,1FH,04H,04H,0AH,11H,00H;天
;DB 0EH,0EH,0EH,1FH,04H,0EH,17H,00H;是
;DB 10H,1FH,02H,0FH,0AH,1FH,02H,00H;年
;DB 0FH,09H,0FH,09H,0FH,09H,13H,00H;月
;DB 0FH,09H,09H,0FH,09H,09H,0FH,00H;日

LED_DATA: DB '0123456789'
	 

TAB_HELLO: 
    DB 'Hello!' ;6
    DB 0H,1H,2H,3H,4H,5H,6H

TAB_TESTING:
    DB 'TEXTING...' ;10

TAB1:
    DB '18B20 NO CONNECT'

TAB2:
    DB 'Waiting......'

TAB3:
    DB 'WENDU: '

DOT:
    DB "."

SIGN:
    DB 00H,'C'

TAB_L:
    DB 'L:'

TAB_H:
    DB 'H:' 
   
TAB_SETING_TEMP_H:
    DB 'SETING_TMP:H '

TAB_SETING_TEMP_L:
    DB 'SETING_TMP:L '

TAB_SAVE:
    DB 'SAVEING...'

TAB_ON:
    DB 'ON '

TAB_OFF:
    DB 'OFF'


END 





