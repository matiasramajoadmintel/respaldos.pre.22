object frmEstMantTorta: TfrmEstMantTorta
  Left = 60
  Top = 115
  Width = 591
  Height = 410
  Caption = 'Estad'#237'sticas de gastos en mantenimiento - Diagrama de torta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 348
    Width = 583
    Height = 35
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 0
    object Panel2: TPanel
      Left = 472
      Top = 1
      Width = 106
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 29
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Cerrar'
        TabOrder = 0
        Kind = bkClose
      end
    end
  end
  object DecisionGraph2: TDecisionGraph
    Left = 0
    Top = 0
    Width = 583
    Height = 348
    DecisionSource = frmEstMantenimiento.DecisionSource1
    Title.Text.Strings = (
      '')
    BottomAxis.Title.Caption = 'FECHA'
    LeftAxis.Title.Caption = 'IMPORTE'
    RightAxis.Title.Caption = 'IMPORTE'
    TopAxis.Title.Caption = 'FECHA'
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Series1: TPieSeries
      Active = False
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: FECHA'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1
      PieValues.Order = loNone
      Identifier = 'Template: FECHA'
      Style = 61
    end
    object Series2: TPieSeries
      Active = False
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: RUBRO'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1
      PieValues.Order = loNone
      Identifier = 'Template: RUBRO'
      Style = 61
    end
    object Series3: TPieSeries
      Active = False
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: PROVEEDOR'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1
      PieValues.Order = loNone
      Identifier = 'Template: PROVEEDOR'
      Style = 61
    end
    object Series4: TPieSeries
      Active = False
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: EDIFICIO'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1
      PieValues.Order = loNone
      Identifier = 'Template: EDIFICIO'
      Style = 61
    end
  end
end
