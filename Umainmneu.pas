unit Umainmneu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFmainmenu = class(TForm)
    MainMenu1: TMainMenu;
    file1: TMenuItem;
    file2: TMenuItem;
    ulistbarang1: TMenuItem;
    listbarang1: TMenuItem;
    pelanggan1: TMenuItem;
    listpelanggan1: TMenuItem;
    supplier1: TMenuItem;
    supplier2: TMenuItem;
    listpembelian1: TMenuItem;
    pembelian2: TMenuItem;
    penjualan1: TMenuItem;
    listpenjualan1: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure file1Click(Sender: TObject);
    procedure ulistbarang1Click(Sender: TObject);
    procedure listbarang1Click(Sender: TObject);
    procedure pelanggan1Click(Sender: TObject);
    procedure listpelanggan1Click(Sender: TObject);
    procedure supplier1Click(Sender: TObject);
    procedure supplier2Click(Sender: TObject);
    procedure listpembelian1Click(Sender: TObject);
    procedure pembelian2Click(Sender: TObject);
    procedure penjualan1Click(Sender: TObject);
    procedure listpenjualan1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmainmenu: TFmainmenu;

implementation

{$R *.dfm}

uses Ulogin, Ubarang1, Ulistbarang, Upelanggan, Ulistpelanggan, Usupplier,
  Ulistsupplier, Ulistpembelian, Upembelian, Upenjualan, Ulistpenjualan;

procedure TFmainmenu.file1Click(Sender: TObject);
begin
 application.terminate;
end;

procedure TFmainmenu.FormShow(Sender: TObject);
begin
 application.createform(tflogin,flogin);
 flogin.show;
end;

procedure TFmainmenu.listbarang1Click(Sender: TObject);
begin
application.createform(tform1,form1);
form1.show;
end;

procedure TFmainmenu.listpelanggan1Click(Sender: TObject);
begin
 application.createform(tflistpelanggan,flistpelanggan);
 flistpelanggan.show;
end;

procedure TFmainmenu.listpembelian1Click(Sender: TObject);
begin
  application.createform(tflistpembelian,flistpembelian);
  flistpembelian.show;
end;

procedure TFmainmenu.listpenjualan1Click(Sender: TObject);
begin
 application.createform(tflistpenjualan,flistpenjualan);
  flistpenjualan.show;
end;


procedure TFmainmenu.pelanggan1Click(Sender: TObject);
begin
application.createform(tfpelanggan,fpelanggan);
fpelanggan.show;
end;

procedure TFmainmenu.pembelian2Click(Sender: TObject);
begin
application.createform(tfpembelian,fpembelian);
  fpembelian.show;
end;


procedure TFmainmenu.penjualan1Click(Sender: TObject);
begin
application.createform(tfpenjualan,fpenjualan);
  fpenjualan.show;
end;

procedure TFmainmenu.supplier1Click(Sender: TObject);
begin
application.createform(tfsupplier,fsupplier);
fsupplier.show;
end;

procedure TFmainmenu.supplier2Click(Sender: TObject);
begin
application.createform(tflistsupplier,Flistsupplier);
Flistsupplier.show;
end;

procedure TFmainmenu.ulistbarang1Click(Sender: TObject);
begin
application.createform(tfbarang1,Fbarang1);
fbarang1.show;
end;

end.
