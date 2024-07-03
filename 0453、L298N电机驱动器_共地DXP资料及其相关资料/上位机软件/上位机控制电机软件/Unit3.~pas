unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
form1.showbut1.Caption:=edit1.Text;
form1.showbut2.Caption:=edit2.Text;
form1.showbut3.Caption:=edit3.Text;
form1.showbut4.Caption:=edit4.Text;
form1.showlab1.caption:=edit1.Text;
form1.showlab2.caption:=edit2.Text;
form1.showlab3.caption:=edit3.Text;
form1.showlab4.caption:=edit4.Text;
form1.show;
  form1.Enabled:=true;
form3.Hide ;
close;
end;

end.
