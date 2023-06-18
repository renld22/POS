unit Ubarang1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFbarang1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edkodebarang: TEdit;
    Ednamabarang: TEdit;
    Eddeskripsi: TEdit;
    Edstokawal: TEdit;
    Edstokmin: TEdit;
    Edhargajual: TEdit;
    Cbsatuan: TComboBox;
    chflg_aktif: TCheckBox;
    procedure chflg_aktifClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fbarang1: TFbarang1;

implementation

{$R *.dfm}

uses Myfunction, UDM, Ulistbarang;

procedure TFbarang1.Button2Click(Sender: TObject);
begin
  if edkodebarang.text='' then
 begin
   messagedlg('kode barang tidak boleh kosong',mtwarning,[mbok],0);
   exit;
 end;
 if ednamabarang.text='' then
 begin
 messagedlg('nama barang tidak boleh kosong',mtwarning,[mbok],0);
 exit;
end;
if eddeskripsi.text='' then
begin
  messagedlg('deskripsi barang tidak boleh kosong',mtwarning,[mbok],0);
end;
//tambah
if status_simpan=1 then
begin
  with dm.qtemp do
  begin
    close;
    sql.clear;
    sql.text:='insert into dbpost1.tbarang (kode_barang,nama_barang,deskripsi,'+
    'satuan,stokawal,stokmin,hargajual,flg_aktif)values('+
    quotedstr(edkodebarang.text)+','+
    quotedstr(ednamabarang.text)+','+
    quotedstr(eddeskripsi.text)+','+
    quotedstr(cbsatuan.text)+','+
    quotedstr(edstokawal.text)+','+
    quotedstr(edstokmin.text)+','+
    quotedstr(edhargajual.text)+','+
    inttostr (cflg_aktif)+')';
    execute;
  end;
  messagedlg('tambah data berhasil',mtinformation,[mbok],0);
  end;
// edit
if status_simpan=2 then
begin
  with dm.qtemp do
  begin
    close;
    sql.clear;
    sql.text:='update dbpost1 .tbarang set '+
    'nama_barang= '+quotedstr(ednamabarang.text)+','+
    'deskripsi= '  +quotedstr(eddeskripsi.text)+','+
    'satuan='  +quotedstr(cbsatuan.text)+','+
    'stokawal=' +quotedstr(edstokawal.text)+','+
    'stokmin=' +quotedstr(edstokmin.text)+','+
    'hargajual=' +quotedstr(edhargajual.text)+','+
    'flg_aktif=' +inttostr(cflg_aktif)+
    ' where kode_barang= '+quotedstr(edkodebarang.text);
    execute;
  end;
  messagedlg('ubah data berhasil',mtinformation,[mbok],0);
end;
form1.BtrefreshClick(sender);
close;
end;

procedure TFbarang1.chflg_aktifClick(Sender: TObject);
begin
if chflg_aktif.Checked then
cflg_aktif :=1
else
cflg_aktif :=0;

end;

procedure TFbarang1.FormShow(Sender: TObject);
begin
if cflg_aktif=1 then
chflg_aktif.Checked:=true
else
chflg_aktif.Checked:=false;
end;

end.
