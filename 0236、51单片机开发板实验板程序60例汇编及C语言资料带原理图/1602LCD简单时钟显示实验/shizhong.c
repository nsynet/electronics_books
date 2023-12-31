#include "reg51.h"
#define uchar unsigned char
sbit RW=P3^1;
sbit RS=P3^0;
sbit E=P3^2;
bit at=0;
//sbit busy_bit=P1^7;
uchar code shen[]={"CLOCK!"};
uchar code word[]={0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x3a,0x20};
uchar dispbuf[8],h,m,s,counter;

 

void delay()
{
  uchar i;
 for(i=0;i<255;i++);
}

 

/*******写命令**********/
void lcd_wmc(uchar i)
{

  P0=i;
  RS=0;
  RW=0;
  E=0;
  delay();
  E=1;
}

 

/*******写数据***********/

void lcd_wmd(uchar i)
{

  P0=i;
  RS=1;
  RW=0;
  E=0;
  delay();
  E=1;
}

 


/*******初始化液晶*******/
void lcd_init()
{
  uchar i;
  lcd_wmc(0x01);
  lcd_wmc(0x38);
  lcd_wmc(0x0c);
  lcd_wmc(0x06);
  lcd_wmc(0xc9);
  for(i=0;i<6;i++)
  lcd_wmd(shen[i]);
  lcd_wmc(0xc0);
}

 

 

/*******更新缓冲区子程序*******/
void newbuf()
{
 dispbuf[0]=s%10;
 dispbuf[1]=s/10;
 dispbuf[3]=m%10;
 dispbuf[4]=m/10;
 dispbuf[6]=h%10;
 dispbuf[7]=h/10;
}

 

/*******显示子程序**********/
void disp(uchar dispadd)
{
   uchar tmp;
   lcd_wmc(dispadd);
   tmp=dispbuf[7];
   tmp=word[tmp];
   lcd_wmd(tmp);
   tmp=dispbuf[6];
   tmp=word[tmp];
   lcd_wmd(tmp);
   tmp=dispbuf[5];
   tmp=word[tmp];
   lcd_wmd(tmp);
   tmp=dispbuf[4];
   tmp=word[tmp];
   lcd_wmd(tmp);
   tmp=dispbuf[3];
   tmp=word[tmp];
   lcd_wmd(tmp);
   tmp=dispbuf[2];
   tmp=word[tmp];
   lcd_wmd(tmp);
   tmp=dispbuf[1];
   tmp=word[tmp];
   lcd_wmd(tmp);
   tmp=dispbuf[0];
   tmp=word[tmp];
   lcd_wmd(tmp); 
}

 

 

/*********************键盘子程序***********************/

uchar keypro(void)
{
  uchar scanl,scanh;
  P1=0xf0;//先将所有行线拉低
  if((P1&0xf0)!=0xf0) //如果列线有变化
  {
    delay();//延迟一段时间。
    if((P1&0xf0)!=0xf0)//如果此时此刻列线还有变化，说明确实有按键按下
    {
      scanl=0xfe;用变量保存下第一次发送的扫描码1111,1110
      while((scanl&0x10)!=0)如果四个行线被完整扫描一次还没有完成,就进入循环,继续扫描下一行
      {
        P1=scanl; //给P1口赋扫描码,每次只拉低一行
        if((P1&0xf0)!=0xf0) //如果判断为真,则说明找到了按键按下的行
        {
          scanh=(P1&0xf0)|0x0f; //计算识别码
          return (~scanh)+(~scanl); 返回识别码，识别码是根据上一条语句的算法计算好的，每个识别码对应一个按键，一共有16个识别码。
         }
        else scanl=(scanl<<1)|0x01; //否则依次将第二，第三，第四行拉低 

      }
    } 
  } 
  return 0;//没有按键  按下 返回0
}


/********************时间调整子程序********************/
void adjustime()
{
  uchar k;
  static uchar add;
  k=keypro();
  switch(k)
  {
   case 0x88: if(!at){add=0xc1;EA=0;lcd_wmc(0xc1);lcd_wmc(0x0f);at=1;}
               else {lcd_wmc(0xc0);lcd_wmc(0x0c);at=0;EA=1;} break;

   case 0x48:  if(at)
             {
       if(add==0xc1){add=0xc7; lcd_wmc(add);}
                 else {add=add-3;lcd_wmc(add);}
               }
         break;
  
  case 0x28:  if(at)
             {
               if(add==0xc7) {add=0xc1;lcd_wmc(add);}
                 else {add=add+3;lcd_wmc(add);}
           }
       break;

   case 0x18: if(at)
            {
              if(add==0xc1) h++;
                if(h==24)
          h=0;
                if(add==0xc4) m++;
         if(m==60)
           m=0;
                if(add==0xc7) s++;
          if(s==60)
           s=0;
           newbuf();
      disp(0xc0);
      lcd_wmc(add);
              }
               break;
  default: break;
  }
  if(k!=0)
   {
  while((P1&0xf0)!=0xf0)
  P1=0xf0;
 }

}

 

 

 

/*********************初始化子程序**********************/
void init()
{

  TMOD=0x01;
  TH0=0x4c;
  TL0=0x00;
  EA=1;
  ET0=1;
  TR0=1;
  counter=0;
  h=12;m=0;s=0;
  dispbuf[2]=10;
  dispbuf[5]=10;
}

 

 

 

/***************************主程序************************/

void main(void)
{ 
  init();
  lcd_init();

  while(1)
  {
   adjustime();
   if(!at)
 {
     //闪烁
      if(counter<10)        
      {
       dispbuf[2]=10;
       dispbuf[5]=10;
      }
      else
      {            
       dispbuf[2]=11;
       dispbuf[5]=11;
      }
      //更新显示缓冲区及调用显示程序
      if(counter==0)
      {
       newbuf();
       disp(0xc0);
       }
      else if(counter==10)
      disp(0xc0);  
    }
   }
}

 

 

 


/*************************定时器0的中断**********************/
void Time0() interrupt 1 using 2    //再次强调中断子程序执行时间越短越好
{
  TH0=(65536-46075)/256;
  TL0=(65536-46075)%256;
  counter++;
  if(counter==20)
  {
    s++;
  counter=0;
  if(s==60)
  { 
    m++;
    s=0;
      if(m==60)
    {
      h++;
    m=0;
    if(h==24)
     h=0;
         }
       }

  }
}


