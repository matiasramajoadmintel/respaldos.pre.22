object Form1: TForm1
  Left = 120
  Top = 94
  Width = 568
  Height = 389
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 560
    Height = 89
    Align = alTop
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 19
      Top = 9
      Width = 121
      Height = 22
      Caption = 'Generar TXT Cod. 375'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 147
      Top = 9
      Width = 121
      Height = 22
      Caption = 'Guardar en un archivo'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 19
      Top = 33
      Width = 121
      Height = 22
      Caption = 'Generar TXT Cod. 418'
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 147
      Top = 33
      Width = 121
      Height = 22
      Caption = 'Salir'
      OnClick = SpeedButton4Click
    end
    object Label1: TLabel
      Left = 304
      Top = 13
      Width = 39
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 304
      Top = 39
      Width = 39
      Height = 13
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton5: TSpeedButton
      Left = 19
      Top = 57
      Width = 121
      Height = 22
      Caption = 'Totales'
      OnClick = SpeedButton5Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 560
    Height = 273
    Align = alClient
    BorderWidth = 3
    TabOrder = 1
    object Memo1: TMemo
      Left = 4
      Top = 4
      Width = 552
      Height = 265
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Database1: TDatabase
    AliasName = 'DBDescuentos'
    DatabaseName = 'DBDesc'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 48
    Top = 80
  end
  object qry375: TQuery
    DatabaseName = 'DBDesc'
    SQL.Strings = (
      'SELECT * FROM Cod375_01')
    Left = 48
    Top = 121
    object qry375MATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'DBDESC.Cod375_01.MATRICULA'
      Size = 7
    end
    object qry375IMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'DBDESC.Cod375_01.IMPORTE'
      DisplayFormat = '#.00'
      EditFormat = '#.00'
    end
    object qry375MES: TStringField
      FieldName = 'MES'
      Origin = 'DBDESC.Cod375_01.MES'
      Size = 6
    end
    object qry375CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBDESC.Cod375_01.CODIGO'
      Size = 3
    end
  end
  object qry418: TQuery
    DatabaseName = 'DBDesc'
    SQL.Strings = (
      'SELECT * FROM Cod418_01')
    Left = 88
    Top = 121
    object qry418MATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'DBDESC.Cod418_01.MATRICULA'
      Size = 7
    end
    object qry418IMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'DBDESC.Cod418_01.IMPORTE'
    end
    object qry418MES: TStringField
      FieldName = 'MES'
      Origin = 'DBDESC.Cod418_01.MES'
      Size = 6
    end
    object qry418CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBDESC.Cod418_01.CODIGO'
      Size = 3
    end
  end
  object qry418Resto: TQuery
    DatabaseName = 'DBDesc'
    SQL.Strings = (
      'SELECT * FROM Cod418_03_04')
    Left = 130
    Top = 125
    object qry418RestoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'DBDESC.Cod418_03_04.MATRICULA'
      Size = 7
    end
    object qry418RestoIMPORTE: TIntegerField
      FieldName = 'IMPORTE'
      Origin = 'DBDESC.Cod418_03_04.IMPORTE'
    end
    object qry418RestoMES: TStringField
      FieldName = 'MES'
      Origin = 'DBDESC.Cod418_03_04.MES'
      Size = 6
    end
    object qry418RestoCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBDESC.Cod418_03_04.CODIGO'
      Size = 3
    end
  end
  object qry299: TQuery
    DatabaseName = 'DBDesc'
    SQL.Strings = (
      'SELECT * FROM Cod299')
    Left = 48
    Top = 160
    object qry299MATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'DBDESC.Cod299.MATRICULA'
    end
    object qry299MONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'DBDESC.Cod299.MONTO'
    end
    object qry299CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBDESC.Cod299.CODIGO'
      Size = 4
    end
  end
end
