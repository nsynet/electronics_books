.define		P_IOB_Data  	0x7005;
.define		P_IOB_Dir  	0x7007;
.define		P_IOB_Attrib		0x7008;
.define		P_INT_CTRL		0x7010;
.define		P_INT_CLEAR		0x7011;
.define		P_Feedback		0x7009;
.define		P_DAC_Ctrl		0x702A 
.define		P_DAC1			0x7017
.define		P_DAC2			0x7016
.define     P_System_Clock  0x7013
.define P_TimerA_Ctrl  0x700b
.define P_TimerA_Data 0x700a

.external _main
.external _pp
.external _Mk_Z,_Mk_F;
.external _V_GA
.external _Bianxing
.external _Bianxing1
.external _sanju
.external  _Mk_Z1,_Mk_F1,_Mk_Z2,_Mk_F2,_Mk_Z3,_Mk_F3,_Mk_Z4,_Mk_F4,_Mk_Z5,_Mk_F5;
.iram
.var R_SUM,V_FuDu=0,T_PinLv=1;
.data 
DB_Up: 
.dw 0x8000,0x80a3,0x8146,0x81e9,0x828c,0x832f,0x83d2,0x8475,0x8518,0x85bb; 
.dw 0x865e,0x8701,0x87a4,0x8847,0x88ea,0x898d,0x8a30,0x8ad3,0x8b76,0x8c19;
.dw 0x8cbc,0x8d5f,0x8e02,0x8ea5,0x8f48,0x8feb,0x908e,0x9131,0x91d4,0x9277;
.dw 0x931a,0x93bd,0x9460,0x9503,0x95a6,0x9649,0x9bec,0x978f,0x9832,0x98d5;
.dw 0x9978,0x9a1b,0x9abe,0x9b61,0x9c04,0x9ca7,0x9d4a,0x9ded,0x9e90,0x9f33;
.dw 0x9fd6,0xa079,0xa11c,0xa1bf,0xa262,0xa305,0xa3a8,0xa44b,0xa4ee,0xa591;
.dw 0xa634,0xa6d7,0xa77a,0xa81d,0xa8c0,0xa963,0xaa06,0xaaa9,0xab4c,0xabef;
.dw 0xac92,0xad35,0xadd8,0xae7b,0xaf1e,0xafc1,0xb064,0xb107,0xb1aa,0xb24d;
.dw 0xb2f0,0xb393,0xb436,0xb4d9,0xb57c,0xb61f,0xb6c2,0xb765,0xb808,0xb8ab;
.dw 0xb94e,0xb9f1,0xba94,0xbb37,0xbbda,0xbc7d,0xbd20,0xbdc3,0xbe66,0xbf09;
DB_Down:
.dw 0x8000,0x7f5d,0x7eba,0x7e17,0x7d74,0x7cd1,0x7c2e,0x7b8b,0x7ae8,0x7a45;
.dw 0x79a2,0x78ff,0x785c,0x77b9,0x7716,0x7673,0x75d0,0x752d,0x748a,0x73e7;
.dw 0x7344,0x72a1,0x71fe,0x715b,0x70b8,0x7015,0x6f27,0x6ecf,0x6e2c,0x6d89;
.dw 0x6ce6,0x6c43,0x6ba0,0x6afd,0x6a5a,0x69b7,0x6914,0x6871,0x67ce,0x672b;
.dw 0x6688,0x65e5,0x6542,0x649f,0x63fc,0x6359,0x62b6,0x6213,0x6170,0x60cd;
.dw 0x602a,0x5f87,0x5ee4,0x5e41,0x5d9e,0x5cfb,0x5c58,0x5bb5,0x5b12,0x5a6f;
.dw 0x59cc,0x5929,0x5886,0x57e3,0x5740,0x569d,0x55fa,0x5557,0x54b4,0x5411;
.dw 0x536e,0x52cb,0x5228,0x5185,0x50e2,0x503f,0x4f9c,0x4ef9,0x4e56,0x4db3;
.dw 0x4d10,0x4c6d,0x4bca,0x4b27,0x4a84,0x49e1,0x493e,0x489b,0x47f8,0x4755;
.dw 0x46b2,0x460f,0x45bc,0x44c9,0x4426,0x4383,0x42e0,0x423d,0x419a,0x40f7;
TBsin: 
.dw 0x8000,0x8202,0x8403,0x8604,0x8803,0x8a00,0x8bfb,0x8df2,0x8fe6,0x91d7; 
.dw 0x93c1,0x95b8,0x9789,0x9964,0x9b39,0x9d06,0x9ecd,0xa08b,0xa242,0xa3f0;
.dw 0xab94,0xa730,0xa8c1,0xaa48,0xabc4,0xad35,0xae9b,0xaff5,0xb143,0xb285;
.dw 0xb3b9,0xb4e1,0xb5fb,0xb708,0xb807,0xb8f7,0xb9da,0xbaad,0xbb72,0xbc28;
.dw 0xbcce,0xbd6b,0xbded,0xbe65,0xbece,0xbf26,0xbf6e,0xbfa7,0xbfcf,0xbfe7;
.dw 0xbff0,0xbfe7,0xbfcf,0xbfa7,0xbf6e,0xbf26,0xbece,0xbe65,0xbded,0xbd66;
.dw 0xbcce,0xbc28,0xbb72,0xbaad,0xb9da,0xb8f8,0xb807,0xb708,0xb5fb,0xb4ee;
.dw 0xb3ba,0xb285,0xb143,0xaff5,0xae96,0xad35,0xabc4,0xaa48,0xa8c1,0xa730;
.dw 0xa594,0xa3f0,0xa242,0xa08c,0x9ecd,0x9d06,0x9b39,0x9964,0x9789,0x95a8;
.dw 0x93c2,0x91d6,0x8fe6,0x8df2,0x8bfb,0x8a00,0x8803,0x8604,0x8403,0x8000;
.dw 0x8000,0x7dfe,0x7bfd,0x79fc,0x77fd,0x7600,0x7405,0x720e,0x701a,0x6e2a;
.dw 0x6c3f,0x6a58,0x6877,0x669c,0x64c7,0x62fa,0x6133,0x5f75,0x5dbe,0x5c10;
.dw 0x5abc,0x58d0,0x573f,0x55b8,0x543c,0x52cb,0x5165,0x500b,0x4ebd,0x4d7b;
.dw 0x4c47,0x4b1f,0x4a05,0x48f8,0x47f9,0x4709,0x4626,0x4553,0x448e,0x43d8;
.dw 0x4332,0x429a,0x4213,0x419b,0x4132,0x40da,0x4092,0x4059,0x4031,0x4019;
.dw 0x4010,0x4019,0x4031,0x4059,0x4092,0x40da,0x4132,0x419b,0x4213,0x429a;
.dw 0x4332,0x43d8,0x448e,0x4553,0x4626,0x4708,0x47f9,0x48f8,0x4a05,0x4b1f;
.dw 0x4c46,0x4d7b,0x4ebd,0x500b,0x5165,0x52cb,0x543c,0x55b8,0x5738,0x58d0;
.dw 0x5abc,0x5c10,0x5dbe,0x5f74,0x6133,0x62fa,0x64c7,0x669c,0x6877,0x6a58;
.dw 0x6c3f,0x6e2a,0x701a,0x720e,0x7405,0x7600,0x77fd,0x79fc,0x7bfd,0x7dfe;//0x8000;


.code
.public _K_IRQ
_K_IRQ:.proc
	int off 
	int fiq
    //设置IOB2、IOB3设成带上拉电阻的输入端口
    r1=0x0000;  
    [P_IOB_Dir]=r1; 
	[P_IOB_Attrib]=r1; 
	r1=0x000c ;
    [P_IOB_Data]=r1;
   	r1=0x0300; 				 //开中断IRQ3_EXT1、IRQ3_EXT2
	[P_INT_CTRL]=r1; 
	int irq; 
    retf
.endp


.code
.public _Sanjiaobo;
_Sanjiaobo:.proc


    


_pppp:
 r2=0
 r4=[_V_GA]
 
_Down1: 
  [R_SUM]=r2
  r2=r2+[_Bianxing]
  r2=r2+[T_PinLv]
  r1=100
  r1=r1-r4
  r1=r1+DB_Down
  bp=r1
  bp=bp+[R_SUM]
  r1=[bp]
  
  r1=r1+0x3f09
  r1=r1+[V_FuDu]
  [P_DAC1]=r1
  r3=r4
cmp r2,r3
jb _Down1

 r2=0
 r4=[_V_GA]
_Down: 
  [R_SUM]=r2
  r2=r2+[_Bianxing]
  r2=r2+[T_PinLv]
  r1=DB_Down
  bp=r1
  bp=bp+[R_SUM]
  r1=[bp]
  r1=r1-[V_FuDu]
  [P_DAC1]=r1
  r3=r4
cmp r2,r3
jb _Down
r2=0
r4=[_V_GA]
jmp _Up1
 
_zhongzhan:
    jmp _pppp
 
 

 _Up1: 
  [R_SUM]=r2
  r2=r2+[_Bianxing1]
  r2=r2+[T_PinLv]
  r1=DB_Up
  bp=r1
  bp=bp+[R_SUM]
  r1=100
  r1=r1-r4
  bp=bp+r1
  r1=[bp]
  r1=r1-0x3f09
  r1=r1-[V_FuDu]
  [P_DAC1]=r1
  r3=r4
cmp r2,r3
jb _Up1

r2=0
r4=[_V_GA]
_Up:
[R_SUM]=r2
r2=r2+[_Bianxing1]
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp+[R_SUM]

r1=[bp]
r1=r1+[V_FuDu]
r3=r3
[P_DAC1]=r1
r3=r4
cmp r2,r3
jb _Up
jmp _zhongzhan

retf
.endp

.code
.public _Juchibo;
_Juchibo:.proc


   
_aaaa:
 r2=0
 r4=[_V_GA]
_Upj1: 
  [R_SUM]=r2
  r2=r2+[_Bianxing]
  r2=r2+[T_PinLv]
  r1=DB_Up
  bp=r1
  bp=bp+[R_SUM]
   r1=100
  r1=r1-r4
  bp=bp+r1
  r1=[bp]
   r1=r1-0x3f09
  r1=r1-[V_FuDu]
  [P_DAC1]=r1
  r3=r4
cmp r2,r3
jb _Upj1

r2=0
r4=[_V_GA]
_Upj:
[R_SUM]=r2
r2=r2+[_Bianxing1]
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp+[R_SUM]
r1=[bp]
r1=r1+[V_FuDu]
[P_DAC1]=r1
r3=r4
cmp r2,r3
jb _Upj
jmp _aaaa

retf
.endp

.code
.public _Fangbo;
_Fangbo:.proc
 _baaa:
 r2=0
_Gdp:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp+0x4fff
r1=[bp]
r1=r1+[V_FuDu]

[P_DAC1]=r1
r4=[_Mk_F]
r3=r4
cmp r2,r3
jb _Gdp

 r2=0
_Ddp:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp-0x4fff
r1=[bp]
r1=r1-[V_FuDu]
[P_DAC1]=r1
r4=[_Mk_Z]
r3=r4
cmp r2,r3
jb _Ddp
 r2=0
_Gdp1:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp+0x4fff
r1=[bp]
r1=r1+[V_FuDu]

[P_DAC1]=r1
r4=[_Mk_F1]
r3=r4
cmp r2,r3
jb _Gdp1

 r2=0
_Ddp1:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp-0x4fff
r1=[bp]
r1=r1-[V_FuDu]
[P_DAC1]=r1
r4=[_Mk_Z]
r3=r4
cmp r2,r3
jb _Ddp1
 r2=0
_Gdp2:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp+0x4fff
r1=[bp]
r1=r1+[V_FuDu]

[P_DAC1]=r1
r4=[_Mk_F2]
r3=r4
cmp r2,r3
jb _Gdp2

 r2=0
_Ddp3:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp-0x4fff
r1=[bp]
r1=r1-[V_FuDu]
[P_DAC1]=r1
r4=[_Mk_Z]
r3=r4
cmp r2,r3
jb _Ddp3
 r2=0
_Gdp4:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp+0x4fff
r1=[bp]
r1=r1+[V_FuDu]

[P_DAC1]=r1
r4=[_Mk_F3]
r3=r4
cmp r2,r3
jb _Gdp4

 r2=0
_Ddp5:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp-0x4fff
r1=[bp]
r1=r1-[V_FuDu]
[P_DAC1]=r1
r4=[_Mk_Z]
r3=r4
cmp r2,r3
jb _Ddp5
 r2=0
 
_Gdp6:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp+0x4fff
r1=[bp]
r1=r1+[V_FuDu]

[P_DAC1]=r1
r4=[_Mk_F4]
r3=r4
cmp r2,r3
jb _Gdp6

 r2=0
_Ddp7:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp-0x4fff
r1=[bp]
r1=r1-[V_FuDu]
[P_DAC1]=r1
r4=[_Mk_Z]
r3=r4
cmp r2,r3
jb _Ddp7
 r2=0
_Gdp8:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp+0x4fff
r1=[bp]
r1=r1+[V_FuDu]

[P_DAC1]=r1
r4=[_Mk_F5]
r3=r4
cmp r2,r3
jb _Gdp8

 r2=0
_Ddp9:
[R_SUM]=r2
r2=r2+[T_PinLv]
r1=DB_Up
bp=r1
bp=bp-0x4fff
r1=[bp]
r1=r1-[V_FuDu]
[P_DAC1]=r1
r4=[_Mk_Z]
r3=r4
cmp r2,r3
jb _Ddp9
r1=_baaa
pc=r1

retf
.endp


.public _L_asin;
_L_asin:.proc

    
   
   
  
    
    r1=0x0000;
    [P_DAC_Ctrl]=r1;
    r3=0xffff					//D/A转换为10位，即B15~B6
    r1=0x0000;
 _wait: 
 r1=0x8000
    [P_DAC1]=r1   
     bp=TBsin;
     [P_DAC1]=r1 
     r2=0
     [R_SUM]=r2
     r1=0x8000
    [P_DAC1]=r1   
 _wait1: 
 r1=0x8000
    [P_DAC1]=r1     
     r2=bp+[R_SUM]
     r1=[r2];
     r2=[R_SUM]
     r2=r2+[T_PinLv]
     r2=r2+1
    [R_SUM]=r2
    //r3=1
    //cmp r2,r3
    //jnb  _FUBAN
     //r1=r1+0x400f
     [P_DAC1]=r1
   //r3=100
    //cmp r2,r3
   // jb  _wait1
   //_FUBAN:
    //r1=r1-0x400f
    // [P_DAC1]=r1
    // [P_DAC2]=r1
   
     
     r3=200
     cmp r3,r2
  jnb _wait1
  r1=0x8000
    [P_DAC1]=r1   
  jmp _wait
    .endp



.text
.public _IRQ3
_IRQ3:
   push r1,r5 to [sp]		//压栈保护 
   r1=0x0100 	    
   test r1,[P_INT_CTRL] 	//比较是否为IRQ3_EXT1	 
   jnz  irq3_ext1			//是，则转至对应程序段；
   r1=0x0200 	    
   test r1,[P_INT_CTRL] 	//否，则比较是否为IRQ3_EXT2
   jnz  irq3_ext2			//是，则转至对应程序段；
   r1=0x0200 	    
   
irq3_key:					//否，则进入键唤醒中断
	r1=0x0080 	     
	[P_INT_CLEAR]=r1 
	pop r1,r5 from [sp]   
	reti

irq3_ext2:		
   r1=[V_FuDu]
   r1=r1+0xa3
   r1=0xffff
   
    
   [V_FuDu]=r1			 			 
   
   r1=0x0200 	     
   [P_INT_CLEAR]=r1 
   pop r1,r5 from [sp]
   [_pp]=r1
   
   sp=0x07fd
   r1=0x8005
   r2=0x0000
   r3=0x0206
   r4=0xa810
   bp=0x0000
   sr=0x0140
   pc=0x8e81;
   
   reti

irq3_ext1:
    r1=[T_PinLv]
   r1=r1+1
   r2=50
   cmp r2,r1
   jb _qing
   [T_PinLv]=r1				 			 
   r2=50
   r2=r2-r1
   r1=0xf3
   mr=r2*r1
   [_sanju]=r3
   r1=0x0100 	     
   [P_INT_CLEAR]=r1 
   pop r1,r5 from [sp]
   reti

_qing:
   r1=0
   [T_PinLv]=r1	
  r2=[_sanju]
   r2=50
   r2=r2-r1
   r1=0xf3
   mr=r2*r1
   [_sanju]=r3
   r1=0x0100 	     
   [P_INT_CLEAR]=r1 
   pop r1,r5 from [sp]
   reti








