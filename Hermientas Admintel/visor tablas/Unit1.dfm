object Form1: TForm1
  Left = 878
  Top = 357
  Width = 696
  Height = 502
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    663
    447)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 105
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    Color = clGradientActiveCaption
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 16
      Width = 57
      Height = 25
      Caption = 'Tabla'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 80
      Top = 16
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object Button2: TButton
      Left = 336
      Top = 16
      Width = 57
      Height = 25
      Caption = 'copy data'
      TabOrder = 2
      OnClick = Button2Click
    end
    object btn1: TButton
      Left = 405
      Top = 16
      Width = 33
      Height = 25
      Caption = 'xls'
      TabOrder = 3
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 16
      Top = 48
      Width = 57
      Height = 25
      Caption = 'Campo'
      TabOrder = 4
    end
    object Edit2: TEdit
      Left = 80
      Top = 48
      Width = 161
      Height = 21
      TabOrder = 5
    end
    object btn3: TButton
      Left = 248
      Top = 16
      Width = 75
      Height = 25
      Caption = 'count'
      TabOrder = 6
      OnClick = btn3Click
    end
    object Edit3: TEdit
      Left = 248
      Top = 48
      Width = 73
      Height = 21
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 104
    Width = 681
    Height = 345
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 679
      Height = 343
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 520
    Top = 16
  end
  object Query1: TQuery
    AutoCalcFields = False
    DatabaseName = 'ADB'
    SQL.Strings = (
      'Select * from persona')
    Left = 488
    Top = 16
  end
  object tbl1: TTable
    DatabaseName = 'DBAdmin'
    TableName = 'GRADO'
    Left = 552
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
    Left = 592
    Top = 16
  end
  object bm1: TBatchMove
    Destination = tbl2
    Source = tbl1
    Left = 632
    Top = 16
  end
  object Query2: TQuery
    Active = True
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT COUNT(TIPO) FROM DEPARTAMENTO')
    Left = 448
    Top = 16
  end
end
