

#include < reg51.h >
#include < intrins.h >

#define uchar unsigned char
#define uint  unsigned int

sbit DQ = P2^7 ;  //����DS18B20�˿�DQ  
sbit BEEP=P2^1  ; //������������

bit presence  ;

sbit LCD_RS = P3^0 ;             
sbit LCD_RW = P3^1 ;
sbit LCD_EN = P3^2 ;

uchar code  cdis1[ ] = {" WWW.RICHMCU.COM "} ;
uchar code  cdis2[ ] = {" WENDU:    .  C "} ;
uchar code  cdis3[ ] = {" DS18B20  ERR0R "} ;
uchar code  cdis4[ ] = {"  PLEASE CHECK  "} ;

unsigned char data  temp_data[2] = {0x00,0x00} ;
unsigned char data  display[5] =   {0x00,0x00,0x00,0x00,0x00} ;
unsigned char code  ditab[16] =    {0x00,0x01,0x01,0x02,0x03,0x03,0x04,0x04,
                                                        0x05,0x06,0x06,0x07,0x08,0x08,0x09,0x09} ;
void beep() ; 
unsigned char code  mytab[8] = {0x0C,0x12,0x12,0x0C,0x00,0x00,0x00,0x00} ;

#define delayNOP() ; {_nop_() ;_nop_() ;_nop_() ;_nop_() ;} ;

/*******************************************************************/
void delay1(int ms)
{
 unsigned char y ;
  while(ms--)
 {
  for(y = 0 ; y<250 ; y++)
  {
   _nop_() ;
   _nop_() ;
   _nop_() ;
   _nop_() ;
  }
 }
}

/******************************************************************/
/*���LCDæ״̬                                                   */
/*lcd_busyΪ1ʱ��æ���ȴ���lcd-busyΪ0ʱ,�У���дָ�������ݡ�   */
/******************************************************************/ 
bit lcd_busy()
 {                          
    bit result ;
    LCD_RS = 0 ;
    LCD_RW = 1 ;
    LCD_EN = 1 ;
    delayNOP() ;
    result = (bit)(P0&0x80) ;
    LCD_EN = 0 ;
    return(result) ; 
 }

/*дָ�����ݵ�LCD                                                  */
/*RS=L��RW=L��E=�����壬D0-D7=ָ���롣          */
/*******************************************************************/
void lcd_wcmd(uchar cmd)
{                          
   while(lcd_busy()) ;
    LCD_RS = 0 ;
    LCD_RW = 0 ;
    LCD_EN = 0 ;
    _nop_() ;
    _nop_() ; 
    P0 = cmd ;
    delayNOP() ;
    LCD_EN = 1 ;
    delayNOP() ;
    LCD_EN = 0 ;  
}

/*******************************************************************/
/*д��ʾ���ݵ�LCD                            */
/*RS=H��RW=L��E=�����壬D0-D7=���ݡ�       */
/*******************************************************************/
void lcd_wdat(uchar dat)
{                          
   while(lcd_busy()) ;
    LCD_RS = 1 ;
    LCD_RW = 0 ;
    LCD_EN = 0 ;
    P0 = dat ;
    delayNOP() ;
    LCD_EN = 1 ;
    delayNOP() ;
    LCD_EN = 0 ; 
}


/*  LCD��ʼ���趨                                                  */
/*******************************************************************/
void lcd_init()
{ 
    delay1(15) ;   
    lcd_wcmd(0x01) ;      //���LCD����ʾ����            
    lcd_wcmd(0x38) ;      //16*2��ʾ��5*7����8λ����
    delay1(5) ;
    lcd_wcmd(0x38) ;         
    delay1(5) ;
    lcd_wcmd(0x38) ;         
    delay1(5) ;

    lcd_wcmd(0x0c) ;      //��ʾ�����ع��
    delay1(5) ;
    lcd_wcmd(0x06) ;      //�ƶ����
    delay1(5) ;
    lcd_wcmd(0x01) ;      //���LCD����ʾ����
    delay1(5) ;
}

/*  �趨��ʾλ��                                    */
/*******************************************************************/
void lcd_pos(uchar pos)
{                          
  lcd_wcmd(pos | 0x80) ;  //����ָ��=80+��ַ����
}

/*�Զ����ַ�д��CGRAM                                   */
/*******************************************************************/
void  writetab()  
{  
    unsigned char i ;
    lcd_wcmd(0x40) ;            //дCGRAM
    for (i = 0 ; i< 8 ; i++)       
    lcd_wdat(mytab[ i ]) ;        
}

/*us����ʱ����                                        */
/*******************************************************************/

void Delay(unsigned int num)
{
  while( --num ) ;
}

/*��ʼ��ds1820                                      */
/*******************************************************************/
Init_DS18B20(void)
{  
     DQ = 1 ;      //DQ��λ
     Delay(8) ;    //������ʱ

     DQ = 0 ;      //��Ƭ����DQ����
     Delay(90) ;   //��ȷ��ʱ ���� 480us

     DQ = 1 ;       //��������
     Delay(8) ;

     presence = DQ ;    //���=0���ʼ���ɹ� =1���ʼ��ʧ��
     Delay(100) ;
     DQ = 1 ; 
     
     return(presence) ; //�����źţ�0=presence,1= no presence
}


/* ��һ���ֽ�                     */
/*******************************************************************/
 ReadOneChar(void)
{
unsigned char i = 0 ;
unsigned char dat = 0 ;

for (i = 8 ; i > 0 ; i--)
  {
    DQ = 0 ; // �������ź�
    dat >>= 1 ;
    DQ = 1 ; // �������ź�

    if(DQ)
     dat |= 0x80 ;
    Delay(4) ;
  }

    return (dat) ;
}

/* дһ���ֽ�                                         */
/*******************************************************************/
 WriteOneChar(unsigned char dat)
{
  unsigned char i = 0 ;
  for (i = 8 ; i > 0 ; i--)
  {
    DQ = 0 ;
    DQ = dat&0x01 ;
    Delay(5) ;

    DQ = 1 ;
    dat>>=1 ;
  }
}

/* ��ȡ�¶�                            */
/*******************************************************************/
 Read_Temperature(void)
{
     Init_DS18B20() ;
  
     WriteOneChar(0xCC) ;  // ����������кŵĲ���
     WriteOneChar(0x44) ;  // �����¶�ת��

     Init_DS18B20() ;
     WriteOneChar(0xCC) ;  //����������кŵĲ���
     WriteOneChar(0xBE) ;  //��ȡ�¶ȼĴ���

     temp_data[0] = ReadOneChar() ;   //�¶ȵ�8λ
     temp_data[1] = ReadOneChar() ;   //�¶ȸ�8λ 
}

/* ����ת�����¶���ʾ                                              */
/*******************************************************************/
 Disp_Temperature()
{
  display[4]=temp_data[0]&0x0f ;
  display[0]=ditab[display[4]]+0x30 ;     //����С��λ��ֵ
  
  display[4]=((temp_data[0]&0xf0)>>4)|((temp_data[1]&0x0f)<<4) ;
  display[3]=display[4]/100+0x30 ;
  display[1]=display[4]%100 ;
  display[2]=display[1]/10+0x30 ;
  display[1]=display[1]%10+0x30 ;

    if(display[3]==0x30)        //��λΪ0������ʾ
   { 
     display[3]=0x20 ;              
     if(display[2]==0x30)      //�θ�λΪ0������ʾ
     display[2]=0x20 ;
   }

     lcd_pos(0x48) ;             
     lcd_wdat(display[3]) ;        //��λ����ʾ 
     lcd_pos(0x49) ;             
     lcd_wdat(display[2]) ;        //ʮλ����ʾ 
  lcd_pos(0x4a) ;             
     lcd_wdat(display[1]) ;        //��λ����ʾ 
  lcd_pos(0x4c) ;             
     lcd_wdat(display[0]) ;        //С��λ����ʾ 
}  

/*******************************************************************/
/* ��������һ��                 */
/*******************************************************************/
void beep()
  {
    unsigned char y ;
    for (y=0 ;y<100 ;y++)
    {
      Delay(60) ;
      BEEP=!BEEP ;                //BEEPȡ��
    } 
    BEEP=1 ;                      //�رշ�����
 Delay(40000) ;
  }

/* DS18B20 OK ��ʾ�˵�                                             */
/*******************************************************************/
void  Ok_Menu ()
{ 
    uchar  m ;
    lcd_init() ;                //��ʼ��LCD 
            
    lcd_pos(0) ;                //������ʾλ��Ϊ��һ�еĵ�1���ַ�
     m = 0 ;
    while(cdis1[m] != '\0')
     {                         //��ʾ�ַ�
       lcd_wdat(cdis1[m]) ;
       m++ ;
     }

    lcd_pos(0x40) ;             //������ʾλ��Ϊ�ڶ��е�1���ַ�
     m = 0 ;
    while(cdis2[m] != '\0')
     {
       lcd_wdat(cdis2[m]) ;      //��ʾ�ַ�
       m++ ;
     }

     writetab() ;               //�Զ����ַ�д��CGRAM
     delay1(5) ;
     lcd_pos(0x4d) ;
     lcd_wdat(0x00) ;          //��ʾ�Զ����ַ�
}


/* DS18B20 ERROR ��ʾ�˵�                             */
/*******************************************************************/
void  Error_Menu ()
{
     uchar  m ;
     lcd_init() ;                //��ʼ��LCD 
 
    lcd_pos(0) ;                //������ʾλ��Ϊ��һ�еĵ�1���ַ�
     m = 0 ;
     while(cdis3[m] != '\0')
     {                         //��ʾ�ַ�
       lcd_wdat(cdis3[m]) ;
       m++ ;
     }

     lcd_pos(0x40) ;             //������ʾλ��Ϊ�ڶ��е�1���ַ�
     m = 0 ;
     while(cdis4[m] != '\0')
     {
       lcd_wdat(cdis4[m]) ;      //��ʾ�ַ�
       m++ ;
     }
}


/* ������     */
/************************************/
void main()
 {
     Ok_Menu () ;

 do
  {
      Read_Temperature() ;
   Disp_Temperature() ;
     }
    while(!presence)  ;

     Error_Menu () ;

 do
  {  
    Init_DS18B20() ;
    beep() ;
     }
 while(presence) ;
}

