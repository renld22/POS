unit Ulistpenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, MemDS, DBAccess, MyAccess;

type
  TFlistpenjualan = class(TForm)
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
    Qpenjualan: TMyQuery;
    DSpenjualan: TDataSource;
    Qpenjualankode_penjualan: TStringField;
    Qpenjualantgl_penjualan: TDateField;
    Qpenjualankode_pelanggan: TStringField;
    Qpenjualanno_bukti: TStringField;
    Qpenjualannama_pelanggan: TStringField;
    Qpenjualantotal: TFloatField;
    Qpenjualanbayar: TFloatField;
    Qpenjualankembali: TFloatField;
    procedure BteditClick(Sender: TObject);
    procedure BthapusClick(Sender: TObject);
    procedure BtrefreshClick(Sender: TObject);
    procedure BtambahClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdcariChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flistpenjualan: TFlistpenjualan;

implementation

{$R *.dfm}

uses UDM, Myfunction, Upenjualan;

procedure TFlistpenjualan.BtambahClick(Sender: TObject);
begin
Application.CreateForm(Tfpenjualan,Fpenjualan);
  status_simpan := 1;
  Cflg_aktif := 0;
  Fpenjualan.Edkodepenjualan.Text := Autokode('kode_penjualan','tpenjualan_master','PJ');
  Fpenjualan.Dtpenjualan.DateTime := Now;
  Fpenjualan.ShowModal;
  Fpenjualan.Free;
end;

procedure TFlistpenjualan.BteditClick(Sender: TObject);
begin
Application.CreateForm(TFpenjualan,Fpenjualan);
  status_simpan := 2;
  //master
  Fpenjualan.edkodepenjualan.Text := Qpenjualankode_penjualan.AsString;
  Fpenjualan.Dtpenjualan.DateTime := Qpenjualantgl_penjualan.AsDateTime;
  Fpenjualan.Edkodepelanggan.Text := Qpenjualankode_pelanggan.AsString;
  Fpenjualan.cbnama_pelanggan.Text := Qpenjualannama_pelanggan.AsString;
  Fpenjualan.Ednobukti.Text := Qpenjualanno_bukti.AsString;
  Fpenjualan.Edtotal.Text :=FloatToStr(Qpenjualantotal.AsFloat);
  Fpenjualan.Edbayar.Text :=FloatToStr(Qpenjualanbayar.AsFloat);
  Fpenjualan.Edkembali.Text :=FloatToStr(Qpenjualankembali.AsFloat);
  //detail
  with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select tpd.*,tb.nama_barang,tb.satuan from tpenjualan_detail tpd '+
       ' INNER JOIN tbarang tb ON tb.kode_barang=tpd.kode_barang '+
       ' WHERE tpd.kode_penjualan='+QuotedStr(Qpenjualankode_penjualan.AsString);
       Open;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        with Fpenjualan do
        begin
          CDS1.Insert;
          CDS1kode_barang.Text := FieldByName('kode_barang').AsString;
          CDS1nama_barang.Text := FieldByName('nama_barang').AsString;
          CDS1satuan.Text := FieldByName('satuan').AsString;
          CDS1harga_jual.AsFloat := FieldByName('harga_jual').AsFloat;
          CDS1qty.AsFloat := FieldByName('qty').AsFloat;
          CDS1sub_total.AsFloat := FieldByName('sub_total').AsFloat;
          CDS1.Post;
        end;
        dm.Qtemp.Next;
      end;
    end;
  Fpenjualan.ShowModal;
  Fpenjualan.Free;
end;


procedure TFlistpenjualan.BthapusClick(Sender: TObject);
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
      SQL.Text:='DELETE FROM dbpost1.tpenjualan_master '+
         ' WHERE kode_penjualan= '+QuotedStr(Qpenjualankode_penjualan.AsString);
      Execute;
    end;
    //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM dbpost1.tpenjualan_detail '+
         ' WHERE kode_penjualan= '+QuotedStr(Qpenjualankode_penjualan.AsString);
      Execute;
    end;
    btrefreshClick(Sender);
  end;
end;



procedure TFlistpenjualan.BtrefreshClick(Sender: TObject);
begin
Edcari.Clear;
  Qpenjualan.MacroByName('WHERE').Value:='';
  if Qpenjualan.Active then
    Qpenjualan.Refresh
  else
    Qpenjualan.Open;
end;

procedure TFlistpenjualan.DBGrid1DblClick(Sender: TObject);
begin
bteditClick(Sender);
end;

procedure TFlistpenjualan.EdcariChange(Sender: TObject);
begin
Qpenjualan.MacroByName('WHERE').Value:= 'WHERE tpm.kode_penjualan LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR tpm.kode_pelanggan LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR tp.nama_pelanggan LIKE '+QuotedStr('%'+Edcari.Text+'%');
  if Qpenjualan.Active then
    Qpenjualan.Refresh
  else
    Qpenjualan.Open;

end;

procedure TFlistpenjualan.FormShow(Sender: TObject);
begin
btrefreshClick(Sender);
end;

end.
