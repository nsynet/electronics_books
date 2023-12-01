//////////////////////////////////////////////////////////////////////////
.define	_public_area_x_l			0x00				//点X坐标显示范围
.define	_public_area_x_h			0x70				//点X坐标显示范围
.define	_public_area_y_l			0x00				//点y坐标显示范围
.define	_public_area_y_h			0x40				//点y坐标显示范围
//////////////////////////////////////////////////////////////////////////
.define	sign_zk_bank			0x08

.define	line_mode_bit_clear		0xffc7
.define	line_mode_bit			0x0038

.define	DRAW_COVER			0			//(default)
.define	DRAW_ERASE			1	
.define	DRAW_HOLLOW			2	
.define	DRAW_DOTTED			3	
.define	DRAW_HOLLOW_ERASE	4	
.define	DRAW_DOTTED_COVER	5	
.define	DRAW_SOLID_XOR		6	
.define	DRAW_DOTTED_XOR		7

.define	draw_mode_COVER			0x0000
.define	draw_mode_ERASE			0x0008
.define	draw_mode_HOLLOW		0x0010
.define	draw_mode_DOTTED		0x0018
.define	draw_mode_HOLLOW_ERASE	0x0020
.define	draw_mode_DOTTED_COVER	0x0028
.define	draw_mode_SOLID_XOR		0x0030
.define	draw_mode_DOTTED_XOR	0x0038


.define	DG_LINE_COVER			0			//(default)
.define	DG_LINE_ERASE			1	
.define	DG_LINE_HOLLOW			2	
.define	DG_LINE_DOTTED			3	
.define	DG_LINE_HOLLOW_ERASE	4	
.define	DG_LINE_DOTTED_COVER	5	
.define	DG_LINE_SOLID_XOR		6	
.define	DG_LINE_DOTTED_XOR		7

.define	line_mode_COVER			0x0000
.define	line_mode_ERASE			0x0008
.define	line_mode_HOLLOW		0x0010
.define	line_mode_DOTTED		0x0018
.define	line_mode_HOLLOW_ERASE	0x0020
.define	line_mode_DOTTED_COVER	0x0028
.define	line_mode_SOLID_XOR		0x0030
.define	line_mode_DOTTED_XOR	0x0038

.define	DG_RECT_COVER			0		//(default)
.define	DG_RECT_ERASE			1		//
.define	DG_RECT_HOLLOW			2		//
.define	DG_RECT_DOTTED			3		//
.define	DG_RECT_HOLLOW_ERASE	4		//
.define	DG_RECT_DOTTED_COVER	5		//
.define	DG_RECT_SOLID_XOR		6		//
.define	DG_RECT_DOTTED_XOR		7	

.define	rect_mode_COVER			0x0000
.define	rect_mode_ERASE			0x0008
.define	rect_mode_HOLLOW		0x0010
.define	rect_mode_DOTTED		0x0018
.define	rect_mode_HOLLOW_ERASE	0x0020
.define	rect_mode_DOTTED_COVER	0x0028
.define	rect_mode_SOLID_XOR		0x0030
.define	rect_mode_DOTTED_XOR	0x0038

.define	bmp_mode_bit_clear		0xfe3f
.define	bmp_mode_bit			0x01c0

.define	DG_BMP_COVER			0		
.define	DG_BMP_CLEAR			1		
.define	DG_BMP_XOR				2

.define	BMP_mode_COVER			0x0000		
.define	BMP_mode_CLEAR			0x0100		
.define	BMP_mode_XOR			0x00c0

.define	dotted_mode_bit_clear	0xffc3
.define	dotted_mode_bit			0x003c

.define	DG_PIXEL_COVER			0		//(default)
.define	DG_PIXEL_CLEAR			1	
.define	DG_PIXEL_XOR			2

.define	pixel_mode_COVER		0x0000		
.define	pixel_mode_CLEAR		0x0008		
.define	pixel_mode_XOR			0x0030