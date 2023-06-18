unit Ulistpelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, MyAccess,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFlistpelanggan = class(TForm)
    Qpelanggan: TMyQuery;
    DSpelanggan: TDataSource;
    Panel1: TPanel;
    Btambah: TButton;
    Btedit: TButton;
    Bthapus: TButton;
    Btrefresh: TButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Panel2: TPanel;
    Label1: TLabel;
    Splitter5: TSplitter;
    Edcari: TEdit;
    DBGrid1: TDBGrid;
    Qpelanggankode_pelanggan: TStringField;
    Qpelanggannama_pelanggan: TStringField;
    Qpelangganalamat: TMemoField;
    Qpelangganno_telp: TStringField;
    procedure BtambahClick(Sender: TObject);
    procedure BteditClick(Sender: TObject);
    procedure BthapusClick(Sender: TObject);
    procedure BtrefreshClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdcariChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flistpelanggan: TFlistpelanggan;

implementation

{$R *.dfm}

uses UDM, Myfunction, Upelanggan;

procedure TFlistpelanggan.BtambahClick(Sender: TObject);
begin
application.createform(TFpelanggan,Fpelanggan);
status_simpan := 1;
cflg_aktif :=0;
Fpelanggan.edkodepelanggan.text := autokode('kode_pelanggan','pelanggan','pl');
fpelanggan.showmodal;
fpelanggan.free;
end;

procedure TFlistpelanggan.BteditClick(Sender: TObject);
begin
application.createform(tfpelanggan,fpelanggan);
status_simpan :=2;
fpelanggan.Edkodepelanggan.text:= qpelanggankode_pelanggan.asstring;
fpelanggan.Ednamapelanggan.text:= qpelanggannama_pelanggan.asstring;
fpelanggan.Ednotelpon.text:= qpelangganno_telp.asstring;
fpelanggan.edmemoalamat.text:= qpelangganalamat.asstring;
Fpelanggan.ShowModal;
fpelanggan.free;

end;

procedure TFlistpelanggan.BthapusClick(Sender: TObject);
begin
if application.MessageBox('apakah anda yakin ingin mengahapus data yang dipilih',
'konfirmasi',
MB_YESNO or MB_ICONINFORMATION)=idyes then
begin
with dm.Qtemp do
begin
  close;
  sql.Clear;
  sql.Text:='DELETE FROM dbpost1.pelanggan '+
  'WHERE kode_pelanggan= '+quotedstr (qpelanggankode_pelanggan.AsString);
  execute;
end;
btrefreshclick(sender);
end;
 end;
procedure TFlistpelanggan.BtrefreshClick(Sender: TObject);
begin
edcari.clear;
qpelanggan.MacroByName('WHERE').Value:='';
if Qpelanggan.Active then
qpelanggan.Refresh
else
qpelanggan.Open;

end;

procedure TFlistpelanggan.DBGrid1DblClick(Sender: TObject);
begin
bteditclick(sender);

end;

procedure TFlistpelanggan.EdcariChange(Sender: TObject);
begin
qpelanggan.MacroByName('where').Value:= 'where kode_pelanggan like '+
  quotedstr('%'+edcari.text+'%')+
 ' or nama_pelanggan like '+quotedstr('%'+edcari.text+'%');
 if qpelanggan.active then
 qpelanggan.Refresh
 else
 qpelanggan.open;

end;

procedure TFlistpelanggan.FormShow(Sender: TObject);
begin
btrefreshclick(sender);

end;

end.
