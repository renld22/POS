unit Ulistbarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, MyAccess;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Bttambah: TButton;
    Btedit: TButton;
    Bthapus: TButton;
    Btrefresh: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Editcari: TEdit;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    DBGrid1: TDBGrid;
    DSbarang: TDataSource;
    Qbarang: TMyQuery;
    Qbarangkode_barang: TStringField;
    Qbarangnama_barang: TStringField;
    Qbarangdeskripsi: TStringField;
    Qbarangsatuan: TStringField;
    Qbarangstokawal: TFloatField;
    Qbarangstokmin: TFloatField;
    Qbaranghargajual: TFloatField;
    Qbarangflg_aktif: TSmallintField;
    Qbarangid: TIntegerField;
    procedure BttambahClick(Sender: TObject);
    procedure BteditClick(Sender: TObject);
    procedure BthapusClick(Sender: TObject);
    procedure BtrefreshClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditcariChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UDM, Myfunction, Ubarang1;

procedure TForm1.BteditClick(Sender: TObject);
begin
Application.CreateForm(TFbarang1,Fbarang1);
  status_simpan := 2;
  Fbarang1.Edkodebarang.Text := QBarangkode_barang.AsString;
  Fbarang1.Ednamabarang.Text := QBarangnama_barang.AsString;
  Fbarang1.Eddeskripsi.Text := QBarangdeskripsi.AsString;
  Fbarang1.cbsatuan.Text := QBarangsatuan.AsString;
  Fbarang1.Edstokawal.Text := FloatToStr(QBarangstokawal.AsFloat);
  Fbarang1.Edstokmin.Text := FloatToStr(QBarangstokmin.AsFloat);
  Fbarang1.Edhargajual.Text := FloatToStr(QBaranghargajual.AsFloat);
  Cflg_aktif := QBarangflg_aktif.AsInteger;
  Fbarang1.ShowModal;
  Fbarang1.Free;
end;

procedure TForm1.BthapusClick(Sender: TObject);
begin
if Application.MessageBox('Apakah anda yakin ingin menghapus data yang dipilih',
  'konfirmasi',
  MB_YESNO or MB_ICONINFORMATION)=idyes then
  begin
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM dbpost1.tbarang '+
         ' WHERE kode_barang= '+QuotedStr(QBarangkode_barang.AsString);
      Execute;
    end;
    BtrefreshClick(Sender);
  end;
end;

procedure TForm1.BtrefreshClick(Sender: TObject);
begin
  if QBarang.Active then
    QBarang.Refresh
  else
    QBarang.Open;
end;

procedure TForm1.BttambahClick(Sender: TObject);
begin
Application.CreateForm(TFbarang1,Fbarang1);
  status_simpan := 1;
  Cflg_aktif := 0;
  Fbarang1.Edkodebarang.Text := Autokode('kode_barang','tbarang','BR');
  Fbarang1.ShowModal;
  Fbarang1.Free;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
bteditclick(sender);
end;

procedure TForm1.EditcariChange(Sender: TObject);
begin
QBarang.MacroByName('WHERE').value:= 'WHERE kode_barang LIKE ' +Quotedstr('%'+Editcari.text+'%')+
'or nama_barang LIKE'+quotedstr('%'+editcari.text+'%');
if Qbarang.active  then
Qbarang.refresh
else
Qbarang.open;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
BtrefreshClick(sender);
end;

end.
