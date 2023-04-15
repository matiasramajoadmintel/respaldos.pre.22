object Form1: TForm1
  Left = 275
  Top = 153
  Width = 870
  Height = 640
  Caption = '-'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 224
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 200
    Top = 312
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object tbl1: TTable
    Active = True
    AutoRefresh = True
    DatabaseName = 'ADB'
    TableName = 'COSTO_DEPTO_VACIO'
    Left = 104
    Top = 96
    object tbl1IDCOSTO_DEPTO_VACIO: TIntegerField
      FieldName = 'IDCOSTO_DEPTO_VACIO'
      Required = True
    end
    object tbl1IDLOCACION: TIntegerField
      FieldName = 'IDLOCACION'
      Required = True
    end
    object tbl1MES: TStringField
      FieldName = 'MES'
      Size = 10
    end
    object tbl1ANIO: TIntegerField
      FieldName = 'ANIO'
    end
    object tbl1MONTO_ADMIN: TFloatField
      FieldName = 'MONTO_ADMIN'
    end
    object tbl1MONTO_EXP: TFloatField
      FieldName = 'MONTO_EXP'
    end
    object tbl1IDTIPO_LOCACION: TIntegerField
      FieldName = 'IDTIPO_LOCACION'
      Required = True
    end
    object tbl1MONTO_EXP_EDIF: TFloatField
      FieldName = 'MONTO_EXP_EDIF'
      Required = True
    end
  end
  object ZConnection1: TZConnection
    Protocol = 'mysql-3.20'
    HostName = 'localhost'
    Port = 3306
    Database = 'admintel'
    User = 'root'
    AutoCommit = True
    ReadOnly = True
    TransactIsolationLevel = tiNone
    Connected = True
    SQLHourGlass = False
    Left = 560
    Top = 168
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    RequestLive = False
    CachedUpdates = False
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 320
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = tbl1
    Left = 360
    Top = 144
  end
end
