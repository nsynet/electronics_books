// ISP.h: interface for the ISP class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ISP_H__4F040754_0888_48C9_A0D9_D691AA2DE3C6__INCLUDED_)
#define AFX_ISP_H__4F040754_0888_48C9_A0D9_D691AA2DE3C6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class ISP  
{
public:
	int ISP_MassErase();
	void ISP_Close();
	int ISP_Upload(char *Buf, char Page);
	int ISP_Program(char Page);
	int ISP_Verify(char Page);
	int ISP_Erase(char Page);
	int ISP_Download(char *Buf);
	BOOL ISP_Query();
	enum {IS_IDLE = 0, IS_CREATED = 1, IS_OPENED = 2, IS_CONNECTED = 3} m_Status;
	CString ComName;
	BOOL ISP_Start();
	ISP();
	virtual ~ISP();

private:
	BOOL ISP_Rx(char *Buf, DWORD Lenth);
	void ISP_Tx(char *Buf, DWORD Length);
	void ISP_Wait(DWORD ms);
	DCB CommPort;
	HANDLE hComm;
};

#define ISP_BAUDRATE			57600

#define ISP_NO_ERROR			0
#define ISP_TRANS_FAIL			-1
#define ISP_VERIFY_FAIL			-2
#define ISP_INVALID_PAGE		-3


#endif // !defined(AFX_ISP_H__4F040754_0888_48C9_A0D9_D691AA2DE3C6__INCLUDED_)
