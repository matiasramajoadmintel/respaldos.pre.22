object Form2: TForm2
  Left = 673
  Top = 434
  Width = 302
  Height = 293
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
  object btn1: TButton
    Left = 184
    Top = 16
    Width = 75
    Height = 25
    Caption = 'subir data'
    TabOrder = 0
    OnClick = btn1Click
  end
  object Edit2: TEdit
    Left = 24
    Top = 21
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 24
    Top = 57
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 24
    Top = 93
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 24
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edit6: TEdit
    Left = 24
    Top = 164
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edit7: TEdit
    Left = 24
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object ZTable1: TZTable
    Connection = Form1.ZConnection1
    RequestLive = False
    CachedUpdates = False
    TableName = 'grado'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 200
    Top = 152
  end
  object ZQuery1: TZQuery
    Connection = Form1.ZConnection1
    RequestLive = False
    CachedUpdates = False
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 192
    Top = 104
  end
end
