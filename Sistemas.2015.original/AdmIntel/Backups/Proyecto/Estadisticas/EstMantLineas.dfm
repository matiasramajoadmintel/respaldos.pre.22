object frmEstMantLineas: TfrmEstMantLineas
  Left = 60
  Top = 115
  Width = 591
  Height = 410
  Caption = 'Estad'#237'sticas de gastos en mantenimiento - Diagrama de lineas'
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
    View3D = False
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Series1: TLineSeries
      Active = False
      ColorEachPoint = True
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: FECHA'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
      Identifier = 'Template: FECHA'
      Style = 61
    end
    object Series2: TLineSeries
      Active = False
      ColorEachPoint = True
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: RUBRO'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
      Identifier = 'Template: RUBRO'
      Style = 61
    end
    object Series3: TLineSeries
      Active = False
      ColorEachPoint = True
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: PROVEEDOR'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
      Identifier = 'Template: PROVEEDOR'
      Style = 61
    end
    object Series4: TLineSeries
      Active = False
      ColorEachPoint = True
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: EDIFICIO'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
      Identifier = 'Template: EDIFICIO'
      Style = 61
    end
  end
end
