#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#include <math.h>
#define uint unsigned int
#define uchar unsigned char
uint x0,x1,x2,x3,x4,x5,x6;
int L,i,j,k,b,p;
uchar w[3];
uint TR,TIs,temp;

void FFT(int dataR[],int dataI[])
{
// 以下是数据掉头功能
for(i=0;i<128;i++)
{ 
//CHANGE();
}
for(i=0;i<128;i++)
{
 dataR[i]=dataI[i]; dataI[i]=0; 
}
// FFT算法
for(L=1;L<=7;L++) 						// 第一层循环
{
b=1; i=L-1;
while(i>0) 
{
b=b*2; i--;
} 
for(j=0;j<=b-1;j++)						 // 第二层循环
{ 
p=1; i=7-L;
while(i>0)					
{p=p*2; i--;}
p=p*j;
for(k=j;k<128;k=k+2*b) 				// 第三层循环
{ 
FFT(dataR,dataI);
}
}
} 
for(i=0;i<32;i++) 							// 32次以下的谐波分析
{
w[i]=sqrt(dataR[i]*dataR[i]+dataI[i]*dataI[i]);
w[i]=w[i]/64;
}
w[0]=w[0]/2;
}  

