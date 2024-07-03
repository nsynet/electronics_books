//
//    4 ¼ü Ê±ÖÓ³ÌÐò
//
//
#include <msp430x41x.h>
# define  uint unsigned int
# define  uchar unsigned char


uchar time_buffer[3]={17,27,0};

uchar disp_buffer[6]={0};



# define  a 0x10
# define  b 0x20
# define  c 0x40
# define  d 0x80
# define  e 0x1
# define  f 0x2
# define  g 0x4
# define  h 0x8

/////////////////////////////////
//  91 lcd
/////////////////////////////////
const char distab[]={
    0xd7,0x06,0xe3,0xa7,
    0x36,0xb5,0xf5,0x07,
    0xf7,0xb7,
        };



void delay(int x)   // 5*x+12  nop
      {             //128- 23    256-49
      while(x--);   
      }             //192- 36    280- 54   448- 87
      
void time_dis(void)
    {
      LCDMEM[7]=0xa;
      LCDMEM[8]=0x90;
      LCDMEM[9]=0x12;
      LCDMEM[10]=0x80;
      LCDMEM[11]=0x2;
      LCDMEM[12]=0x93;
      LCDMEM[13]=0x72;
      LCDMEM[14]=0x5b;
      LCDMEM[15]=0x94;
    }

void time_change(void)
    {
      LCDMEM[10]=0x1;
      LCDMEM[11]=0x1;
      LCDMEM[12]=0x1;
      LCDMEM[13]=0x1;
    }
    
    
void clrlcd(void)
     {
     uchar i=0;
     for(i=0;i<20;i++)
        LCDMEM[i]=0;
     }


void main(void)
{ 
  char i;
  WDTCTL = WDTPW + WDTHOLD;             // Stop WDT
  LCDCTL = 0XFD;
  BTCTL =  BTFRFQ1;                      // STK LCD freq 
  P5SEL =  0xFC;                         // Common and Rxx all selected
  FLL_CTL0 |= XCAP14PF;                 // Configure load caps

  BTCTL = BTFRFQ1+BT_ADLY_1000;  ;           // ACLK/(256*16)
  IE2 |= BTIE;                              // Enable BT interrupt
  for(i=0;i<20;i++)
      LCDMEM[i] = 0 ;
    P2DIR=0xff;
    P2OUT=0X00;
    P3DIR=0xff;
    P3OUT=0X00;
    P4DIR=0xff;
    P4OUT=0X00;
    P5DIR=0xff;
    P5OUT=0X00;
    P6DIR=0xff;
    P6OUT=0X80;

    P1DIR = 0xc3;
    P1OUT=0X0;
    P1IE=0X3c;
    P1IES=0;
    P1IFG=0;
    clrlcd();
    _EINT();
      LCDMEM[11] = 1 ;
  for(;;)                              
  {
    _BIS_SR(LPM3_bits);                    // CPU off
    _NOP();                             // Required only for C-spy
  }
}

// Timer A0 interrupt service routine
//interrupt[TIMERA0_VECTOR] void Timer_A (void)
#pragma vector=BASICTIMER_VECTOR
__interrupt void basic_timer_ISR(void)
{
  {
    uchar i=0;
    P6OUT = 0X80 ;
    time_buffer[2]++;
    if(time_buffer[2]==60)
       {
       time_buffer[2]=0;
       time_buffer[1]++;
       if(time_buffer[1]==60)
            {
            time_buffer[1]=0;
            time_buffer[0]++;
            if(time_buffer[0]==24)
                 time_buffer[0]=0;            
            }       
       }
      disp_buffer[0]=distab[time_buffer[2]%10];
      disp_buffer[1]=distab[time_buffer[2]/10];
      disp_buffer[2]=distab[time_buffer[1]%10];
      disp_buffer[3]=distab[time_buffer[1]/10];
      disp_buffer[4]=distab[time_buffer[0]%10];
      disp_buffer[5]=distab[time_buffer[0]/10];
      
      for(i=0;i<11;i++)
        LCDMEM[i]=0;
      for(i=0;i<6;i++)
        LCDMEM[i+1]=disp_buffer[i];
      LCDMEM[11] = LCDMEM[11] << 1 ;
      if(LCDMEM[11] == 0 )
          LCDMEM[11] =1 ;
      LCDMEM[3] = LCDMEM[3] + 0X08 ;
      LCDMEM[5] = LCDMEM[5] + 0X08 ;
  }
}

#pragma vector=PORT1_VECTOR
__interrupt void key1(void)
    {
        char i ;
        if((P1IFG&BIT2)==BIT2)
            {
                P6OUT &= ~BIT7 ;
            }
        else if((P1IFG&BIT3)==BIT3)
            {
                P6OUT |= 0X7F;
            }
        else if((P1IFG&BIT4)==BIT4)
            {
                time_buffer[0]++;
                if(time_buffer[0] >=24)
                    time_buffer[0] = 0 ;
            }
        else if((P1IFG&BIT5)==BIT5)
            {
                time_buffer[1]++;
                if(time_buffer[1] >=60)
                    time_buffer[1] = 0 ;
            }
      disp_buffer[0]=distab[time_buffer[2]%10];
      disp_buffer[1]=distab[time_buffer[2]/10];
      disp_buffer[2]=distab[time_buffer[1]%10];
      disp_buffer[3]=distab[time_buffer[1]/10];
      disp_buffer[4]=distab[time_buffer[0]%10];
      disp_buffer[5]=distab[time_buffer[0]/10];
      
      for(i=0;i<11;i++)
        LCDMEM[i]=0;
      for(i=0;i<6;i++)
        LCDMEM[i+1]=disp_buffer[i];
      LCDMEM[3] = LCDMEM[3] + 0X08 ;
      LCDMEM[5] = LCDMEM[5] + 0X08 ;
        P1IFG = 0 ;
    }
