VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7410
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8400
   LinkTopic       =   "Form1"
   ScaleHeight     =   7410
   ScaleWidth      =   8400
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command4 
      Caption         =   "接收"
      Height          =   735
      Left            =   4200
      TabIndex        =   7
      Top             =   4320
      Width           =   3255
   End
   Begin VB.CommandButton Command3 
      Caption         =   "发送"
      Height          =   735
      Left            =   360
      TabIndex        =   6
      Top             =   4320
      Width           =   3135
   End
   Begin VB.CommandButton Command2 
      Caption         =   "关闭串口"
      Height          =   975
      Left            =   5040
      TabIndex        =   3
      Top             =   6360
      Width           =   1815
   End
   Begin VB.TextBox Text2 
      Height          =   3135
      Left            =   4200
      TabIndex        =   2
      Text            =   "Text2"
      Top             =   840
      Width           =   3375
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   2880
      Top             =   6240
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   2160
      Top             =   6120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   3
      DTREnable       =   -1  'True
   End
   Begin VB.CommandButton Command1 
      Caption         =   "打开串口"
      Height          =   1095
      Left            =   5040
      TabIndex        =   1
      Top             =   5160
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      Height          =   3135
      Left            =   360
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   840
      Width           =   3135
   End
   Begin VB.Label Label2 
      Caption         =   "发送窗口"
      Height          =   255
      Left            =   1560
      TabIndex        =   5
      Top             =   360
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "接收显示"
      Height          =   255
      Left            =   5520
      TabIndex        =   4
      Top             =   480
      Width           =   735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
 MSComm1.PortOpen = True
End Sub
Private Sub Command2_Click()
MSComm1.PortOpen = False
End Sub

Private Sub Command3_Click()
MSComm1.Output = Text1.Text
End Sub

Private Sub Command4_Click()
 If MSComm1.InBufferCount > 0 Then
'程序检查输入缓冲区中是否有数据，若有数据
  Text2.Text = Text2.Text + MSComm1.Input
'则将此数据读取后，指定给文本框的Text属性
 End If
End Sub

Private Sub Form_Load()
MSComm1.PortOpen = True
Command3_Click
End Sub
