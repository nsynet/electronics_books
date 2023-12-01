#include <AT89X51.H>
#include <intrins.h>
#define Key_UP            P1_0 
#define Key_DOWN          P1_1   
#define Key_SET           P1_2   
#define RelayOutPort      P2_0  
#define LEDPort           P0      
#define DELPort           P2_1   
#define LEDTwoC           P3_6    
#define LEDThreeC         P3_7    
#define TMPort			  P2_7
#define INBUF_LEN 5 //���ݳ���
unsigned char inbuf1[INBUF_LEN]={'0','0','0','0','0'};//���ͻ�����
unsigned char inbuf2[50];//���ջ�����
unsigned char count3;
void init_serialcomm( void )
{
SCON = 0x50 ; //SCON: serail mode 1, 8-bit UART, enable ucvr
TMOD |= 0x20 ; //TMOD: timer 1, mode 2, 8-bit reload
PCON |= 0x80 ; //SMOD=1;
TH1 = 0xFA ; //Baud:4800 fosc=11.0592MHz
IE |= 0x90 ; //Enable Serial Interrupt
TR1 = 1 ; // timer 1 run
}
//�򴮿ڷ���һ���ַ�
void send_char_com( unsigned char ch)
{
SBUF=ch;
while (TI== 0 );
TI= 0 ;
}
//�򴮿ڷ���һ���ַ�����strlen Ϊ���ַ�������
void send_string_com( unsigned char *str, unsigned int strlen)
{
unsigned int k= 0 ;
do
{
send_char_com(*(str + k));
k++;
} while (k < strlen);
}
//���ڽ����жϺ���
void serial () interrupt 4 using 3
{
if (RI) //RI==��ʼ����
{
unsigned char ch;
RI = 0 ; //���RI=0
ch=SBUF;
if (ch> 1 )
{
count3= 0 ;
inbuf2[count3]=ch;
}
else
{
count3++;
inbuf2[count3]=ch;
}
}
}	

unsigned char code LEDDis[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90,0xFF,0xBF}; //0-9��LED�ʻ�,0xFFΪ��,0xF7Ϊ����
unsigned char dis_8[12]={'0','1','2','3','4','5','6','7','8','9',' ','-'};
static unsigned char bdata StateREG;	//��λѰַ��״̬�Ĵ���
sbit DS1820ON = StateREG^0;	          //DS1820�Ƿ����
sbit SetTF = StateREG^1;              //�Ƿ������¶�����״̬
sbit KeySETDown = StateREG^2;         //�Ƿ��Ѱ���SET����ʶ
sbit PowTF = StateREG^3;              //��Դ��Դ��ʶ
sbit KeyTF = StateREG^4;							//�����Ƿ�����

//sbit KeySETDowning = StateREG^5;			//SET�Ƿ����ڰ���
static unsigned char bdata TLV _at_ 0x0029;         //�¶ȱ����ߵ�λ
static unsigned char bdata THV _at_ 0x0028;
static signed char TMV;       //ת������¶�ֵ
static unsigned char KeyV,TempKeyV;      //��ֵ
static unsigned char Second;
static unsigned char flag;
static signed char TMRomV _at_ 0x0027;    //��������
static signed char TMSetV _at_ 0x0026;    //�¶��趨ֵ
static unsigned char KSDNum;    //SET������ʱ�Ĳɼ�����
static unsigned char IntNum,IntNum2,IntNum3;    //�жϷ���������IntNum����SET������⣬IntNum2�����趨״̬ʱLED��˸
static signed char LED_One,LED_Two,LED_Three;  //LED����ʾλ LED_OneΪʮλ��LED_TwoΪ��λ
static unsigned char Sign; //���ű�ʶ

void main(void)
{

	void InitDS1820(void);   //���庯��
	void ROMDS1820(void);
	void TMVDS1820(void);
	void TMRDS1820(void);
	void TMWDS1820(void);
	void TMREDS1820(void);
	void TMERDS1820(void);
	void ReadDS1820(void);
	void WriteDS1820(void);
	void Delay_510(void);
	void Delay_110(void);
	void Delay_10ms(void);
	void Delay_4s(void);
	void V2ToV(void);
	
	 DELPort=1;
	StateREG = 0;   //��ʼ������
	SetTF = 0;	
	PowTF = 0;			//�ص�Դ
	THV = 0;
	TLV = 0;
	TMV = 0;
	KeyV = 0;
	TempKeyV = 0;
	KSDNum = 0;
	IntNum = 0;
	IntNum2 = 0;
	IntNum3 = 0;
	LED_One = 0;
	LED_Two	= 0;

	InitDS1820(); //��ʼ��
	ROMDS1820(); 	//����ROM
	TMERDS1820();  //E2PRAM���¶�����ֵ����RAM
	InitDS1820(); //��ʼ��
	ROMDS1820(); 	//����ROM
	TMRDS1820(); 	//�����¶�ָ��
	ReadDS1820(); //�����¶�ֵ������ֵ
	TMSetV = TMRomV;  //����������DS18B20ROM�������ֵ��TMSetV

	EA = 1;					//����CPU�ж�
	ET0 = 1; 				//��ʱ��0�жϴ�
	TMOD = 0x1;			//�趨ʱ��0Ϊģʽ1��16λģʽ
	TH0=0xB1;
	TL0=0xDF;				//�趨ʱֵΪ20000us��20ms��
	TR0 = 1;
	
	while(1){				//��ʼ��ʱ

	

	 


if (flag==0){
if (Second==1){
			Delay_4s();
			Delay_4s();
			Delay_4s();
			Delay_4s();
			Delay_4s();
			Delay_4s();
			
		  DELPort=0; 
		  Second=0;
		  }
		   }
		 }
	
	
}

//��ʱ��0�ж������м�ɨ�����ʾ
void KeyAndDis_Time0(void) interrupt 1 using 2
{
  TH0=0xB1;
	TL0=0xDF;				//�趨ʱֵΪ20000us��20ms)

	LEDPort = 0xFF;
	
   
	   if (inbuf2[0]==0x33){
	   send_char_com('O');
	   send_char_com('O');
	   send_char_com('O');
	   SetTF = 1;
//send_string_com(inbuf2,1);
//BEEP=0;
//RELAY=0;
send_char_com('O');
     //inbuf2[0]=0x00;
	 inbuf2[0]=0x00;
} 

if (inbuf2[0]==0x36){

//send_string_com(inbuf2,1);
//BEEP=1;
send_char_com('N');
send_char_com('N');
send_char_com('N');
SetTF = 0;

inbuf2[0]=0x00;

} 

if (inbuf2[0]==0x34){
	   KeyV=2;
//send_string_com(inbuf2,1);
//BEEP=0;
//RELAY=0;
  TMSetV = TMSetV - 1;
    inbuf2[0]=0x00;
} 

if (inbuf2[0]==0x35){

//send_string_com(inbuf2,1);
//BEEP=1;
//RELAY=1;
 TMSetV = TMSetV + 1;    //�ϵ��¶�
 inbuf2[0]=0x00;
} 

if (inbuf2[0]==0x74){
	 KeyV=2;
//send_string_com(inbuf2,1);
//BEEP=1;
//RELAY=1;
} 

if (inbuf2[0]==0x90){
	 KeyV=1;
//send_string_com(inbuf2,1);
//BEEP=1;
//RELAY=1;
} 


  if (!Key_UP)
    KeyV = 1;
  if (!Key_DOWN)
    KeyV = 2;
  if (!Key_SET)
    KeyV = 3;
	//KeySETDowning = 0;  //���
  if (KeyV != 0)      //�м�����
    {
      Delay_10ms();   //��ʱ����  ����10ms�ٲ�
      if (!Key_UP)
        TempKeyV = 1;
      if (!Key_DOWN)
        TempKeyV = 2;
      if (!Key_SET)
        TempKeyV = 3;
      if (KeyV == TempKeyV)   //����ֵ���Ϊȷ�������˼�
        {
          if (KeyV == 3)      //����SET��������SET״̬���˳����������
            {
							//KeySETDowning = 1; //����SET���ڰ���
							
			
              PowTF = 0;      //��Դ��ʶ��
							if (!KeyTF)
              	if (SetTF){
				send_char_com('N');
send_char_com('N');
send_char_com('N');
                		SetTF = 0;    //��ʶλ��ʶ�˳��趨
						
										InitDS1820(); //��ʼ��
  									ROMDS1820(); 	//����ROM
  									TMWDS1820(); 	//д�¶�����ָ��
										WriteDS1820(); 	//д�¶����޵�DS18B20ROM
										WriteDS1820(); 	//д�¶����޵�DS18B20ROM
										WriteDS1820(); 	//д�¶����޵�DS18B20ROM
										InitDS1820(); //��ʼ��
  									ROMDS1820(); 	//����ROM
  									TMREDS1820(); 	//�¶�����ֵCOPY��E2PRAM
									}
              	else {
				send_char_com('O');
	   send_char_com('O');
	   send_char_com('O');
                	SetTF = 1;}
					 
				   
              if (!KeySETDown) //û�е�һ�ΰ���SETʱ��KeySETDown��ʶ��1
                KeySETDown = 1;
              else
                KSDNum = KSDNum + 1;  //ǰһ�����а���SET��ʼ����
            }
          if (SetTF)  //��SET״̬��
            {
			 
              if ((KeyV == 1) && (!KeyTF))
                TMSetV = TMSetV + 1;    //�ϵ��¶�
              if ((KeyV == 2) && (!KeyTF))
                TMSetV = TMSetV - 1;    //�µ��¶�
              if (TMSetV <= 20)          //�����¶�������
                TMSetV = 20;
              if (TMSetV >= 75)
                TMSetV = 75;
            }
		if ((!KeyTF) && (IntNum3 == 0)) KeyTF = 1; //�����̴��ڿ���ʱ������
        }

     
    }
  KeyV = 0;
  TempKeyV = 0;   //��ձ���׼���´μ�ɨ��

  if (!PowTF)
    {
      InitDS1820();	//��ʼ��
      ROMDS1820(); 	//����ROM
      TMVDS1820();  //�¶�ת��ָ��

      Delay_510();
      Delay_510();  //��ʱ�ȴ�ת�����

      InitDS1820(); //��ʼ��
      ROMDS1820(); 	//����ROM
      TMRDS1820(); 	//�����¶�ָ��
      ReadDS1820(); //�����¶�ֵ

      V2ToV();        //ת����ʾֵ
      if (TMV > TMSetV)   //���ݲɼ������¶�ֵ���Ƽ̵���
        {
          RelayOutPort = 0;
		  flag=0;
		  }
      else
		    {
          RelayOutPort = 1;
		  DELPort=1; 
		  Second=1;
		  flag=1;

		
  		  }

      if (SetTF) IntNum2 = IntNum2 + 1; //������˸����
      if (IntNum2 > 50 ) IntNum2 = 0;
			if (KeyTF) IntNum3 = IntNum3 + 1; //���ڷ�ֹ��������
			if (IntNum3 > 25) 
				{
					IntNum3 = 0;
					KeyTF = 0;
				}

      if ((SetTF) && (IntNum2 < 25)) goto InitEnd;  //�����ں���ʱ��ʾ
         
	  LEDPort = LED_Two;
      LEDTwoC = 0;
      Delay_510();
      LEDTwoC = 1;    //��ʾʮλ��
      LEDPort = LED_Three;
      LEDThreeC = 0;
      Delay_510();
      LEDThreeC = 1;    //��ʾ��λ��
    }
InitEnd:;
}

void V2ToV(void)	//��ֵת��
{
  TLV = TLV >> 4;			
  THV = THV << 4;			//�����ĸߵ�λ��ֵ��λ
  TMV = TLV | THV;		//�ϲ��ߵ�λ����TMΪʵ���¶�ֵ
	Sign = 0;
  if (SetTF || !Key_SET)
    Sign = TMSetV >> 7;          //ȡ����
  else
     Sign = TMV >> 7;

	if (Sign)
		{
  		if (SetTF || !Key_SET)
				{
    			LED_One = (~(TMSetV-1)) / 100;          //SET״̬����ʾ�趨ֵ
    			LED_Two = ((~(TMSetV-1)) - LED_One * 100)/10;
			    LED_Three = (~(TMSetV-1)) - LED_One * 100 - LED_Two * 10;
				inbuf1[0]=dis_8[LED_Two];
  inbuf1[1]=dis_8[LED_Three];
  //inbuf1[2]=dis_8[ LED_Three];
  inbuf1[2]=0x0d;
  inbuf1[3]=0x0a;
				}
  		else
				{
    			LED_One = (~(TMV-1)) / 100;							//ת����λֵ		
    			LED_Two = ((~(TMV-1)) - LED_One * 100)/10;
			    LED_Three = (~(TMV-1)) - LED_One * 100 - LED_Two * 10;
					inbuf1[0]=dis_8[LED_Two];
  inbuf1[1]=dis_8[LED_Three];
 inbuf1[2]=dis_8[0];
  inbuf1[3]=0x0d;
  inbuf1[4]=0x0a;
				}
		}
	else
		{ 
  		if (SetTF || !Key_SET)
				{
    			LED_One = (TMSetV) / 100;          //SET״̬����ʾ�趨ֵ
    			LED_Two = (TMSetV - LED_One * 100)/10;
			    LED_Three = TMSetV - LED_One * 100 - LED_Two * 10;
					inbuf1[0]=dis_8[LED_Two];
  inbuf1[1]=dis_8[LED_Three];
 inbuf1[2]=dis_8[0];
  inbuf1[3]=0x0d;
  inbuf1[4]=0x0a;
				}
  		else
				{
    			LED_One = (TMV) / 100;							//ת����λֵ		
    			LED_Two = (TMV - LED_One * 100)/10;
			    LED_Three = TMV - LED_One * 100 - LED_Two * 10;
					inbuf1[0]=dis_8[LED_Two];
  inbuf1[1]=dis_8[LED_Three];
 inbuf1[2]=dis_8[0];
  inbuf1[3]=0x0d;
  inbuf1[4]=0x0a;
				}
		}

   init_serialcomm(); //��ʼ������

//while ( 1 )
//{
send_string_com(inbuf1,INBUF_LEN);

 //תLED�ֶ�	
	if (LED_One) //������ʱʮλ�Ĵ���
		LED_Two = LEDDis[LED_Two];		
	else
		{
			if (LED_Two == 0)
				LED_Two = LEDDis[10];
			else
				LED_Two = LEDDis[LED_Two];
		}
	if (Sign)
		LED_One = LEDDis[11];
	else
		{
			if (LED_One == 0)
				LED_One = LEDDis[10];
			else
				LED_One = LEDDis[LED_One];
		}
	LED_Three = LEDDis[LED_Three];
}

void InitDS1820(void)		//��ʼ��DS1820
{
	TMPort = 1;		//����TMPort
	_nop_();      //����һ������
	TMPort = 0;		//����TMPort
  Delay_510();  //��ʱ  DS1820��λʱ��Ҫ500us�ĵ͵�ƽ
  TMPort = 1;   //����TMPort
	_nop_();      //����  
	_nop_();
	_nop_();

  Delay_110();  //��ʱ110us �ȴ�DS1820��Ӧ
  if (!TMPort)  //��Ӧ�ź�Ϊ�͵�ƽ
    DS1820ON = 1;
  else
    DS1820ON = 0;
  Delay_110();  //��ʱ
  Delay_110();
  TMPort = 1;   //����TMPort
}

void ROMDS1820(void)  //����ROMƥ��
{
#pragma asm
  MOV A,#0CCH
  MOV R2,#8
  CLR C
  WR1:
  CLR P2_7
  MOV R3,#6
  DJNZ R3,$
  RRC A
  MOV P2_7,C
  MOV R3,#23
  DJNZ R3,$
  SETB P2_7
  NOP
  DJNZ R2,WR1
  SETB P2_7
#pragma endasm
}

void TMVDS1820(void)  //�¶�ת��ָ��
{
#pragma asm
  MOV A,#44H
  MOV R2,#8
  CLR C
  WR2:
  CLR P2_7
  MOV R3,#6
  DJNZ R3,$
  RRC A
  MOV P2_7,C
  MOV R3,#23
  DJNZ R3,$
  SETB P2_7
  NOP
  DJNZ R2,WR2
  SETB P2_7
#pragma endasm
}

void TMRDS1820(void)  //�����¶�ָ��
{
#pragma asm
  MOV A,#0BEH
  MOV R2,#8
  CLR C
  WR3:
  CLR P2_7
  MOV R3,#6
  DJNZ R3,$
  RRC A
  MOV P2_7,C
  MOV R3,#23
  DJNZ R3,$
  SETB P2_7
  NOP
  DJNZ R2,WR3
  SETB P2_7
#pragma endasm
}

void TMWDS1820(void)  //д���¶�����ָ��
{
#pragma asm
  MOV A,#04EH
  MOV R2,#8
  CLR C
  WR13:
  CLR P2_7
  MOV R3,#6
  DJNZ R3,$
  RRC A
  MOV P2_7,C
  MOV R3,#23
  DJNZ R3,$
  SETB P2_7
  NOP
  DJNZ R2,WR13
  SETB P2_7
#pragma endasm
}

void TMREDS1820(void)		//COPY RAM to E2PRAM
{
#pragma asm
  MOV A,#48H
  MOV R2,#8
  CLR C
  WR33:
  CLR P2_7
  MOV R3,#6
  DJNZ R3,$
  RRC A
  MOV P2_7,C
  MOV R3,#23
  DJNZ R3,$
  SETB P2_7
  NOP
  DJNZ R2,WR33
  SETB P2_7
#pragma endasm
}

void TMERDS1820(void)		//COPY E2PRAM to RAM
{
#pragma asm
  MOV A,#0B8H
  MOV R2,#8
  CLR C
  WR43:
  CLR P2_7
  MOV R3,#6
  DJNZ R3,$
  RRC A
  MOV P2_7,C
  MOV R3,#23
  DJNZ R3,$
  SETB P2_7
  NOP
  DJNZ R2,WR43
  SETB P2_7
#pragma endasm
}

void WriteDS1820(void)	//д���¶�����ֵ
{
#pragma asm
	MOV A,26H					//����4EHдROMָ������������ֽڷֱ�Ϊ������
  MOV R2,#8
  CLR C
  WR23:
  CLR P2_7
  MOV R3,#6
  DJNZ R3,$
  RRC A
  MOV P2_7,C
  MOV R3,#23
  DJNZ R3,$
  SETB P2_7
  NOP
  DJNZ R2,WR23
  SETB P2_7       
#pragma endasm
}

void ReadDS1820(void) //�����¶�ֵ
{
#pragma asm
  MOV R4,#3 ; ���¶ȸ�λ�͵�λ����������λ��DS18B20�ж���
  MOV R1,#29H ; ��λ����29H(TEMPER_L),��λ����28H(TEMPER_H)����������λ����27H(TMRomV)
  RE00:
  MOV R2,#8
  RE01:
  CLR C
  SETB P2_7
  NOP
  NOP
  CLR P2_7
  NOP
  NOP
  NOP
  SETB P2_7
  MOV R3,#09
  RE10: 
  DJNZ R3,RE10
  MOV C,P2_7
  MOV R3,#23
  RE20: 
  DJNZ R3,RE20
  RRC A
  DJNZ R2,RE01
  MOV @R1,A
  DEC R1
  DJNZ R4,RE00
#pragma endasm
}

void Delay_510(void)	//��ʱ510΢��
{
#pragma asm
	MOV R0,#7DH
	MOV R1,#02H
	TSR1:
	DJNZ R0,TSR1
	MOV R0,#7DH
	DJNZ R1,TSR1
#pragma endasm
}

void Delay_110(void)	//��ʱ110΢��
{
#pragma asm
	MOV R0,#19H
	MOV R1,#02H
	TSR2:
	DJNZ R0,TSR2
	MOV R0,#19H
	DJNZ R1,TSR2
#pragma endasm
}

void Delay_10ms(void)	//��ʱ10ms
{
#pragma asm
	MOV R0,#19H
	MOV R1,#0C8H
	TSR3:
	DJNZ R0,TSR3
	MOV R0,#19H
	DJNZ R1,TSR3
#pragma endasm
}

void Delay_4s(void)	//��ʱ4s
{
#pragma asm
  MOV R2,#28H
  TSR5:
	MOV R0,#0FAH
	MOV R1,#0C8H
	TSR4:
	DJNZ R0,TSR4
	MOV R0,#0FAH
	DJNZ R1,TSR4
  DJNZ R2,TSR5
#pragma endasm
}
