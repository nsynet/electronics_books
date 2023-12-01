	.module chengxu.c
	.area data(ram, con, rel)
_table::
	.blkb 2
	.area idata
	.byte 192,249
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 164,176
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 153,146
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 130,248
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 128,144
	.area data(ram, con, rel)
	.dbfile D:\����\�����ܽ��M8����\007������ܼӼ�������ʾ���\icc\chengxu.c
	.dbsym e table _table A[10:10]c
_cnt::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile D:\����\�����ܽ��M8����\007������ܼӼ�������ʾ���\icc\chengxu.c
	.dbsym e cnt _cnt i
	.area text(rom, con, rel)
	.dbfile D:\����\�����ܽ��M8����\007������ܼӼ�������ʾ���\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 21
; #include <iom8v.h>
; /********************************************************************
;                 �������Ͷ���
; *********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; #define WEI PORTC
; #define DUAN PORTB
; /********************************************************************
;                 ����ܶ��붨��0123456789
; *********************************************************************/
; uchar table[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
; uint cnt=0000;//������ֵ
; 
; uchar key_up;//�Ӽ���������־
; uchar key_down;//������������־
; /**********************************************************************
; 				  MS����ʱ�������򣬲���i ��ʱʱ��					   	
; **********************************************************************/
; void DelayMS(uint i)
; {
	.dbline 23
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 24
; {
	.dbline 25
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 25
L7:
	.dbline 25
	subi R20,1
	sbci R21,0
L9:
	.dbline 25
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 26
L3:
	.dbline 23
	subi R16,1
	sbci R17,0
L5:
	.dbline 23
	cpi R16,0
	cpc R16,R17
	brne L2
X1:
	.dbline -2
L1:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r i 16 i
	.dbend
	.dbfunc e Led _Led fV
;              m -> R20
	.even
_Led::
	xcall push_gset1
	.dbline -1
	.dbline 33
; for(j=8000;j!=0;j--);
; }
; }
; /**********************************************************************
; 				            ��ʾ����	
; ע�⣺ʹ�ÿ�����ʱWEI���ĸ�ֵΪ0XEF,0XDF,0XBF,0X7F			   	
; **********************************************************************/
; void Led() //��ʾ����
; {
	.dbline 34
; uchar m=1;//������ʱ
	ldi R20,1
	.dbline 36
; 
; WEI=0x01; //����͵�ƽ��ѡͨǧλ��
	ldi R24,1
	out 0x15,R24
	.dbline 37
; DUAN=table[cnt/1000]; //ȡ��ǧλ������������
	ldi R18,1000
	ldi R19,3
	lds R16,_cnt
	lds R17,_cnt+1
	xcall div16u
	movw R30,R16
	ldi R24,<_table
	ldi R25,>_table
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 38
; DelayMS(m); //��ʱ
	mov R16,R20
	clr R17
	xcall _DelayMS
	.dbline 39
; WEI=0x00;
	clr R2
	out 0x15,R2
	.dbline 40
; DUAN=0xff;
	ldi R24,255
	out 0x18,R24
	.dbline 41
; WEI=0x02; //����͵�ƽ��ѡͨ��λ��
	ldi R24,2
	out 0x15,R24
	.dbline 42
; DUAN=table[cnt%1000/100]; //ȡ����λ������������
	ldi R18,1000
	ldi R19,3
	lds R16,_cnt
	lds R17,_cnt+1
	xcall mod16u
	ldi R18,100
	ldi R19,0
	xcall div16u
	movw R30,R16
	ldi R24,<_table
	ldi R25,>_table
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 43
; DelayMS(m); //��ʱ
	mov R16,R20
	clr R17
	xcall _DelayMS
	.dbline 44
; WEI=0x00;
	clr R2
	out 0x15,R2
	.dbline 45
; DUAN=0xff;
	ldi R24,255
	out 0x18,R24
	.dbline 46
; WEI=0x04; //����͵�ƽ��ѡͨʮλ��
	ldi R24,4
	out 0x15,R24
	.dbline 47
; DUAN=table[cnt%100/10]; //ȡ��ʮλ������������
	ldi R18,100
	ldi R19,0
	lds R16,_cnt
	lds R17,_cnt+1
	xcall mod16u
	ldi R18,10
	ldi R19,0
	xcall div16u
	movw R30,R16
	ldi R24,<_table
	ldi R25,>_table
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 48
; DelayMS(m); //��ʱ
	mov R16,R20
	clr R17
	xcall _DelayMS
	.dbline 49
; WEI=0x00;
	clr R2
	out 0x15,R2
	.dbline 50
; DUAN=0xff;
	ldi R24,255
	out 0x18,R24
	.dbline 51
; WEI=0x08;
	ldi R24,8
	out 0x15,R24
	.dbline 52
; DUAN=table[cnt%10]; //ȡ����λ������������
	ldi R18,10
	ldi R19,0
	lds R16,_cnt
	lds R17,_cnt+1
	xcall mod16u
	movw R30,R16
	ldi R24,<_table
	ldi R25,>_table
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 53
; DelayMS(m);
	mov R16,R20
	clr R17
	xcall _DelayMS
	.dbline 54
; WEI=0x00;
	clr R2
	out 0x15,R2
	.dbline 55
; DUAN=0xff;
	ldi R24,255
	out 0x18,R24
	.dbline -2
L10:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r m 20 c
	.dbend
	.dbfunc e init_io _init_io fV
	.even
_init_io::
	.dbline -1
	.dbline 61
; }
; /**********************************************************************
; 				           ��ʼ��I/O			   	
; **********************************************************************/
; void init_io(void)//��ʼ��I/O
; {
	.dbline 63
; //����B��Ϊ���
; DDRB=0XFF;
	ldi R24,255
	out 0x17,R24
	.dbline 64
; PORTB=0xFF;
	out 0x18,R24
	.dbline 66
; //����D��Ϊ����
; DDRD=0x00;
	clr R2
	out 0x11,R2
	.dbline 67
; PORTD=0x00;
	out 0x12,R2
	.dbline 69
; //����C��Ϊ���
; DDRC=0XFF;
	out 0x14,R24
	.dbline 70
; PORTC=0xFF;
	out 0x15,R24
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e get_key _get_key fV
	.even
_get_key::
	.dbline -1
	.dbline 79
; }
; 
; /**********************************************************************
; 				          ����ɨ�躯��		   	
; **********************************************************************/
; 
; void get_key(void)//����ɨ�躯��
; 
; {
	xjmp L14
L13:
	.dbline 81
	.dbline 81
	ldi R24,1
	sts _key_up,R24
	.dbline 82
	xcall _Led
	.dbline 83
L14:
	.dbline 80
; while((PIND&0X01)==0)//�����Ӽ�����־
	sbis 0x10,0
	rjmp L13
	xjmp L17
L16:
	.dbline 85
	.dbline 85
	ldi R24,1
	sts _key_down,R24
	.dbline 86
	xcall _Led
	.dbline 86
L17:
	.dbline 84
; {key_up=1;
; Led();
; }
; while((PIND&0X02)==0)//������������־
	sbis 0x10,1
	rjmp L16
	.dbline -2
L12:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 92
; {key_down=1;
; Led();}
; }
; /**********************************************************************
; 				          ������		   	
; **********************************************************************/
; void main(void)
; {
	.dbline 93
; init_io();//��ʼ��I/O
	xcall _init_io
	xjmp L21
L20:
	.dbline 96
; 
; while(1)
; {
	.dbline 97
; get_key();//����ɨ��
	xcall _get_key
	.dbline 98
; Led(); //��ʾ
	xcall _Led
	.dbline 99
; if (key_up==1)
	lds R24,_key_up
	cpi R24,1
	brne L23
	.dbline 100
;        {
	.dbline 101
; if(cnt!=9999)//�ж��Ƿ������9999
	lds R24,_cnt
	lds R25,_cnt+1
	cpi R24,15
	ldi R30,39
	cpc R25,R30
	breq L25
	.dbline 102
;              {
	.dbline 103
;                cnt=cnt+1;//��һ
	adiw R24,1
	sts _cnt+1,R25
	sts _cnt,R24
	.dbline 104
;                key_up=0;
	clr R2
	sts _key_up,R2
	.dbline 105
; 			   }
L25:
	.dbline 106
;         }
L23:
	.dbline 107
; if (key_down==1)
	lds R24,_key_down
	cpi R24,1
	brne L27
	.dbline 108
;      {
	.dbline 109
; if(cnt!=0)//�ж��Ƿ������0
	lds R2,_cnt
	lds R3,_cnt+1
	tst R2
	brne X2
	tst R3
	breq L29
X2:
	.dbline 110
;        {
	.dbline 111
; 	   cnt=cnt-1;//��һ
	lds R24,_cnt
	lds R25,_cnt+1
	sbiw R24,1
	sts _cnt+1,R25
	sts _cnt,R24
	.dbline 112
;        key_down=0;
	clr R2
	sts _key_down,R2
	.dbline 113
;        }
L29:
	.dbline 114
;      }
L27:
	.dbline 115
L21:
	.dbline 95
	xjmp L20
X3:
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\����\�����ܽ��M8����\007������ܼӼ�������ʾ���\icc\chengxu.c
_key_down::
	.blkb 1
	.dbsym e key_down _key_down c
_key_up::
	.blkb 1
	.dbsym e key_up _key_up c
