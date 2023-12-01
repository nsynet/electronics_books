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
.public	_line_x0								//直线起点X值
.public	_line_x1								//直线终点X值
.public	_line_y0								//直线起点Y值
.public	_line_y1								//直线终点Y值
.public	_line_x									//直线上点X值
.public	_line_y									//直线上点Y值
.public	_lineparameter_a						//直线参数A
.public	_lineparameter_b						//直线参数B
.public	_lineparameter_a_temp					//直线参数A
.public	_lineparameter_b_temp					//直线参数B
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
.public	_rectangle_temp_x					//矩形x
.public	_rectangle_wide_temp
.public _rectangle_end_place_temp
//-----------------------------------------------------
.public	_ellipse_long_axes							//椭圆长轴
.public	_ellipse_short_axes							//椭圆短轴
.public	_ellipse_x									//椭圆上点x
.public	_ellipse_y									//椭圆上点y
.public	_ellipse_origin_x							//椭圆原点x
.public	_ellipse_origin_y							//椭圆原点y


.public	_a_square_mul_y_square_l					//a平方乘以y平方
.public	_a_square_mul_y_square_h					//a平方乘以y平方
.public	_b_square_mul_x_square_l					//b平方乘以x平方
.public	_b_square_mul_x_square_h					//b平方乘以x平方
.public	_a_square_mul_b_square_l					//a平方乘以y平方
.public	_a_square_mul_b_square_h					//b平方乘以x平方
.public	_public_a									//a
.public	_public_b									//b
.public	_public_a_squ_mul_b_squ_l					//public a平方乘以b平方
.public	_public_a_squ_mul_b_squ_h					//public b平方乘以b平方
.public	_public_sbc_l								//减法过程低位
.public	_public_sbc_h								//减法过程高位
.public	_public_c_l									//public 
.public	_public_c_h									//public 
.public	_public_d_l									//public
.public	_public_d_h									//public
.public	_ellipse_x_temp								//public
.public	_ellipse_y_temp								//public
.public	_public_offset_in_a_l						//输入a2b2
.public	_public_offset_in_a_h						//输入a2b2
.public	_public_offset_in_b_l						//输入a2y2
.public	_public_offset_in_b_h						//输入a2y2
.public	_public_offset_in_c_l						//输入b2x2
.public	_public_offset_in_c_h						//输入b2x2
.public	_public_offset_out_l						//输出
.public	_public_offset_out_h						//输出
.public	_sign										//符号[00]+[ff]-
.public	_ellipse_reckon_offset_first_l				//椭圆计偏移量X-1，Y-1
.public	_ellipse_reckon_offset_first_h				//椭圆计偏移量X-1，Y-1
.public	_ellipse_reckon_offset_second_l				//椭圆计偏移量
.public	_ellipse_reckon_offset_second_h				//椭圆计偏移量
.public	_ellipse_reckon_offset_sign					//椭圆计偏移量符号
.public	_process_sign								//两个数比较大小标志

//////////////////
//字变量
//////////////////
.public	charnum										//字符序号
.public	charwide									//字符宽度
.public	charhigh									//字符高
.public	chartemp
//////////////////
//字符串变量
//////////////////
.public	str_tab										//字符串起始地址
.public	str_x
.public	str_y
//.public	str_mod	

//-----------------------------------------------------
.public		label2
.public		bp_temp
.public		R_GraphicMode_temp
.public		sign
.public		constant
//bit0		汇编调用image标志
//bit1		PutChar_tiny_get_data中当前取数位置（r1中的数都取完）
//bit2		计算宽度标志
//bit3		贴图标志
//bit4		虚线次序标志（1画点0画空）
//bit5		
//bit6
//bit7				
//bit8		tiny标志
//bit9		small标志
//bit10		smallb标志
//bit11		large标志
//bit12		narrow标志
//bit13		
//bit14		
//bit15		
//-----------------------------------------------------
.public		label3
.public	_page_place_bit								//点在PAGE place上位置
.public	_page										//点所在PAGE
.public	_page_place									//点在PAGE上 place
.public	_point_shape
.PUBLIC _x
.public _y
.public	_public_offset_x							//点X坐标偏移量
.public	_public_offset_y							//点X坐标偏移量
.public	_public_area_sign							//点坐标显示范围标志
.public	_point_value								//点的值
.public	_point_value_temp	   						//点值临时寄存器
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
//.define	_line_x0					label1			//直线起点X值
//.define	_line_x1					label1+1			//直线终点X值
//.define	_line_y0					label1+2			//直线起点Y值
//.define	_line_y1					label1+3			//直线终点Y值
//.define	_line_x						label1+4			//直线上点X值
//.define	_line_y						label1+5			//直线上点Y值
//.define	_lineparameter_a			label1+6			//直线参数A
//.define	_lineparameter_b			label1+7			//直线参数B
//.define	_lineparameter_a_temp		label1+8			//直线参数A
//.define	_lineparameter_b_temp		label1+9			//直线参数B

.var	_line_x0								//直线起点X值
.var	_line_x1								//直线终点X值
.var	_line_y0								//直线起点Y值
.var	_line_y1								//直线终点Y值
.var	_line_x									//直线上点X值
.var	_line_y									//直线上点Y值
.var	_lineparameter_a						//直线参数A
.var	_lineparameter_b						//直线参数B
.var	_lineparameter_a_temp					//直线参数A
.var	_lineparameter_b_temp					//直线参数B
//-----
////////////////////////////////////
//矩形变量
////////////////////////////////////
.var	_rectangle_jumping_off_x					//矩形起点x
.var	_rectangle_jumping_off_y					//矩形起点y
.var	_rectangle_high								//矩形高
.var	_rectangle_wide								//矩形宽
.var	_rectagle_shape								//矩形形状
.var	_rectagle_mode								//矩形模式
////////////////////////////////////
//矩形计算过程变量
////////////////////////////////////
.var	_rectangle_jumping_off_page					//矩形起点page
.var	_rectangle_jumping_off_place				//矩形起点place
.var	_rectangle_jumping_off_bit					//矩形起点bit
.var	_rectangle_end_place						//矩形终点page
.var	_rectangle_end_page							//矩形终点place
.var	_rectangle_end_bit							//矩形终点bit
.var	rectangle_temp_bit
.var	rectangle_temp_page
.var	_rectangle_jumping_off_bit_temp
.var	_rectangle_end_place_temp
.var	_rectagle_high_temp
.var	_rectagle_wide_temp
.var	_rectangle_temp_x					//矩形x
.var	_rectangle_wide_temp
/////////////////////////////////////
//	椭圆变量
////////////////////////////////////////
.var	_ellipse_long_axes							//椭圆长轴
.var	_ellipse_short_axes							//椭圆短轴
.var	_ellipse_x									//椭圆上点x
.var	_ellipse_y									//椭圆上点y
.var	_ellipse_origin_x							//椭圆原点x
.var	_ellipse_origin_y							//椭圆原点y
/////////////////////////////////////
//	椭圆计算过程变量
////////////////////////////////////////
.var	_a_square_mul_y_square_l					//a平方乘以y平方
.var	_a_square_mul_y_square_h					//a平方乘以y平方
.var	_b_square_mul_x_square_l					//b平方乘以x平方
.var	_b_square_mul_x_square_h					//b平方乘以x平方
.var	_a_square_mul_b_square_l					//a平方乘以y平方
.var	_a_square_mul_b_square_h					//b平方乘以x平方
.var	_public_a									//public a
.var	_public_b									//public b
.var	_public_a_squ_mul_b_squ_l					//public a平方乘以b平方
.var	_public_a_squ_mul_b_squ_h					//public b平方乘以b平方
.var	_public_sbc_l								//减法过程低位
.var	_public_sbc_h								//减法过程高位
.var	_public_c_l									//public 
.var	_public_c_h									//public 
.var	_public_d_l									//public
.var	_public_d_h									//public
.var	_ellipse_x_temp								//public
.var	_ellipse_y_temp								//public
.var	_public_offset_in_a_l						//输入
.var	_public_offset_in_a_h						//输入
.var	_public_offset_in_b_l						//输入
.var	_public_offset_in_b_h						//输入
.var	_public_offset_in_c_l						//输入b2x2
.var	_public_offset_in_c_h						//输入b2x2
.var	_public_offset_out_l						//输出
.var	_public_offset_out_h						//输出
.var	_sign										//符号
.var	_ellipse_reckon_offset_first_l				//椭圆计偏移量X-1，Y-1
.var	_ellipse_reckon_offset_first_h				//椭圆计偏移量X-1，Y-1
.var	_ellipse_reckon_offset_second_l				//椭圆计偏移量
.var	_ellipse_reckon_offset_second_h				//椭圆计偏移量
.var	_ellipse_reckon_offset_sign					//椭圆计偏移量符号
.var	_process_sign								//两个数比较大小标志	
//////////////////
//字变量
//////////////////
.var	charnum										//字符序号
.var	charwide									//字符宽度
.var	charhigh									//字符高
.var	char_mod
.var	chartemp
.var	constant
//////////////////
//字符串变量
//////////////////
.var	str_tab										//字符串起始地址
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
//.define	_page_place_bit				label3				//点在PAGE place上位置
//.define	_page						label3+1				//点所在PAGE
//.define	_page_place					label3+2				//点在PAGE上 place
//.define _x							label3+3
//.define _y							label3+4
//.define	_public_offset_x			label3+5				//点X坐标偏移量
//.define	_public_offset_y			label3+6				//点Y坐标偏移量
//.define	_public_area_sign			label3+7				//点坐标显示范围标志
//.define	_point_value				label3+8				//点的值
//.define	_point_value_temp	   		label3+9				//点值临时寄存器
//.define	_point_shape	 	  		label3+10

.var	_page_place_bit		//		label3				//点在PAGE place上位置
.var	_page			//			label3+1				//点所在PAGE
.var	_page_place		//			label3+2				//点在PAGE上 place
.var _x					//		label3+3
.var _y					//		label3+4
.var	_public_offset_x		//	label3+5				//点X坐标偏移量
.var	_public_offset_y		//	label3+6				//点Y坐标偏移量
.var	_public_area_sign		//	label3+7				//点坐标显示范围标志
.var	_point_value			//	label3+8				//点的值
.var	_point_value_temp	   	//	label3+9				//点值临时寄存器
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
