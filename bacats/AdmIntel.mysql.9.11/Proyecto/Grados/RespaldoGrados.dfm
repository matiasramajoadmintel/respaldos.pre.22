object Form2: TForm2
  Left = 907
  Top = 347
  Width = 724
  Height = 362
  Caption = '\'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdGridRespaldo: TDBGrid
    Left = 0
    Top = 0
    Width = 689
    Height = 329
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qry1: TQuery
    Active = True
    DatabaseName = 'DBAdmin'
    SQL.Strings = (
      'SELECT * FROM GRADO')
    Left = 136
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = qry1
    Left = 192
    Top = 192
  end
end
