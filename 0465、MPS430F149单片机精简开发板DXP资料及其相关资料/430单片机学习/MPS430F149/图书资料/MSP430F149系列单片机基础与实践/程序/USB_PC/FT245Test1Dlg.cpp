// FT245Test1Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "FT245Test1.h"
#include "FT245Test1Dlg.h"
#include "FTD2XX.h"
#include "stdlib.h"

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
// CFT245Test1Dlg dialog

CFT245Test1Dlg::CFT245Test1Dlg(CWnd* pParent /*=NULL*/)
	: CDialog(CFT245Test1Dlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CFT245Test1Dlg)
	m_Value = 0;
	m_Rdata = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CFT245Test1Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CFT245Test1Dlg)
	DDX_Text(pDX, IDC_EDIT1, m_Value);
	DDV_MinMaxByte(pDX, m_Value, 0, 255);
	DDX_Text(pDX, IDC_EDIT2, m_Rdata);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CFT245Test1Dlg, CDialog)
	//{{AFX_MSG_MAP(CFT245Test1Dlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	ON_WM_CREATE()
	ON_BN_CLICKED(IDC_BUTTON2, OnButton2)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFT245Test1Dlg message handlers

BOOL CFT245Test1Dlg::OnInitDialog()
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
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CFT245Test1Dlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CFT245Test1Dlg::OnPaint() 
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
HCURSOR CFT245Test1Dlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CFT245Test1Dlg::OnButton1() 
{
	DWORD C;
	BOOL b;
	FT_STATUS Res;

	b = UpdateData();

	if (b != 0)
	{
		Res = FT_Write(Usb_hWnd,&m_Value,1,&C);
		if (Res != FT_OK)
		{
			MessageBox("发送数据错误!");
		}
	}
}



int CFT245Test1Dlg::OnCreate(LPCREATESTRUCT lpCreateStruct) 
{
	FT_STATUS Res;

	if (CDialog::OnCreate(lpCreateStruct) == -1)
		return -1;
	
	Res = FT_Open(0,&Usb_hWnd);
	if (Res != FT_OK)
	{
		MessageBox("打开设备错误!");
	}
	
	return 0;
}



BOOL CFT245Test1Dlg::DestroyWindow() 
{
	FT_Close(&Usb_hWnd);
	return CDialog::DestroyWindow();
}

void CFT245Test1Dlg::OnButton2() 
{
	FT_STATUS Res;
	DWORD Rx;
	DWORD Tx;
	DWORD Ev;
	DWORD Br;
	DWORD i;
	char RxBuffer[256];
	CString cs;

	Res = FT_GetStatus(Usb_hWnd,&Rx,&Tx,&Ev);
	if (Res != FT_OK)
	{
		MessageBox("查询状态出错!");
		return;
	}
	if (Rx > 0)
	{
		Res = FT_Read(Usb_hWnd,RxBuffer,Rx,&Br);
		if (Res != FT_OK)
		{
			MessageBox("接收出错!");
			return;
		}

		for (i=0;i<Rx;i++)
		{
			cs.Format("%d",RxBuffer[i]);
			m_Rdata = m_Rdata + cs + "\r\n";
		}
		UpdateData(FALSE);	
	}
}
