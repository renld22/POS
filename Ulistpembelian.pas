unit Ulistpembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, MyAccess;

type
  TFlistpembelian = class(TForm)
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
    c: TDBGrid;
    Qpembelian: TMyQuery;
    DSpembelian: TDataSource;
    Qpembeliankode_pembelian: TStringField;
    Qpembeliantgl_pembelian: TDateField;
    Qpembeliankode_supplier: TStringField;
    Qpembelianno_bukti: TStringField;
    Qpembeliannama_supplier: TStringField;
    procedure BtambahClick(Sender: TObject);
    procedure BteditClick(Sender: TObject);
    procedure BthapusClick(Sender: TObject);
    procedure BtrefreshClick(Sender: TObject);
    procedure cDblClick(Sender: TObject);
    procedure EdcariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flistpembelian: TFlistpembelian;

implementation

{$R *.dfm}

uses UDM, Myfunction, Upembelian;

procedure TFlistpembelian.BtambahClick(Sender: TObject);
begin
 Application.CreateForm(TFpembelian,Fpembelian);
  status_simpan := 1;
  Cflg_aktif := 0;
  Fpembelian.edkodepembelian.Text := Autokode('kode_pembelian','tpembelian_master','PO');
  Fpembelian.Dtpembelian.DateTime := Now;
  Fpembelian.ShowModal;
  Fpembelian.Free;

end;

procedure TFlistpembelian.BteditClick(Sender: TObject);
begin
Application.CreateForm(TFpembelian,Fpembelian);
  status_simpan := 2;
  //master
  Fpembelian.Edkodepembelian.Text := Qpembeliankode_pembelian.AsString;
  Fpembelian.Dtpembelian.DateTime := Qpembeliantgl_pembelian.AsDateTime;
  Fpembelian.Edkodesupplier.Text := Qpembeliankode_supplier.AsString;
  Fpembelian.cbnama_supplier.Text := Qpembeliannama_supplier.AsString;
  Fpembelian.ednobukti.Text := Qpembelianno_bukti.AsString;
  //detail
  with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select tpd.*,tb.nama_barang,tb.satuan from tpembelian_detail tpd '+
       ' INNER JOIN tbarang tb ON tb.kode_barang=tpd.kode_barang '+
       ' WHERE tpd.kode_pembelian='+QuotedStr(Qpembeliankode_pembelian.AsString);
       Open;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        with Fpembelian do
        begin
          CDS1.Insert;
          CDS1kode_barang.Text := FieldByName('kode_barang').AsString;
          CDS1nama_barang.Text := FieldByName('nama_barang').AsString;
          CDS1satuan.Text := FieldByName('satuan').AsString;
          CDS1harga_beli.AsFloat := FieldByName('harga_beli').AsFloat;
          CDS1qty.AsFloat := FieldByName('qty').AsFloat;
          CDS1sub_total.AsFloat := FieldByName('sub_total').AsFloat;
          CDS1.Post;
        end;
        dm.Qtemp.Next;
      end;
    end;
  Fpembelian.ShowModal;
  Fpembelian.Free;
end;



procedure TFlistpembelian.BthapusClick(Sender: TObject);
begin
if Application.MessageBox('Apakah anda yakin ingin menghapus data yang dipilih',
  'konfirmasi',
  MB_YESNO or MB_ICONINFORMATION)=idyes then
  begin
    //MASTER
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM dbpost1.tpembelian_master '+
         ' WHERE kode_pembelian= '+QuotedStr(Qpembeliankode_pembelian.AsString);
      Execute;
    end;
    //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM dbpost1.tpembelian_detail '+
         ' WHERE kode_pembelian= '+QuotedStr(Qpembeliankode_pembelian.AsString);
      Execute;
    end;
    btrefreshClick(Sender);
  end;
end;

procedure TFlistpembelian.BtrefreshClick(Sender: TObject);
begin
Edcari.Clear;
  Qpembelian.MacroByName('WHERE').Value:='';
  if Qpembelian.Active then
    Qpembelian.Refresh
  else
    Qpembelian.Open;

end;



procedure TFlistpembelian.cDblClick(Sender: TObject);
begin
bteditClick(Sender);
end;

procedure TFlistpembelian.EdcariChange(Sender: TObject);
begin
Qpembelian.MacroByName('WHERE').Value:= 'WHERE tpm.kode_pembelian LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR tpm.kode_supplier LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR ts.nama_supplier LIKE '+QuotedStr('%'+Edcari.Text+'%');
  if Qpembelian.Active then
    Qpembelian.Refresh
  else
    Qpembelian.Open;
  end;



procedure TFlistpembelian.FormShow(Sender: TObject);
begin
btrefreshClick(Sender);
end;

end.
