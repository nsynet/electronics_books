unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Chart, ComCtrls,
  OleCtrls, MSCommLib_TLB, Menus, Grids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    showsh1: TShape;
    showsh2: TShape;
    showsh3: TShape;
    showsh4: TShape;
    showsh5: TShape;
    Label3: TLabel;
    showlab1: TLabel;
    showlab2: TLabel;
    showlab3: TLabel;
    showlab4: TLabel;
    MSComm1: TMSComm;
    Label8: TLabel;
    msclab1: TLabel;
    operbut: TBitBtn;
    showbut1: TBitBtn;
    showbut2: TBitBtn;
    showbut3: TBitBtn;
    showbut4: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    repabut: TBitBtn;
    outbut: TBitBtn;
    msclab2: TLabel;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure outbutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure operbutClick(Sender: TObject);
    procedure showbut1Click(Sender: TObject);
    procedure showbut2Click(Sender: TObject);
    procedure showbut3Click(Sender: TObject);
    procedure showbut4Click(Sender: TObject);
    procedure repabutClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
   operate_ok: boolean;
   show1_ok:boolean;
   show2_ok:boolean;
   show3_ok:boolean;
   show4_ok:boolean;
   cont_ok:boolean;
   show6_ok:boolean;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit3;
{$R *.dfm}

procedure TForm1.outbutClick(Sender: TObject);
begin
 if(operate_ok) then
   begin
     showmessage('请先关闭串口')
      end
   else
    begin
     close;
     end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 {操作按钮赋值操作 }
showbut1.Caption:=showlab1.caption;
showbut2.Caption:=showlab2.caption;
showbut3.Caption:=showlab3.caption;
showbut4.Caption:=showlab4.caption;
 { 指示灯颜色操作}
showsh1.Brush.Color:=clred;
showsh2.Brush.Color:=clred;
showsh3.Brush.Color:=clred;
showsh4.Brush.Color:=clred;
showsh5.Brush.Color:=clred;
 { 操作按钮使能}
showbut1.Enabled:=false;
showbut2.Enabled:=false;
showbut3.Enabled:=false;
showbut4.Enabled:=false;
 repabut.Enabled :=false;
 { 内部操作真值赋值}
operate_ok:=false;
show1_ok:=false;
show2_ok:=false;
show3_ok:=false;
show4_ok:=false;
cont_ok:=false;
show6_ok:=false;
 { 串口操作知识}
msclab1.Visible :=false;
msclab2.Visible :=true;
panel1.Enabled :=false;
end;

procedure TForm1.operbutClick(Sender: TObject);
begin
if(operate_ok)  then
     begin
      operbut.Caption:= '打开串口';
      operate_ok:=false;
      mscomm1.PortOpen:=false;
      showbut1.Enabled:=false;
      showbut2.Enabled:=false;
      showbut3.Enabled:=false;
      showbut4.Enabled:=false;
       repabut.Enabled :=false;
      showsh5.Brush.Color:=clred;
      msclab1.Visible :=false;
       msclab2.Visible :=true;
      show1_ok:=false;
      show2_ok:=false;
      show3_ok:=false;
      show4_ok:=false;
     // cont_ok:=false;
      show6_ok:=false;
     end
  else
     begin
       operbut.Caption :='关闭串口';
       operate_ok:=true;
       showbut1.Enabled:=true;
       showbut2.Enabled:=true;
       showbut3.Enabled:=true;
       showbut4.Enabled:=true;
        repabut.Enabled :=true;
       mscomm1.PortOpen:=true;
       showsh5.Brush.Color:=cllime;
       msclab2.Visible :=false;
       msclab1.Visible :=true;
       show1_ok:=true;
       show2_ok:=true;
       show3_ok:=true;
       show4_ok:=true;
     //  cont_ok:=true;
       show6_ok:=true;
     end
end;

procedure TForm1.showbut1Click(Sender: TObject);
begin
   if(show1_ok) then
       begin
          showsh1.Brush.Color :=cllime;
          showsh2.Brush.Color :=clred;
          mscomm1.Output:=#65;
       end
end;

procedure TForm1.showbut2Click(Sender: TObject);
begin
   if(show2_ok) then
       begin
          showsh2.Brush.Color :=cllime;
          showsh1.Brush.Color :=clred;
           mscomm1.Output:=#66;
          end
end;

procedure TForm1.showbut3Click(Sender: TObject);
begin
   if(show3_ok) then
       begin
          showsh3.Brush.Color :=cllime;
          showsh4.Brush.Color :=clred;
          mscomm1.Output:=#67;
          end
end;

procedure TForm1.showbut4Click(Sender: TObject);
begin
   if(show4_ok) then
       begin
          showsh4.Brush.Color :=cllime;
          showsh3.Brush.Color :=clred;
          mscomm1.Output:=#68;
          end
end;

procedure TForm1.repabutClick(Sender: TObject);
begin
   if(cont_ok) then
       begin
              repabut.caption:='电机停止';
              cont_ok:=false;
              show1_ok:=true;
              show2_ok:=true;
              show3_ok:=true;
              show4_ok:=true;
              mscomm1.Output:=#70;
        end
    else
      begin
            repabut.caption:='电机启动';
            cont_ok:=true;
            showsh1.Brush.Color:=clred;
            showsh2.Brush.Color:=clred;
            showsh3.Brush.Color:=clred;
            showsh4.Brush.Color:=clred;
            show1_ok:=false;
            show2_ok:=false;
            show3_ok:=false;
            show4_ok:=false;
            mscomm1.Output:=#69;
      end
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
           form3.Show;
           form1.Enabled:=false;
end;

end.
