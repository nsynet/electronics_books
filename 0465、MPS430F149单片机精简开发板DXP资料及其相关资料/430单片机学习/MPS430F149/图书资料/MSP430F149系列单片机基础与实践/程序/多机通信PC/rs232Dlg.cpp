// rs232Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "rs232.h"
#include "rs232Dlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRs232Dlg dialog

CRs232Dlg::CRs232Dlg(CWnd* pParent /*=NULL*/)
	: CDialog(CRs232Dlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRs232Dlg)
	m_d1 = _T("");
	m_d2 = _T("");
	m_add = 0;
	m_select = FALSE;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CRs232Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRs232Dlg)
	DDX_Text(pDX, IDC_EDIT1, m_d1);
	DDX_Text(pDX, IDC_EDIT2, m_d2);
	DDX_Control(pDX, IDC_MSCOMM1, m_ctrlComm);
	DDX_Text(pDX, IDC_EDIT4, m_add);
	DDX_Check(pDX, IDC_CHECK1, m_select);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CRs232Dlg, CDialog)
	//{{AFX_MSG_MAP(CRs232Dlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, Onsent)
	ON_BN_CLICKED(IDC_BUTTON2, OnCLR1)
	ON_BN_CLICKED(IDC_BUTTON3, OnCLR2)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRs232Dlg message handlers

BOOL CRs232Dlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
		if(m_ctrlComm.GetPortOpen())
        m_ctrlComm.SetPortOpen(FALSE);

    m_ctrlComm.SetCommPort(1); //选择com1
    m_ctrlComm.SetInBufferSize(1024);
	m_ctrlComm.SetOutBufferSize(512);
	if( !m_ctrlComm.GetPortOpen())
        m_ctrlComm.SetPortOpen(TRUE);//打开串口
    else
        AfxMessageBox("cannot open serial port");
    m_ctrlComm.SetSettings("19200,S,8,1"); //波特率9600，无校验，8个数据位，1个停止位 

	m_ctrlComm.SetParityReplace("");
    m_ctrlComm.SetInputMode(1); //1：表示以二进制方式检取数据
    m_ctrlComm.SetRThreshold(1); 
    //参数1表示每当串口接收缓冲区中有多于或等于1个字符时将引发一个接收数据的OnComm事件
    m_ctrlComm.SetInputLen(0); //设置当前接收区数据长度为0
    m_ctrlComm.GetInput();//先预读缓冲区以清除残留数据
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CRs232Dlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CRs232Dlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CRs232Dlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CRs232Dlg::Onsent() 
{
	UpdateData(TRUE);
	char  flag=0;
//	int temp1=0;
	char temp=0;
//	temp1=m_bb;
	if(m_select==1){ 
		               if(flag==0)
					   {
							m_ctrlComm.SetSettings("19200,M,8,1");
							temp=m_add;
							CByteArray array;     
							array.RemoveAll();
							array.SetSize(1);
							array.SetAt(0, temp);
							m_ctrlComm.SetOutput(COleVariant(array)); // 发送数据
							flag=1;
							m_select=0;
							UpdateData(FALSE);
							return ;
					   }
					}//波特率9600，无校验，8个数据位，1个停止位 
	UpdateData(FALSE);
    UpdateData(TRUE);
	char TxData[100];
    int Count = m_d1.GetLength();

	for(int i = 0; i < Count; i++)
		TxData[i] = m_d1.GetAt(i);
    CByteArray array;     
    array.RemoveAll();
    array.SetSize(Count);

    for(i=0;i<Count;i++)
	    array.SetAt(i, TxData[i]);
	m_ctrlComm.SetSettings("19200,S,8,1");
    m_ctrlComm.SetOutput(COleVariant(array)); // 发送数据
}
BEGIN_EVENTSINK_MAP(CRs232Dlg, CDialog)
    //{{AFX_EVENTSINK_MAP(CRs232Dlg)
	ON_EVENT(CRs232Dlg, IDC_MSCOMM1, 1 /* OnComm */, OnOnCommMscomm1, VTS_NONE)
	//}}AFX_EVENTSINK_MAP
END_EVENTSINK_MAP()

void CRs232Dlg::OnOnCommMscomm1() 
{
	// TODO: Add your control notification handler code here
		VARIANT variant_inp;
    COleSafeArray safearray_inp;
    LONG len,k;
    BYTE rxdata[2048]; //设置BYTE数组 An 8-bit integer,that is not signed.
 
	
    if(m_ctrlComm.GetCommEvent()==2) //事件值为2表示接收缓冲区内有字符
    {             ////////以下你可以根据自己的通信协议加入处理代码
        variant_inp=m_ctrlComm.GetInput(); //读缓冲区
        safearray_inp=variant_inp; //VARIANT型变量转换为ColeSafeArray型变量
        len=safearray_inp.GetOneDimSize(); //得到有效数据长度
        for(k=0;k<len;k++)
            safearray_inp.GetElement(&k,rxdata+k);//转换为BYTE型数组
        for(k=0;k<len;k++) //将数组转换为Cstring型变量
        {
			CString str;
            BYTE bt=*(char*)(rxdata+k); //字符型
          /*  if(m_ctrlHexDisplay.GetCheck())
			{
				
				str.Format("%02X ",bt);
				
			}
			else*/
				str.Format("%c",bt); //将字符送入临时变量strtemp存放
            m_d2+=str; //加入接收编辑框对应字符串 
        }
    }
	
    UpdateData(FALSE); //更新编辑框内容
	
}

void CRs232Dlg::OnCLR1() 
{
	// TODO: Add your control notification handler code here
		m_d1.Empty();
	UpdateData(FALSE);
	
}

void CRs232Dlg::OnCLR2() 
{
	// TODO: Add your control notification handler code here
		m_d2.Empty();
	UpdateData(FALSE);
}

void CRs232Dlg::OnOK() 
{
	// TODO: Add extra validation here
	
	CDialog::OnOK();
}
