// ISP.cpp: implementation of the ISP class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "ISP.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

ISP::ISP()
{
	m_Status = IS_IDLE;
}

ISP::~ISP()
{
	ISP_Close();
}

void ISP::ISP_Wait(DWORD ms)
{
	Sleep(ms);
}

BOOL ISP::ISP_Start()
{
	BOOL ret;
	BOOL ErrFlag = FALSE;
	
	if(m_Status)
	{
		CloseHandle(hComm);
	}
	if ((hComm=CreateFile (ComName, GENERIC_READ|GENERIC_WRITE,0, NULL, OPEN_EXISTING, 0, NULL)) == INVALID_HANDLE_VALUE)
	{
		m_Status = IS_IDLE;
		return FALSE;
	}

    m_Status = IS_CREATED;

	GetCommState(hComm, &CommPort);

	CommPort.BaudRate = ISP_BAUDRATE;
	CommPort.fParity = TRUE;
	CommPort.fOutxCtsFlow = FALSE;
	CommPort.fOutxDsrFlow = FALSE;
	CommPort.fDtrControl = RTS_CONTROL_DISABLE;			// ROMT=0
	CommPort.fDsrSensitivity = FALSE;
	CommPort.fTXContinueOnXoff = FALSE;
	CommPort.fOutX = FALSE;
	CommPort.fInX = FALSE;
	CommPort.fErrorChar = FALSE;
	CommPort.fNull= TRUE;
	CommPort.fRtsControl = RTS_CONTROL_DISABLE;			// RESETB=1
	CommPort.fAbortOnError = FALSE;
	CommPort.wReserved=0;
	CommPort.ByteSize=8;
	CommPort.Parity=EVENPARITY;
	CommPort.StopBits=ONESTOPBIT;
	CommPort.fBinary = TRUE;
	ret=SetCommState(hComm,&CommPort);
	if(!ret)ErrFlag = TRUE;

    ret=SetupComm(hComm,0x20,0x20);
	if(!ret)ErrFlag = TRUE;

	PurgeComm(hComm,PURGE_RXCLEAR|PURGE_TXCLEAR);

	if(ErrFlag)
		return FALSE;
	else
	{
		m_Status = IS_OPENED;
		return TRUE;
	}
	
}

void ISP::ISP_Tx(char *Buf, DWORD Length)
{
	DWORD len;

	WriteFile(hComm, Buf, Length, &len, NULL);
}


BOOL ISP::ISP_Rx(char *Buf, DWORD Lenth)
{
	COMMTIMEOUTS CommTimeOuts;
	DWORD ReadLenth;

	if(m_Status < IS_OPENED) return FALSE;

	CommTimeOuts.ReadIntervalTimeout = 20;
	CommTimeOuts.ReadTotalTimeoutConstant = 20;
	CommTimeOuts.ReadTotalTimeoutMultiplier = 20;
	
	SetCommTimeouts(hComm, &CommTimeOuts);
	ReadFile(hComm, Buf, Lenth, &ReadLenth, NULL);

	if(ReadLenth<Lenth)
	{
		ISP_Close();
		return FALSE;
	}
	else
		return TRUE;

}

BOOL ISP::ISP_Query()
{
	char RxBuf[2];

	ISP_Tx("QR",2);
	if(ISP_Rx(RxBuf,2)==TRUE)
	{
		if(RxBuf[0]=='C' && RxBuf[1]=='N')
		{
			GetCommState(hComm,&CommPort);
			CommPort.fNull = FALSE;
			SetCommState(hComm,&CommPort);
			return TRUE;
		}
	}

	return FALSE;
}

int ISP::ISP_Download(char *Buf)
{
	char RxBuf[2];
	char SumBuf[4];
	DWORD Sum=0;

	ISP_Tx("DL",2);
	if(ISP_Rx(RxBuf,2)==FALSE)
		return ISP_TRANS_FAIL;

	if(RxBuf[0]!='D' || RxBuf[1]!='R')
		return ISP_TRANS_FAIL;
	
	for(int i=0; i<512; i+=2)
	{
		Sum += (unsigned char)Buf[i];
		Sum += ((unsigned char)Buf[i+1])<<8;
	}
	SumBuf[0] = (char)(Sum&0xff);
	SumBuf[1] = (char)((Sum&0xff00)>>8);
	SumBuf[2] = (char)((Sum&0xff0000)>>16);
	SumBuf[3] = (char)((Sum&0xff000000)>>24);

	ISP_Tx(Buf, 512);
	ISP_Tx(SumBuf, 4);
	
	if(ISP_Rx(RxBuf,2)==FALSE)
		return ISP_TRANS_FAIL;
	if(RxBuf[0]=='D' && RxBuf[1]=='E')			// TransError
		return ISP_VERIFY_FAIL;
	if(RxBuf[0]=='D' && RxBuf[1]=='S')			// Successed
		return ISP_NO_ERROR;
	else
		return ISP_TRANS_FAIL;
}

int ISP::ISP_Erase(char Page)
{
	char RxBuf[2];

	ISP_Tx("ER",2);
	if(ISP_Rx(RxBuf,2)==FALSE)
		return ISP_TRANS_FAIL;
	if(RxBuf[0]!='W' || RxBuf[1]!='E')			// Successed
		return ISP_TRANS_FAIL;
	ISP_Tx(&Page, 1);
	ISP_Wait(50);
	if(ISP_Rx(RxBuf,2)==FALSE)
		return ISP_TRANS_FAIL;
	if(RxBuf[0]=='E' && RxBuf[1]=='S')			// Successed
		return ISP_NO_ERROR;
	if(RxBuf[0]=='E' && RxBuf[1]=='F')			// Erase Failed
		return ISP_VERIFY_FAIL;
	if(RxBuf[0]=='E' && RxBuf[1]=='P')			// Invalid Page
		return ISP_INVALID_PAGE;
	else
		return ISP_TRANS_FAIL;
}

int ISP::ISP_Verify(char Page)
{
	char RxBuf[2];

	ISP_Tx("VF",2);
	ISP_Tx(&Page,1);
	if(ISP_Rx(RxBuf,2)==FALSE)
		return ISP_TRANS_FAIL;
	if(RxBuf[0]=='V' && RxBuf[1]=='S')			// successed
		return ISP_NO_ERROR;
	if(RxBuf[0]=='V' && RxBuf[1]=='F')			// Verify failed
		return ISP_VERIFY_FAIL;
	if(RxBuf[0]=='V' && RxBuf[1]=='P')			// Invalid Page
		return ISP_INVALID_PAGE;
	else
		return ISP_TRANS_FAIL;
}


int ISP::ISP_Program(char Page)
{
	char RxBuf[2];

	ISP_Tx("PG",2);
	ISP_Tx(&Page,1);
	
	if(ISP_Rx(RxBuf,2)==FALSE)
		return ISP_TRANS_FAIL;
	if(RxBuf[0]=='P' && RxBuf[1]=='S')			// successed
		return ISP_NO_ERROR;
	if(RxBuf[0]=='P' && RxBuf[1]=='P')			// Invalid Page
		return ISP_INVALID_PAGE;
	else
		return ISP_TRANS_FAIL;
}


int ISP::ISP_Upload(char *Buf, char Page)
{
	char RxBuf[2];
	unsigned char SumBuf[4];
	DWORD Sum=0, Sum2=0;

	ISP_Tx("UL",2);
	ISP_Tx(&Page,1);

	if(ISP_Rx(RxBuf,2)==FALSE)
		return ISP_TRANS_FAIL;
	if(RxBuf[0]=='U' && RxBuf[1]=='P')			// Invalid Page
		return ISP_INVALID_PAGE;
	if(RxBuf[0]=='U' && RxBuf[1]=='R')			// Upload Ready
	{
		if(ISP_Rx(Buf,512)==FALSE)
			return ISP_TRANS_FAIL;
		if(ISP_Rx((char*)SumBuf,4)==FALSE)
			return ISP_TRANS_FAIL;
		for(int i=0;i<512;i+=2)
		{
			Sum += (unsigned char)Buf[i];
			Sum += ((unsigned char)Buf[i+1])<<8;
		}
		Sum2 = (DWORD)SumBuf[0] + ((DWORD)SumBuf[1]<<8) + ((DWORD)SumBuf[2]<<16) + ((DWORD)SumBuf[3]<<24);
		if(Sum==Sum2)
			return ISP_NO_ERROR;				// Successed
		else
			return ISP_VERIFY_FAIL;				// Failed
	}
	else
		return ISP_TRANS_FAIL;
}

void ISP::ISP_Close()
{
	if(m_Status)
		CloseHandle(hComm);
	m_Status = IS_IDLE;
}

int ISP::ISP_MassErase()
{
	char RxBuf[2];

	ISP_Tx("ME",2);
	ISP_Wait(3000);
	if(ISP_Rx(RxBuf,2)==FALSE)
		return ISP_TRANS_FAIL;
	if(RxBuf[0]=='M' && RxBuf[1]=='S')			// Successed
		return ISP_NO_ERROR;
	if(RxBuf[0]=='M' && RxBuf[1]=='F')			// Erase Failed
		return ISP_VERIFY_FAIL;
	else
		return ISP_TRANS_FAIL;
}
