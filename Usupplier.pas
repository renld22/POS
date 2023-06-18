unit Usupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFsupplier = class(TForm)
    Edkodesupplier: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Ednamasupplier: TEdit;
    EdMemoalamat: TMemo;
    Ednotelpon: TEdit;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Btcancel: TButton;
    Btsimpan: TButton;
    procedure BtsimpanClick(Sender: TObject);
    procedure BtcancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fsupplier: TFsupplier;

implementation

{$R *.dfm}

uses Myfunction, UDM, Ulistsupplier;

procedure TFsupplier.BtcancelClick(Sender: TObject);
begin
close;
end;

procedure TFsupplier.BtsimpanClick(Sender: TObject);
begin
if edkodesupplier.text='' then
begin
  messagedlg('kode supplier tidak boleh kosong',mtwarning,[mbok],0);
  exit;
end;
if ednamasupplier.text='' then
begin
  messagedlg('nama supplier tidak boleh kosong',mtwarning,[mbok],0);
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
     sql.Text:='insert into dbpost1.supplier(kode_supplier,nama_supplier,alamat,'+
     'no_telp)values('+
     quotedstr(edkodesupplier.Text)+','+
     quotedstr(ednamasupplier.text)+','+
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
    sql.text:='update dbpost1.supplier set '+
    'nama_supplier='+quotedstr(ednamasupplier.text)+','+
    'alamat='+quotedstr(edmemoalamat.text)+','+
    'no_telp='+quotedstr(ednotelpon.text)+' '+
    'where kode_supplier='+quotedstr (edkodesupplier.text);
    execute;
  end;
  messagedlg('ubah data berhasil',mtinformation,[mbok],0);
  end;
 Flistsupplier.BtrefreshClick(sender);
Close;

end;



end.
