/******************************************************
*   文件名称：
*            lcd.c
*  文件说明：对点阵lcd的基本操作初始化、移动显示数据的位置、
*           写数据、对指定区域进行清除进行封装
******************************************************/

#include <msp430x44x.h>

/***************************************************
*  write_Command(),用于写命令到LCD，
* CS(片选)在此函数外设置
****************************************************/
void write_Command(char cmd)
{
     //P1OUT &= ~0x40;                //禁止 EN

     P3DIR =  0xff;
     P3OUT  = cmd;
     P1OUT &= ~0x30;             //rs=0 ,r/w=0
     P6OUT |= 0x40;
     P6OUT &= ~0x40;
     P1OUT |= 0x40;              //使能
     P1OUT &= ~0x40;             //禁止

}
/***************************************************
* 设置显示的位置,片选在函数外部设置
****************************************************/
void move_To(char x,char y)
{
     unsigned char tmp;
     tmp=(y&0x7f);
     if(tmp<64)                       //如果位置在Chip1
     {
        P2OUT &= ~0x80 ;         //cs2=0
        P6OUT |= 0x10;           //cs1=1

     

        write_Command(0xb8 + x);      //设置 x
        write_Command(0x40 + tmp);    //设置 y
     }else if(tmp>63)                 //在 chip2
     {
        P2OUT |= 0x80 ;          //cs2=1
        P6OUT &= ~0x10;          //cs1=0

   

        write_Command(0xb8 + x);      //设置 x
        write_Command(0x40 + tmp-64); //设置 y
     }

}
/***************************************************
* write data
****************************************************/
void write_Data(char content)
{
     P3DIR =  0x00;             // 置位输入模式
    P2OUT |= 0x02;             // r/w=1 读状态
     P2OUT |= 0x04;             // chip 使能
     while((P3IN & 0x80)==0x80);//检测LCD是否忙
     P1OUT &= ~0x20;         //r/w=0;
    

     P1OUT &= ~0x40;             //禁止 EN
     P3DIR =  0xff;
     P1OUT &= ~0x30;             //rs=0 ,r/w=0
     P1OUT |= 0x10;             //rs=1,data
     P3OUT  = content;

  
     P6OUT |= 0x40;
     
     P6OUT &= ~0x40;
    


     P1OUT |= 0x40;              //使能
    
     P1OUT &= ~0x40;             //禁止
}


/****************************************************
*   清除chip1或者chip2上的某一区域，选择的区域只是在
*   同一chip上,x是页地址,Y是列地址,h是多少行,w是指多少
*   列.区域可以是两个片组成的区域的任何位置
*****************************************************/
void clear_Rect(unsigned char x,unsigned char y,unsigned char h,unsigned char w)
{
     unsigned char tmpv,tmp;

        for(tmpv=x;tmpv<(x+h);tmpv++)
        {
           for(tmp=y;tmp<(y+w);tmp++)
           {
             move_To(tmpv,tmp);//移动
             write_Data(0x00); //在当前位置写0，即清除当前位置的显示内容
            }
        }
}
/*****************************************************
*  初始化LCD
******************************************************/
void init_LCD()
{
     P3DIR  = 0xff;           // 设置P3输出模式
     P3OUT  = 0x00;           // 初始值为0
     P1DIR |= 0x70;           // P1.4,P1.5,P1.6置为输出模式
     P1OUT &= ~0x70;
     P2DIR |= 0xC0;
     P2OUT &= ~0xC0;          //reset=0,cs2=0
     P6DIR |= 0x50;
     P6OUT &= ~0x50;
     P2OUT |= 0x80 ;          //cs2=1
     P6OUT |= 0x10;           //cs1=1

     P1OUT |= 0x40;           // en=1
     P2OUT |= 0x40;           //reset=1
     write_Command(0xc0);     //
     write_Command(0x3f);     //显示开

     clear_Rect(0,0,8,64);    //清除第一块
     clear_Rect(0,64,8,64);   //清除第二块

}
/***************************************************/
