.INCLUDE hardware.inc
.EXTERNAL  _guiLED_Value;
.RAM
.PUBLIC LED_No
.VAR  LED_No = 0;

.IRAM
.DATA
    C_Address: .DW 0x003f,0x0006,0x005b,0x004f, 0x0066,0x006d,0x007c,0x0007,0x007f,0x006f;//'0''1''2''3''4''5''6''7''8''9'�Ĵ���
    C_Dig:     .DW 0x0001,0x0002,0x0008,0x1000,0x2000,0x4000;//ѡ��LED��
.CODE
    
//============================================================================================
//����: F_Show()
//�﷨��void F_Show(int A,int B)
//����������LED
//������A,LED��λ����C_Dig��,B,LED����ʾֵ
//���أ���
//============================================================================================  
.PUBLIC _LED_Show;
.PUBLIC F_LED_Show;
_LED_Show: .PROC
F_LED_Show:
    PUSH r1,r5 TO  [sp];  		    //������ڲ�����������ڲ���
       
L_Loop:       
    bp  = [LED_No] 
    r1  = bp + _guiLED_Value;
    r1 = [r1];
    r2 =  bp + C_Dig;             //ȡLED�ܵ�Ƭѡ��ַ       
    r2  = [r2]   
    r4 =  r1 + C_Address          //ȡ��ʾ���ݵĵ�ַ 
    r4 = [r4]
    R4 = R4 LSL 4;
    R4 = R4 LSL 4;
    cmp bp, 1;
    je  dot;    
 l:  
    r1 = [P_IOA_Buffer]
    r1 &= 0x00ff
    r1 |=  r4   
    [P_IOA_Buffer] = r1;       
    //r1 = [P_IOB_Data]
    //r1 &= 0xfff0
    //r1 |= r2
    [P_IOB_Data] = r2;            //��ʾ����  
    bp = bp + 1
    cmp bp,3;
    je l2;
 l1: [LED_No]  = bp
     POP r1,r5 FROM [sp]
     RETF;
 dot:  r4 |= 0x8000;   
       jmp l
 l2:   bp = 0;
       jmp l1
.ENDP



