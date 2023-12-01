// SPCE061A_ISP_PC_TOOLDlg.cpp : implementation file
//

#include "stdafx.h"
#include "SPCE061A_ISP_PC_TOOL.h"
#include "SPCE061A_ISP_PC_TOOLDlg.h"

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
// CSPCE061A_ISP_PC_TOOLDlg dialog

CSPCE061A_ISP_PC_TOOLDlg::CSPCE061A_ISP_PC_TOOLDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSPCE061A_ISP_PC_TOOLDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSPCE061A_ISP_PC_TOOLDlg)
	m_FileName = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CSPCE061A_ISP_PC_TOOLDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSPCE061A_ISP_PC_TOOLDlg)
	DDX_Control(pDX, IDC_COMMSEL, m_CommSel);
	DDX_Text(pDX, IDC_FILENAME, m_FileName);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CSPCE061A_ISP_PC_TOOLDlg, CDialog)
	//{{AFX_MSG_MAP(CSPCE061A_ISP_PC_TOOLDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_OPENFILE, OnOpenFile)
	ON_BN_CLICKED(IDC_DOWNLOAD, OnDownload)
	ON_BN_CLICKED(IDC_DISCONNECT, OnDisConnect)
	ON_BN_CLICKED(IDC_DUMP, OnDump)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSPCE061A_ISP_PC_TOOLDlg message handlers

BOOL CSPCE061A_ISP_PC_TOOLDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		pSysMenu->AppendMenu(MF_SEPARATOR);
		pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, "&About SPCE061A_ISP_PC_TOOL...");
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	/************************************************************************/
	/*                          Create Status Bar                           */
	/************************************************************************/
	CRect Rect;
	::GetClientRect(m_hWnd, Rect);
	m_StatusBar.Create(WS_CHILD|WS_VISIBLE|SBT_OWNERDRAW, Rect, this, 0);
	int strPartDim[]= {-1}; //·Ö¸îÊýÁ¿
	m_StatusBar.SetParts(sizeof(strPartDim)/sizeof(int), strPartDim);
	m_StatusBar.SetText("Detecting SPCE061A chip...", 0, 0);

	CString ComPort=AfxGetApp()->GetProfileString("Settings", "ComPort", "COM1");
	int nComSel = m_CommSel.FindString(0, ComPort);
	if(nComSel == -1)
	{
		nComSel = m_CommSel.AddString(ComPort);
	}
	m_CommSel.SetCurSel(nComSel);
	GetDlgItem(IDC_DOWNLOAD)->EnableWindow(FALSE);
	GetDlgItem(IDC_DUMP)->EnableWindow(FALSE);
	GetDlgItem(IDC_DISCONNECT)->EnableWindow(FALSE);
	SetTimer(0, 800, NULL);
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CSPCE061A_ISP_PC_TOOLDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CSPCE061A_ISP_PC_TOOLDlg::OnPaint() 
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
HCURSOR CSPCE061A_ISP_PC_TOOLDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CSPCE061A_ISP_PC_TOOLDlg::OnTimer(UINT nIDEvent) 
{
//	CString ComNameTbl[4] = {"COM1", "COM2", "COM3", "COM4"};
	static int QueryFailTime=0;

	// TODO: Add your message handler code here and/or call default
	switch(nIDEvent)
	{
	case 0:
		GetDlgItem(IDC_DOWNLOAD)->EnableWindow(FALSE);
		GetDlgItem(IDC_DISCONNECT)->EnableWindow(FALSE);
		//m_CommSel.GetLBText(m_CommSel.GetCurSel(), m_ISP.ComName);
		m_CommSel.GetWindowText(m_ISP.ComName);
		if(!m_ISP.ISP_Start())
		{
			m_StatusBar.SetText("COM port open ERROR!", 0, 0);
		}
		else
		{
			KillTimer(0);
			SetTimer(1, 300, NULL);
		}
		break;
	case 1:
		if(m_ISP.ISP_Query()==TRUE)
		{
			if(m_ISP.m_Status != ISP::IS_CONNECTED)
			{
				m_ISP.m_Status = ISP::IS_CONNECTED;
				m_StatusBar.SetText("SPCE061A chip connected.", 0, 0);
			}
			GetDlgItem(IDC_DOWNLOAD)->EnableWindow(TRUE);
			GetDlgItem(IDC_DUMP)->EnableWindow(TRUE);
			GetDlgItem(IDC_DISCONNECT)->SetWindowText("Disconnect");
			GetDlgItem(IDC_DISCONNECT)->EnableWindow(TRUE);
			QueryFailTime = 0;
			CString ComPort;
			m_CommSel.GetWindowText(ComPort);
			AfxGetApp()->WriteProfileString("Settings", "ComPort", ComPort);
		}
		else
		{
			if(QueryFailTime >= 3)
			{
				QueryFailTime = 0;
				m_StatusBar.SetText("No SPCE061A connected!", 0, 0);
				GetDlgItem(IDC_DOWNLOAD)->EnableWindow(FALSE);
				GetDlgItem(IDC_DUMP)->EnableWindow(FALSE);
				GetDlgItem(IDC_DISCONNECT)->EnableWindow(FALSE);
				KillTimer(1);
				SetTimer(0, 800, NULL);
			}
			else
			{
				QueryFailTime += 1;
			}
		}
		break;
	default:
		break;
	}
	CDialog::OnTimer(nIDEvent);
}

void CSPCE061A_ISP_PC_TOOLDlg::OnOpenFile() 
{
	// TODO: Add your control notification handler code here
	CFileDialog m_FileDlg(TRUE,NULL,NULL,OFN_HIDEREADONLY|OFN_OVERWRITEPROMPT,"*.tsk|*.tsk|||",this); 
	if(m_FileDlg.DoModal() == IDOK)
	{
		m_FileName = m_FileDlg.GetPathName();
		UpdateData(FALSE);
	}
}

BOOL CSPCE061A_ISP_PC_TOOLDlg::CheckFile(CString FileName)
{
	CStdioFile m_File;

	if(!m_File.Open(FileName,CFile::modeRead | CFile::typeText))
	{
		m_StatusBar.SetText("Error open file!", 0, 0);
		return FALSE;
	}

	if(m_File.GetLength() != 0x20000)
	{
		m_File.Close();
		m_StatusBar.SetText("Not an avilable file!", 0, 0);
		return FALSE;
	}
	CString LineBuf;
	if(!m_File.ReadString(LineBuf))
	{
		m_File.Close();
		m_StatusBar.SetText("Err read file!", 0, 0);
		return FALSE;
	}
	if(LineBuf.Find("SPCE060A_061A") == -1)
	{
		m_File.Close();
		m_StatusBar.SetText("Not an avilable file!", 0, 0);
		return FALSE;
	}
	m_File.Close();
	return TRUE;
}

void CSPCE061A_ISP_PC_TOOLDlg::DoDownload(CString FileName)
{
	CStdioFile m_File;
	char PageData[512];
	int ErrCount=0;
	CString Status;

	/// Open File
	if(!m_File.Open(FileName, CFile::modeRead | CFile::typeBinary))
	{
		m_StatusBar.SetText("Error open file!", 0, 0);
		return;
	}

	int i = 0x80;
	while(i <= 0xff)
	{
		if(i == 0xfc)
			i = 0xff;						// Skip 0xfc00~0xfdff
		Status.Format("Programming address 0x%2X00", i);
		m_StatusBar.SetText(Status, 0, 0);
		m_StatusBar.UpdateWindow();
		m_ISP.ISP_Erase(i);
		m_File.Seek(512 * i, SEEK_SET);
		m_File.Read(PageData, 512);
		for(int j = 0; j < 512; j++)					// Skip "All 0xffff" Pages
		{
			if((unsigned char)PageData[j]!=0x00)
				break;
		}
		if(j==512)
		{
			i++;
			continue;
		}
		if(i == 0xff)
		{
			PageData[0xf4 * 2] = PageData[0xf7 * 2];
			PageData[0xf4 * 2 + 1] = PageData[0xf7 * 2 + 1];
			PageData[0xf7 * 2] = (char)0x00;
			PageData[0xf7 * 2 + 1] = (char)0xfc;
		}
		//// Download ////
		switch(m_ISP.ISP_Download(PageData))
		{
		case ISP_NO_ERROR:						// Download successed
			ErrCount = 0;
			break;
		case ISP_TRANS_FAIL:					// TimeOut
			m_File.Close();
			return;
		case ISP_VERIFY_FAIL:					// TransError
			ErrCount++;
			if(ErrCount==3)
			{
				m_StatusBar.SetText("Data transfer ERROR!", 0, 0);
				m_File.Close();
				return;
			}
			else
			{
				continue;
			}
		default:
			break;
		}

		//// Program ////
		switch(m_ISP.ISP_Program((char)i))
		{
		case ISP_NO_ERROR:						// Successed
			break;
		case ISP_TRANS_FAIL:					// TimeOut
		case ISP_INVALID_PAGE:					// PageError
			m_StatusBar.SetText("Program FAILED!", 0, 0);
			m_File.Close();
			return;
		default:
			break;
		}

		//// Verify ////
		switch(m_ISP.ISP_Verify((char)i))
		{
		case ISP_NO_ERROR:						// Successed
			break;
		case ISP_TRANS_FAIL:					// TimeOut
		case ISP_INVALID_PAGE:					// PageError
			m_StatusBar.SetText("Program FAILED!", 0, 0);
			m_File.Close();
			return;
		case ISP_VERIFY_FAIL:					// Fail
			ErrCount++;
			if(ErrCount==3)
			{
				m_StatusBar.SetText("Data transfer ERROR!", 0, 0);
				m_File.Close();
				return;
			}
			else
			{
				m_File.Seek(-512,CFile::current);
				continue;
			}
		default:
			break;
		}
		i++;
	}
	
	m_File.Close();
	m_StatusBar.SetText("Program Done!", 0, 0);
}

void CSPCE061A_ISP_PC_TOOLDlg::OnDownload() 
{
	// TODO: Add your control notification handler code here
	GetDlgItem(IDC_DOWNLOAD)->EnableWindow(FALSE);
	KillTimer(1);
	UpdateData(TRUE);
	if(CheckFile(m_FileName))
	{
		DoDownload(m_FileName);
	}
	SetTimer(1, 300, NULL);
}

void CSPCE061A_ISP_PC_TOOLDlg::OnDisConnect() 
{
	// TODO: Add your control notification handler code here
	if(m_ISP.m_Status == ISP::IS_CONNECTED)
	{
		KillTimer(1);
		m_ISP.ISP_Close();
		GetDlgItem(IDC_DOWNLOAD)->EnableWindow(FALSE);
		GetDlgItem(IDC_DUMP)->EnableWindow(FALSE);
		GetDlgItem(IDC_DISCONNECT)->SetWindowText("Connect");
		m_StatusBar.SetText("Chip disconnected.", 0, 0);
	}
	else
	{
		SetTimer(0, 800, NULL);
	}
}

void CSPCE061A_ISP_PC_TOOLDlg::OnDump() 
{
	// TODO: Add your control notification handler code here
	char Buf[512];
	int ErrCount;
	CString Status;
	// TODO: Add your control notification handler code here
	CString SaveFile;
	CFileDialog m_FileDlg(FALSE, ".bin", NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, "*.bin|*.bin|||", this);
	if(m_FileDlg.DoModal() != IDOK)
		return;

	SaveFile = m_FileDlg.GetPathName();
	
	CStdioFile m_File;
	if(!m_File.Open(SaveFile, CFile::modeCreate | CFile::modeWrite | CFile::typeBinary))
	{
		m_StatusBar.SetText("Error creat file!", 0, 0);
		return;
	}

	GetDlgItem(IDC_DOWNLOAD)->EnableWindow(FALSE);
	UpdateWindow();
	ErrCount = 0;
	for(int i = 0x80; i <= 0xff; i++)
	{
		Status.Format("Dumping address 0x%2X00",i);
		m_StatusBar.SetText(Status, 0, 0);
		m_StatusBar.UpdateWindow();
		
		switch(m_ISP.ISP_Upload(Buf, (char)i))
		{
		case 0:									// Upload successed
			ErrCount = 0;
			m_File.Write(Buf, 512);
			break;
		case -1:								// Connect broken
			m_File.Close();
			m_StatusBar.SetText("Dump Failed!", 0, 0);
			return;
		case -2:								// Data Error
		case -3:
			ErrCount += 1;
			if(ErrCount == 3)
			{
				m_File.Close();
				m_StatusBar.SetText("Dump Failed!", 0, 0);
				return;
			}
			else
			{
				i--;
				continue;
			}
		default:
			break;
		}
	}
	m_File.Close();
	m_StatusBar.SetText("Dump Done!", 0, 0);
}
