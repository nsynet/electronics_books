//////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////

.public     bank
.public     bank1
.public		label1	
//---------------------------------------------------
.public		pixel_page
.public		pixel_column
.public		pixel_bit
//----------------------------------
.public		image_width_byte
.public		image_high_bit
.public		image_jumpoff_point_x
.public		image_jumpoff_point_y
.public		image_tab
.public		image_page
.public		image_bit
.public		image_lcd_data			//read data on lcd	
.public		image_temp_data
.public		image_temp_data1
.public		image_tab_pointer
//----------------------------------------------------------------
.public	_line_x0								//ֱ�����Xֵ
.public	_line_x1								//ֱ���յ�Xֵ
.public	_line_y0								//ֱ�����Yֵ
.public	_line_y1								//ֱ���յ�Yֵ
.public	_line_x									//ֱ���ϵ�Xֵ
.public	_line_y									//ֱ���ϵ�Yֵ
.public	_lineparameter_a						//ֱ�߲���A
.public	_lineparameter_b						//ֱ�߲���B
.public	_lineparameter_a_temp					//ֱ�߲���A
.public	_lineparameter_b_temp					//ֱ�߲���B
//-----------------------------------------------------
.public	_rectangle_jumping_off_x
.public	_rectangle_jumping_off_y
.public	_rectangle_high
.public	_rectangle_wide
.public	_rectagle_shape
.public	_rectagle_mode

.public	_rectangle_jumping_off_page
.public	_rectangle_jumping_off_place
.public	_rectangle_jumping_off_bit
.public	_rectangle_end_place
.public	_rectangle_end_page
.public	_rectangle_end_bit
.public	rectangle_temp_bit
.public	rectangle_temp_page
.public	_rectangle_jumping_off_bit_temp
.public	_rectagle_high_temp
.public	_rectagle_wide_temp
.public	_rectangle_temp_x					//����x
.public	_rectangle_wide_temp
.public _rectangle_end_place_temp
//-----------------------------------------------------
.public	_ellipse_long_axes							//��Բ����
.public	_ellipse_short_axes							//��Բ����
.public	_ellipse_x									//��Բ�ϵ�x
.public	_ellipse_y									//��Բ�ϵ�y
.public	_ellipse_origin_x							//��Բԭ��x
.public	_ellipse_origin_y							//��Բԭ��y


.public	_a_square_mul_y_square_l					//aƽ������yƽ��
.public	_a_square_mul_y_square_h					//aƽ������yƽ��
.public	_b_square_mul_x_square_l					//bƽ������xƽ��
.public	_b_square_mul_x_square_h					//bƽ������xƽ��
.public	_a_square_mul_b_square_l					//aƽ������yƽ��
.public	_a_square_mul_b_square_h					//bƽ������xƽ��
.public	_public_a									//a
.public	_public_b									//b
.public	_public_a_squ_mul_b_squ_l					//public aƽ������bƽ��
.public	_public_a_squ_mul_b_squ_h					//public bƽ������bƽ��
.public	_public_sbc_l								//�������̵�λ
.public	_public_sbc_h								//�������̸�λ
.public	_public_c_l									//public 
.public	_public_c_h									//public 
.public	_public_d_l									//public
.public	_public_d_h									//public
.public	_ellipse_x_temp								//public
.public	_ellipse_y_temp								//public
.public	_public_offset_in_a_l						//����a2b2
.public	_public_offset_in_a_h						//����a2b2
.public	_public_offset_in_b_l						//����a2y2
.public	_public_offset_in_b_h						//����a2y2
.public	_public_offset_in_c_l						//����b2x2
.public	_public_offset_in_c_h						//����b2x2
.public	_public_offset_out_l						//���
.public	_public_offset_out_h						//���
.public	_sign										//����[00]+[ff]-
.public	_ellipse_reckon_offset_first_l				//��Բ��ƫ����X-1��Y-1
.public	_ellipse_reckon_offset_first_h				//��Բ��ƫ����X-1��Y-1
.public	_ellipse_reckon_offset_second_l				//��Բ��ƫ����
.public	_ellipse_reckon_offset_second_h				//��Բ��ƫ����
.public	_ellipse_reckon_offset_sign					//��Բ��ƫ��������
.public	_process_sign								//�������Ƚϴ�С��־

//////////////////
//�ֱ���
//////////////////
.public	charnum										//�ַ����
.public	charwide									//�ַ����
.public	charhigh									//�ַ���
.public	chartemp
//////////////////
//�ַ�������
//////////////////
.public	str_tab										//�ַ�����ʼ��ַ
.public	str_x
.public	str_y
//.public	str_mod	

//-----------------------------------------------------
.public		label2
.public		bp_temp
.public		R_GraphicMode_temp
.public		sign
.public		constant
//bit0		������image��־
//bit1		PutChar_tiny_get_data�е�ǰȡ��λ�ã�r1�е�����ȡ�꣩
//bit2		�����ȱ�־
//bit3		��ͼ��־
//bit4		���ߴ����־��1����0���գ�
//bit5		
//bit6
//bit7				
//bit8		tiny��־
//bit9		small��־
//bit10		smallb��־
//bit11		large��־
//bit12		narrow��־
//bit13		
//bit14		
//bit15		
//-----------------------------------------------------
.public		label3
.public	_page_place_bit								//����PAGE place��λ��
.public	_page										//������PAGE
.public	_page_place									//����PAGE�� place
.public	_point_shape
.PUBLIC _x
.public _y
.public	_public_offset_x							//��X����ƫ����
.public	_public_offset_y							//��X����ƫ����
.public	_public_area_sign							//��������ʾ��Χ��־
.public	_point_value								//���ֵ
.public	_point_value_temp	   						//��ֵ��ʱ�Ĵ���
//-----------------------------------------------------
.public		label4
//-----------------------------------------------------
.public		R_GraphicMode
.public		_x0
.public		_y0	
.ram
.var        bank
.var        bank1
label1:		.dw			11	dup(0)			//parameter of 	understratum function	
.define		pixel_page		label1
.define		pixel_column	label1+1
.define		pixel_bit		label1+2
/////// 
.define		image_width_byte		label1
.define		image_high_bit			label1+1
.define		image_jumpoff_point_x	label1+2
.define		image_jumpoff_point_y	label1+3
.define		image_tab				label1+4
.define		image_page				label1+5
.define		image_bit				label1+6
.define		image_lcd_data			label1+7//read data on lcd
.define		image_temp_data			label1+8//temporarily data
//.define		image_temp_data1			label1+9//temporarily data
.var	image_temp_data1
.define		image_tab_pointer		label1+10//pointer of tab
///////
.define	_line_x0					label1			//ֱ�����Xֵ
.define	_line_x1					label1+1			//ֱ���յ�Xֵ
.define	_line_y0					label1+2			//ֱ�����Yֵ
.define	_line_y1					label1+3			//ֱ���յ�Yֵ
.define	_line_x						label1+4			//ֱ���ϵ�Xֵ
.define	_line_y						label1+5			//ֱ���ϵ�Yֵ
.define	_lineparameter_a			label1+6			//ֱ�߲���A
.define	_lineparameter_b			label1+7			//ֱ�߲���B
.define	_lineparameter_a_temp		label1+8			//ֱ�߲���A
.define	_lineparameter_b_temp		label1+9			//ֱ�߲���B

//.var	_line_x0								//ֱ�����Xֵ
//.var	_line_x1								//ֱ���յ�Xֵ
//.var	_line_y0								//ֱ�����Yֵ
//.var	_line_y1								//ֱ���յ�Yֵ
//.var	_line_x									//ֱ���ϵ�Xֵ
//.var	_line_y									//ֱ���ϵ�Yֵ
//.var	_lineparameter_a						//ֱ�߲���A
//.var	_lineparameter_b						//ֱ�߲���B
//.var	_lineparameter_a_temp					//ֱ�߲���A
//.var	_lineparameter_b_temp					//ֱ�߲���B
//-----
////////////////////////////////////
//���α���
////////////////////////////////////
//.var	_rectangle_jumping_off_x					//�������x
//.var	_rectangle_jumping_off_y					//�������y
//.var	_rectangle_high								//���θ�
//.var	_rectangle_wide								//���ο�
//.var	_rectagle_shape								//������״
//.var	_rectagle_mode								//����ģʽ
////////////////////////////////////
//���μ�����̱���
////////////////////////////////////
//.var	_rectangle_jumping_off_page					//�������page
//.var	_rectangle_jumping_off_place				//�������place
//.var	_rectangle_jumping_off_bit					//�������bit
//.var	_rectangle_end_place						//�����յ�page
//.var	_rectangle_end_page							//�����յ�place
//.var	_rectangle_end_bit							//�����յ�bit
//.var	rectangle_temp_bit
//.var	rectangle_temp_page
//.var	_rectangle_jumping_off_bit_temp
//.var	_rectangle_end_place_temp
//.var	_rectagle_high_temp
//.var	_rectagle_wide_temp
//.var	_rectangle_temp_x					//����x
//.var	_rectangle_wide_temp
////////////////////////////////////
//���α���
////////////////////////////////////
.define	_rectangle_jumping_off_x		label4			//�������x
.define	_rectangle_jumping_off_y		label4+1			//�������y
.define	_rectangle_high					label4+2			//���θ�
.define	_rectangle_wide					label4+3			//���ο�
.define	_rectagle_shape					label4+4			//������״
.define	_rectagle_mode					label4+5			//����ģʽ
////////////////////////////////////
//���μ�����̱���
////////////////////////////////////
.define	_rectangle_jumping_off_page		label4+6			//�������page
.define	_rectangle_jumping_off_place	label4+7			//�������place
.define	_rectangle_jumping_off_bit		label4+8			//�������bit
.define	_rectangle_end_place			label4+9			//�����յ�page
.define	_rectangle_end_page				label4+a			//�����յ�place
.define	_rectangle_end_bit				label4+b			//�����յ�bit
.define	rectangle_temp_bit				label4+c
.define	rectangle_temp_page				label4+d
.define	_rectangle_jumping_off_bit_temp	label4+e
.define	_rectangle_end_place_temp		label4+f
.define	_rectagle_high_temp				label4+10
.define	_rectagle_wide_temp				label4+11
.define	_rectangle_temp_x				label4+12	//����x
.define	_rectangle_wide_temp			label4+13
/////////////////////////////////////
//	��Բ����
////////////////////////////////////////
//.var	_ellipse_long_axes							//��Բ����
//.var	_ellipse_short_axes							//��Բ����
//.var	_ellipse_x									//��Բ�ϵ�x
///.var	_ellipse_y									//��Բ�ϵ�y
//.var	_ellipse_origin_x							//��Բԭ��x
//.var	_ellipse_origin_y							//��Բԭ��y
/////////////////////////////////////
//	��Բ������̱���
////////////////////////////////////////
//.var	_a_square_mul_y_square_l					//aƽ������yƽ��
//.var	_a_square_mul_y_square_h					//aƽ������yƽ��
//.var	_b_square_mul_x_square_l					//bƽ������xƽ��
//.var	_b_square_mul_x_square_h					//bƽ������xƽ��
//.var	_a_square_mul_b_square_l					//aƽ������yƽ��
//.var	_a_square_mul_b_square_h					//bƽ������xƽ��
//.var	_public_a									//public a
//.var	_public_b									//public b
//.var	_public_a_squ_mul_b_squ_l					//public aƽ������bƽ��
//.var	_public_a_squ_mul_b_squ_h					//public bƽ������bƽ��
//.var	_public_sbc_l								//�������̵�λ
//.var	_public_sbc_h								//�������̸�λ
//.var	_public_c_l									//public 
//.var	_public_c_h									//public 
//.var	_public_d_l									//public
//.var	_public_d_h									//public
//.var	_ellipse_x_temp								//public
//.var	_ellipse_y_temp								//public
//.var	_public_offset_in_a_l						//����
//.var	_public_offset_in_a_h						//����
//.var	_public_offset_in_b_l						//����
//.var	_public_offset_in_b_h						//����
//.var	_public_offset_in_c_l						//����b2x2
//.var	_public_offset_in_c_h						//����b2x2
//.var	_public_offset_out_l						//���
//.var	_public_offset_out_h						//���
//.var	_sign										//����
//.var	_ellipse_reckon_offset_first_l				//��Բ��ƫ����X-1��Y-1
///.var	_ellipse_reckon_offset_first_h				//��Բ��ƫ����X-1��Y-1
//.var	_ellipse_reckon_offset_second_l				//��Բ��ƫ����
//.var	_ellipse_reckon_offset_second_h				//��Բ��ƫ����
//.var	_ellipse_reckon_offset_sign					//��Բ��ƫ��������
//.var	_process_sign								//�������Ƚϴ�С��־	
/////////////////////////////////////
//	��Բ����
////////////////////////////////////////
.define	_ellipse_long_axes				label4			//��Բ����
.define	_ellipse_short_axes				label4+1			//��Բ����
.define	_ellipse_x						label4+2			//��Բ�ϵ�x
.define	_ellipse_y						label4+3			//��Բ�ϵ�y
.define	_ellipse_origin_x				label4+4			//��Բԭ��x
.define	_ellipse_origin_y				label4+5			//��Բԭ��y
/////////////////////////////////////
//	��Բ������̱���
////////////////////////////////////////
.define	_a_square_mul_y_square_l		label4+6			//aƽ������yƽ��
.define	_a_square_mul_y_square_h		label4+7			//aƽ������yƽ��
.define	_b_square_mul_x_square_l		label4+8			//bƽ������xƽ��
.define	_b_square_mul_x_square_h		label4+9			//bƽ������xƽ��
.define	_a_square_mul_b_square_l		label4+a			//aƽ������yƽ��
.define	_a_square_mul_b_square_h		label4+b			//bƽ������xƽ��
.define	_public_a						label4+c			//public a
.define	_public_b						label4+d			//public b
.define	_public_a_squ_mul_b_squ_l		label4+e			//public aƽ������bƽ��
.define	_public_a_squ_mul_b_squ_h		label4+f			//public bƽ������bƽ��
.define	_public_sbc_l					label4+10			//�������̵�λ
.define	_public_sbc_h					label4+11			//�������̸�λ
.define	_public_c_l						label4+12			//public 
.define	_public_c_h						label4+13			//public 
.define	_public_d_l						label4+14			//public
.define	_public_d_h						label4+15			//public
.define	_ellipse_x_temp					label4+16			//public
.define	_ellipse_y_temp					label4+17			//public
.define	_public_offset_in_a_l			label4+18			//����
.define	_public_offset_in_a_h			label4+19			//����
.define	_public_offset_in_b_l			label4+1a			//����
.define	_public_offset_in_b_h			label4+1b		//����
.define	_public_offset_in_c_l			label4+1c			//����b2x2
.define	_public_offset_in_c_h			label4+1d			//����b2x2
.define	_public_offset_out_l			label4+1f		//���
.define	_public_offset_out_h			label4+20			//���
.define	_sign							label4+21			//����
.define	_ellipse_reckon_offset_first_l	label4+22			//��Բ��ƫ����X-1��Y-1
.define	_ellipse_reckon_offset_first_h	label4+23			//��Բ��ƫ����X-1��Y-1
.define	_ellipse_reckon_offset_second_l	label4+24			//��Բ��ƫ����
.define	_ellipse_reckon_offset_second_h	label4+25			//��Բ��ƫ����
.define	_ellipse_reckon_offset_sign		label4+26			//��Բ��ƫ��������
.define	_process_sign					label4+27
//////////////////
//�ֱ���
//////////////////
.var	charnum										//�ַ����
.var	charwide									//�ַ����
.var	charhigh									//�ַ���
.var	char_mod
.var	chartemp
.var	constant
//////////////////
//�ַ�������
//////////////////
.var	str_tab										//�ַ�����ʼ��ַ
.var	str_x
.var	str_y
//.var	str_mod	
///


label2:		.dw			10	dup(0)			//parameter of 	c function
.define		bp_temp					label2
.define		R_GraphicMode_temp		label2+1
.define		sign					label2+2
//-----
label3:		.dw			15	dup(0)
//.define	_page_place_bit				label3				//����PAGE place��λ��
//.define	_page						label3+1				//������PAGE
//.define	_page_place					label3+2				//����PAGE�� place
//.define _x							label3+3
//.define _y							label3+4
//.define	_public_offset_x			label3+5				//��X����ƫ����
//.define	_public_offset_y			label3+6				//��Y����ƫ����
//.define	_public_area_sign			label3+7				//��������ʾ��Χ��־
//.define	_point_value				label3+8				//���ֵ
//.define	_point_value_temp	   		label3+9				//��ֵ��ʱ�Ĵ���
//.define	_point_shape	 	  		label3+10

.var	_page_place_bit		//		label3				//����PAGE place��λ��
.var	_page			//			label3+1				//������PAGE
.var	_page_place		//			label3+2				//����PAGE�� place
.var	_x					//		label3+3
.var	_y					//		label3+4
.var	_public_offset_x		//	label3+5				//��X����ƫ����
.var	_public_offset_y		//	label3+6				//��Y����ƫ����
.var	_public_area_sign		//	label3+7				//��������ʾ��Χ��־
.var	_point_value			//	label3+8				//���ֵ
.var	_point_value_temp	   	//	label3+9				//��ֵ��ʱ�Ĵ���
.var	_point_shape
label4:		.dw			32	dup(0)



//////////////////////////////////////////////////////////////////
.var		R_GraphicMode
.var		_x0
.var		_y0	
.text
//-----------------------------------------------------------------
.public  tab_rectangle1
tab_rectangle1:
	.dw 0x00,0x01,0x03,0x07,0x0f,0x1f,0x3f,0x7f,0xff
.public  tab_rectangle2
tab_rectangle2:
	.dw 0x00,0xff,0xfe,0xfc,0xf8,0xf0,0xe0,0xc0,0x80
.public	TAB_pixel		
TAB_pixel:			
	.dw		00h,01h,02h,04h,08h,10h,20h,40h,80h
//------------------------------------------------------------------
