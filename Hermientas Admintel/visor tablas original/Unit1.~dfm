object Form1: TForm1
  Left = 1048
  Top = 262
  Width = 711
  Height = 556
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    678
    501)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 136
    Width = 681
    Height = 385
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 679
      Height = 383
      Align = alCustom
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 133
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    Color = clGradientActiveCaption
    TabOrder = 1
    object btn1: TButton
      Left = 16
      Top = 16
      Width = 105
      Height = 25
      Caption = 'Tabla a mostrar'
      TabOrder = 0
      OnClick = btn1Click
    end
    object Edit1: TEdit
      Left = 144
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object btn2: TButton
      Left = 288
      Top = 96
      Width = 75
      Height = 25
      Caption = 'subir data'
      TabOrder = 2
      OnClick = btn2Click
    end
    object Edit2: TEdit
      Left = 16
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object Edit3: TEdit
      Left = 152
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object Edit4: TEdit
      Left = 288
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object Edit5: TEdit
      Left = 424
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object Edit6: TEdit
      Left = 16
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object Edit7: TEdit
      Left = 152
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 8
    end
    object btn3: TButton
      Left = 280
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Agregar'
      TabOrder = 9
      OnClick = btn3Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 456
    Top = 16
  end
  object Query1: TQuery
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT * FROM persona')
    Left = 416
    Top = 16
  end
  object tbl1: TTable
    DatabaseName = 'DBAdmin'
    TableName = 'GRADO'
    Left = 488
    Top = 16
  end
  object tbl2: TTable
    DatabaseName = 'DBAdmin'
    FieldDefs = <
      item
        Name = 'IDGRADO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ABREVIATURA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TIEMPO_MINIMO'
        DataType = ftInteger
      end
      item
        Name = 'COD201'
        DataType = ftFloat
      end
      item
        Name = 'COD209'
        DataType = ftFloat
      end
      item
        Name = 'ORDEN'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'RESPALDO_GRADO'
    Left = 528
    Top = 16
  end
  object bm1: TBatchMove
    Destination = tbl2
    Source = tbl1
    Left = 568
    Top = 16
  end
  object ZConnection1: TZConnection
    Protocol = 'mysql-3.20'
    HostName = 'localhost'
    Port = 3306
    Database = 'admintel_test'
    User = 'root'
    AutoCommit = True
    ReadOnly = False
    TransactIsolationLevel = tiNone
    Connected = True
    SQLHourGlass = False
    Left = 608
    Top = 16
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    RequestLive = True
    CachedUpdates = False
    Active = True
    SQL.Strings = (
      'SELECT * FROM grado')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 376
    Top = 16
  end
  object ZTable1: TZTable
    Connection = ZConnection1
    RequestLive = True
    CachedUpdates = False
    TableName = 'grado'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 576
    Top = 96
  end
end
