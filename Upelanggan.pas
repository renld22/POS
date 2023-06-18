unit Upelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFpelanggan = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edkodepelanggan: TEdit;
    Ednamapelanggan: TEdit;
    EdMemoalamat: TMemo;
    Ednotelpon: TEdit;
    Panel1: TPanel;
    Btcancel: TButton;
    Btsimpan: TButton;
    Splitter1: TSplitter;
    procedure BtsimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpelanggan: TFpelanggan;

implementation

{$R *.dfm}

uses Myfunction, UDM, Ulistpelanggan;

procedure TFpelanggan.BtsimpanClick(Sender: TObject);
begin
if edkodepelanggan.text='' then
begin
  messagedlg('kode pelanggan tidak boleh kosong',mtwarning,[mbok],0);
  exit;
end;
if ednamapelanggan.text='' then
begin
  messagedlg('nama pelanggan tidak boleh kosong',mtwarning,[mbok],0);
  exit;
end;
if ednotelpon.text='' then
begin
  messagedlg('no telp tidak boleh kosong',mtwarning,[mbok],0);
  exit;
end;
 //tambah
 if status_simpan=1 then
 begin
   with dm.qtemp do
   begin
     close;
     sql.clear;
     sql.Text:='insert into dbpost1.pelanggan(kode_pelanggan,nama_pelanggan,alamat,'+
     'no_telp)values('+
     quotedstr(edkodepelanggan.Text)+','+
     quotedstr(ednamapelanggan.text)+','+
     quotedstr(edmemoalamat.text)+','+
     quotedstr(ednotelpon.Text)+')';
     execute;
   end;
   messagedlg('tambah data berhasil',mtinformation,[mbok],0);
 end;
//edit
if status_simpan=2 then
begin
  with dm.qtemp do
  begin
    close;
    sql.clear;
    sql.text:='update dbpost1 .pelanggan set '+
    'nama_pelanggan= '+quotedstr(ednamapelanggan.text)+','+
    'alamat= '+quotedstr(edmemoalamat.text)+','+
    'no_telp= '+quotedstr(ednotelpon.text)+' '+
    'where kode_pelanggan= '+quotedstr (edkodepelanggan.text);
    execute;
  end;
  messagedlg('ubah data berhasil',mtinformation,[mbok],0);
end;
 Flistpelanggan.BtrefreshClick(sender);
 close;
end;

end.
