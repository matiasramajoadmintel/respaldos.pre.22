object Form2: TForm2
  Left = 327
  Top = 191
  Width = 138
  Height = 95
  Caption = 'Form2'
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
    Left = 28
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Table1: TTable
    DatabaseName = 'ADB'
    TableName = 'TRABAJO'
    Left = 10
    Top = 2
    object Table1NRO_FACTURA: TStringField
      FieldName = 'NRO_FACTURA'
      Size = 15
    end
    object Table1NRO_FACT: TIntegerField
      FieldName = 'NRO_FACT'
    end
  end
end
