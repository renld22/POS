program Pdbpost;

uses
  Vcl.Forms,
  Ulogin in 'Ulogin.pas' {Flogin},
  UDM in 'UDM.pas' {dm: TDataModule},
  Myfunction in 'Myfunction.pas',
  Umainmneu in 'Umainmneu.pas' {Fmainmenu},
  Ulistbarang in 'Ulistbarang.pas' {Form1},
  Ubarang1 in 'Ubarang1.pas' {Fbarang1},
  Ulistpelanggan in 'Ulistpelanggan.pas' {Flistpelanggan},
  Upelanggan in 'Upelanggan.pas' {Fpelanggan},
  Ulistsupplier in 'Ulistsupplier.pas' {Flistsupplier},
  Usupplier in 'Usupplier.pas' {Fsupplier},
  Ulistpembelian in 'Ulistpembelian.pas' {Flistpembelian},
  Upembelian in 'Upembelian.pas' {Fpembelian},
  Ulistpenjualan in 'Ulistpenjualan.pas' {Flistpenjualan},
  Upenjualan in 'Upenjualan.pas' {Fpenjualan},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Cyan Dusk');
  Application.CreateForm(TFmainmenu, Fmainmenu);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
