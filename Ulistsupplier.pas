unit Ulistsupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, MyAccess;

type
  TFlistsupplier = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Btambah: TButton;
    Btedit: TButton;
    Bthapus: TButton;
    Btrefresh: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Splitter5: TSplitter;
    Edcari: TEdit;
    DBGrid1: TDBGrid;
    DSsupplier: TDataSource;
    Qsupplier: TMyQuery;
    Qsupplierkode_supplier: TStringField;
    Qsuppliernama_supplier: TStringField;
    Qsupplieralamat: TMemoField;
    Qsupplierno_telp: TStringField;
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
  Flistsupplier: TFlistsupplier;

implementation

{$R *.dfm}

uses Myfunction, UDM, Usupplier;

procedure TFlistsupplier.BtambahClick(Sender: TObject);
begin
application.createform(TFsupplier,Fsupplier);
status_simpan := 1;
cflg_aktif :=0;
Fsupplier.edkodesupplier.text := autokode('kode_supplier','supplier','pl');
fsupplier.showmodal;
fsupplier.free;

end;

procedure TFlistsupplier.BteditClick(Sender: TObject);
begin
application.createform(tfsupplier,fsupplier);
status_simpan :=2;
fsupplier.Edkodesupplier.text:= qsupplierkode_supplier.asstring;
fsupplier.Ednamasupplier.text:= qsuppliernama_supplier.asstring;
fsupplier.Ednotelpon.text:= qsupplierno_telp.asstring;
fsupplier.edmemoalamat.text:= qsupplieralamat.asstring;
Fsupplier.ShowModal;
fsupplier.free;

end;

procedure TFlistsupplier.BthapusClick(Sender: TObject);
begin
 if application.MessageBox('apakah anda yakin ingin mengahapus data yang dipilih',
'konfirmasi',
MB_YESNO or MB_ICONINFORMATION)=idyes then
begin
with dm.Qtemp do
begin
  close;
  sql.Clear;
  sql.Text:='DELETE FROM dbpost1.supplier '+
  'WHERE kode_supplier= '+quotedstr (qsupplierkode_supplier.AsString);
  execute;
end;
btrefreshclick(sender);

end;
end;

procedure TFlistsupplier.BtrefreshClick(Sender: TObject);
begin
edcari.clear;
qsupplier.MacroByName('WHERE').Value:='';
if Qsupplier.Active then
qsupplier.Refresh
else
qsupplier.Open;

 end;
procedure TFlistsupplier.DBGrid1DblClick(Sender: TObject);
begin
bteditclick(sender);
end;

procedure TFlistsupplier.EdcariChange(Sender: TObject);
begin
qsupplier.MacroByName('where').Value:= 'where kode_supplier like '+
  quotedstr('%'+edcari.text+'%')+
 ' or nama_supplier like '+quotedstr('%'+edcari.text+'%');
 if qsupplier.active then
 qsupplier.Refresh
 else
 qsupplier.open;

end;

procedure TFlistsupplier.FormShow(Sender: TObject);
begin
btrefreshclick(sender);
end;

end.
