.EXTERNAL _ADD;
.RAM
.VAR SUM
.CODE
.PUBLIC _main;
_main:
	R1 = 3;
	PUSH R1 TO [SP]; 		//��3��������ջ
	R1 = 2;
	PUSH R1 TO [SP];		//��2��������ջ
	CALL _ADD;
	[SUM]=R1;
	POP R1 FROM [SP];		//���������ָ�SPָ��
.END	
	