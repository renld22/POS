object dm: Tdm
  OldCreateOrder = False
  Height = 247
  Width = 411
  object MyConnection1: TMyConnection
    Database = 'dbpost1'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 64
    Top = 80
  end
  object Qtemp: TMyQuery
    Connection = MyConnection1
    Left = 96
    Top = 160
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 208
    Top = 88
  end
end
