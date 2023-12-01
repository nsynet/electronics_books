
//DS18B20的读写程序,数据脚P2.7                     //
//温度传感器18B20汇编程序,采用器件默认的12位转化   //
//最大转化时间750微秒,显示温度-55到+125度,显示精度 //
//为0.1度，显示采用4位LED共阳显示测温值            //
//P0口为段码输入,P34~P37为位选                       //
/***************************************************/

#include "reg51.h"
#include "intrins.h"                            //_nop_();延时函数用
#define  Disdata P0                             //段码输出口
#define  discan  P3                             //扫描口
#define  uchar unsigned char
#define  uint  unsigned int
sbit     DQ=P2^7;                               //温度输入口
sbit     DIN=P0^7;                              //LED小数点控制
uint     h; 
uint     temp;
//
//
//**************温度小数部分用查表法***********//
uchar code ditab[16]=
{0x00,0x01,0x01,0x02,0x03,0x03,0x04,0x04,0x05,0x06,0x06,0x07,0x08,0x08,0x09,0x09};
//
uchar code dis_7[12]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0xff,0xbf};
//共阳LED段码表        "0"  "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9" "不亮" "-"              
uchar code scan_con[4]={0x7f,0xbf,0xdf,0xef};    //列扫描控制字
uchar data temp_data[2]={0x00,0x00};             //读出温度暂放
uchar data display[5]={0x00,0x00,0x00,0x00,0x00};     //显示单元数据，共4个数据和一个运算暂用

//
//
//
/*****************11us延时函数*************************/
//
void delay(uint t)
{
  for (;t>0;t--);
}
//

/****************显示扫描函数***************************/
scan()
{
  char k;
     for(k=0;k<4;k++)                     //4位LED扫描控制
{
  Disdata=dis_7[display[k]];          //数据显示
  if (k==1){DIN=0;}                   //小数点显示
  discan=scan_con[k];                 //位选
  delay(300);
}
}
//
//
/****************DS18B20复位函数************************/
ow_reset(void)
{
char presence=1;
while(presence)
{
  while(presence)
   {
    DQ=1;_nop_();_nop_();//从高拉倒低
DQ=0;                                       
delay(50);           //550 us
DQ=1;                                        
delay(6);            //66 us
presence=DQ;         //presence=0 复位成功,继续下一步
   } 
   delay(45);            //延时500 us
   presence=~DQ;         
}
DQ=1;                   //拉高电平
}
//
//
/****************DS18B20写命令函数************************/
//向1-WIRE 总线上写1个字节
void write_byte(uchar val)
{ 
  uchar i;
  for(i=8;i>0;i--)
  {
   DQ=1;_nop_();_nop_();                  //从高拉倒低
   DQ=0;_nop_();_nop_();_nop_();_nop_();  //5 us
   DQ=val&0x01;                           //最低位移出
   delay(6);                              //66 us
   val=val/2;                             //右移1位
   }
   DQ=1;
   delay(1);
}
//
/****************DS18B20读1字节函数************************/
//从总线上取1个字节
uchar read_byte(void)
{
uchar i;
uchar value=0;
for(i=8;i>0;i--)
{
  DQ=1;_nop_();_nop_();
  value>>=1;
  DQ=0;_nop_();_nop_();_nop_();_nop_();         //4 us
  DQ=1;_nop_();_nop_();_nop_();_nop_();         //4 us
  if(DQ)value|=0x80;
  delay(6);                                     //66 us
}
DQ=1;
return(value);
}
//
/****************读出温度函数************************/
//
read_temp()
{
  ow_reset();                  //总线复位
  delay(200);
  write_byte(0xcc);            //发命令
  write_byte(0x44);            //发转换命令
  ow_reset(); 
  delay(1);
  write_byte(0xcc);            //发命令
  write_byte(0xbe);
  temp_data[0]=read_byte();    //读温度值的第字节
  temp_data[1]=read_byte();    //读温度值的高字节
  temp=temp_data[1];
  temp<<=8;                                               
  temp=temp|temp_data[0];      // 两字节合成一个整型变量。
  return temp;                 //返回温度值
}
//
/****************温度数据处理函数************************/

//二进制高字节的低半字节和低字节的高半字节组成一字节,这个
//字节的二进制转换为十进制后,就是温度值的百、十、个位值,而剩
//下的低字节的低半字节转化成十进制后,就是温度值的小数部分

/********************************************************/
work_temp(uint tem)
{
uchar n=0;
if(tem>6348)                        // 温度值正负判断
     {tem=65536-tem;n=1;}            // 负温度求补码,标志位置1
      display[4]=tem&0x0f;           // 取小数部分的值
  display[0]=ditab[display[4]];  // 存入小数部分显示值
      display[4]=tem>>4;             // 取中间八位,即整数部分的值
  display[3]=display[4]/100;     // 取百位数据暂存
  display[1]=display[4]%100;     // 取后两位数据暂存
  display[2]=display[1]/10;      // 取十位数据暂存
  display[1]=display[1]%10;  
/******************符号位显示判断**************************/
  if(!display[3]) 
  {
    display[3]=0x0a;           //最高位为0时不显示
    if(!display[2])
{
   display[2]=0x0a;        //次高位为0时不显示
}
  }
  if(n){display[3]=0x0b;}      //负温度时最高位显示"-"
}
//
//
/****************主函数************************/
main()
{
  Disdata=0xff;                 //初始化端口
  discan=0xff;
  for(h=0;h<4;h++)              //开机显示"0000"
      {display[h]=0;} 
  ow_reset();                   //开机先转换一次
  write_byte(0xcc);             //Skip ROM
  write_byte(0x44);             //发转换命令
  for(h=0;h<100;h++)            //开机显示"0000"
      {scan();}
  while(1)
  {
work_temp(read_temp());     //处理温度数据
scan();                     //显示温度值
  }
}
//
//***********************结束**************************//
