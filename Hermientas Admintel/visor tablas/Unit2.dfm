object Form2: TForm2
  Left = 337
  Top = 181
  Width = 696
  Height = 480
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    688
    453)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 57
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    Color = clGradientActiveCaption
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 16
      Width = 105
      Height = 25
      Caption = 'Tabla a mostrar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 144
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 64
    Width = 681
    Height = 385
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 679
      Height = 383
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
    Left = 328
    Top = 16
  end
  object Query1: TQuery
    Active = True
    AutoCalcFields = False
    DatabaseName = 'DBAdmin'
    SQL.Strings = (
      'SELECT * FROM persona')
    Left = 368
    Top = 16
  end
end
