这些库函数代码由网友 依心爱婷 根据我们开发板的实例代码修改而来，对习惯使用库函数的朋友会是一个很好的参考，再此对 依心爱婷 表示衷心的感谢！
代码使用MDK4.12编译器，所以大家想要是用库函数版本的例程，请先安装MDK4.12（不用卸载MDK3.80A，他们可以共存）。

另外，实例28和29因为芯片容量的问题，无法改成库函数的。

特别提醒：当您的开发板LCD版本为1.8及以后版本的时候，LCD的背光控制需要修改极性。把LCD_Init函数里面倒数第二句Clr_LED，修改为Set_LED！！！
