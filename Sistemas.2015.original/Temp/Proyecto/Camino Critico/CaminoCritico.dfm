object frmCaminoCritico: TfrmCaminoCritico
  Left = 168
  Top = 126
  Width = 544
  Height = 375
  Caption = 'frmCaminoCritico'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 426
    Top = 26
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object IngresarA: TButton
    Left = 18
    Top = 14
    Width = 75
    Height = 25
    Caption = 'Ingresar A'
    TabOrder = 1
    OnClick = IngresarAClick
  end
  object IngresarB: TButton
    Left = 18
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Ingresar B'
    TabOrder = 2
    OnClick = IngresarBClick
  end
end
