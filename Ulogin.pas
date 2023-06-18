unit Ulogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFlogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogin: TFlogin;

implementation

{$R *.dfm}

uses Myfunction, UDM, Umainmneu;

procedure TFlogin.Button1Click(Sender: TObject);
begin
cNamaUser := Trim(Edit1.text);
cPassSHA1 := getmd5(Edit2.text);
with dm.Qtemp do
begin
  sql.Clear;
  sql.Add('select * from tuser where user='+QuotedStr(Edit1.Text));
  sql.Add('and password='+QuotedStr(cPassSha1));
  Open;
end;
if dm.Qtemp.Recordcount > 0 then
begin
  HakAkses:=dm.Qtemp.fieldbyname('hal_akses').AsString;
  PIC:=dm.Qtemp.fieldbyname('user').AsString;
  cUser_id := dm.Qtemp.fieldbyname('id').AsString;
  Flogin.Close;
  end
  else
  begin
  MessageDlg('user / password salah, anda belum beruntung silahkan coba kembali',mtWarning,[mbok],0);
  Edit1.Clear;
  Edit2.Clear;
  Edit1.Setfocus;
end;
  end;
procedure TFlogin.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

end.
