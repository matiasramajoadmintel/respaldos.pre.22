object frmEstServicios: TfrmEstServicios
  Left = 44
  Top = 35
  Width = 697
  Height = 484
  Caption = 'frmEstServicios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 235
    Width = 689
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  object DecisionGrid1: TDecisionGrid
    Left = 0
    Top = 0
    Width = 689
    Height = 235
    Options = [cgGridLines, cgOutliner]
    DefaultColWidth = 100
    DefaultRowHeight = 20
    CaptionColor = clActiveCaption
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clCaptionText
    CaptionFont.Height = -11
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = []
    DataColor = clInfoBk
    DataSumColor = clNone
    DataFont.Charset = DEFAULT_CHARSET
    DataFont.Color = clWindowText
    DataFont.Height = -11
    DataFont.Name = 'MS Sans Serif'
    DataFont.Style = []
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'MS Sans Serif'
    LabelFont.Style = []
    LabelColor = clBtnFace
    LabelSumColor = clInactiveCaption
    DecisionSource = DecisionSource1
    Dimensions = <
      item
        FieldName = 'FECHA_PAGO'
        Color = clNone
        Alignment = taCenter
        Subtotals = True
      end
      item
        FieldName = 'RAZON_SOCIAL'
        Color = clNone
        Alignment = taCenter
        Subtotals = True
      end
      item
        FieldName = 'SUM'
        Color = clNone
        Alignment = taCenter
        Subtotals = True
      end>
    Totals = True
    ShowCubeEditor = False
    Align = alTop
    Color = clBtnFace
    GridLineWidth = 1
    GridLineColor = clWindowText
    TabOrder = 0
  end
  object DecisionGraph1: TDecisionGraph
    Left = 0
    Top = 240
    Width = 689
    Height = 187
    DecisionSource = DecisionSource1
    Title.Text.Strings = (
      'TDecisionGraph')
    View3D = False
    Align = alClient
    TabOrder = 1
    object Series2: TBarSeries
      Active = False
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: FECHA_PAGO'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1
      YValues.Order = loNone
      Identifier = 'Template: FECHA_PAGO'
      Style = 61
    end
    object Series3: TBarSeries
      Active = False
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: RAZON_SOCIAL'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1
      YValues.Order = loNone
      Identifier = 'Template: RAZON_SOCIAL'
      Style = 61
    end
    object Series4: TBarSeries
      Active = False
      ColorEachPoint = True
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = '1D Template: FECHA_PAGO'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1
      YValues.Order = loNone
      Identifier = '1D Template: FECHA_PAGO'
      Style = 40
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 427
    Width = 689
    Height = 30
    Align = alBottom
    TabOrder = 2
    object Panel2: TPanel
      Left = 602
      Top = 1
      Width = 86
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 10
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Cerrar'
        TabOrder = 0
        Kind = bkClose
      end
    end
  end
  object DecisionCube1: TDecisionCube
    DataSet = DecisionQuery1
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftDateTime
        Fieldname = 'FECHA_PAGO'
        BaseName = 'VW_SERV_EDIF.FECHA_PAGO'
        Name = 'FECHA_PAGO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binMonth
        ValueCount = 3
        Active = True
        StartValue = 37622
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'RAZON_SOCIAL'
        BaseName = 'VW_SERV_EDIF.RAZON_SOCIAL'
        Name = 'RAZON_SOCIAL'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 28
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'SUM'
        BaseName = 'VW_SERV_EDIF.COSTO'
        Name = 'SUM'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 2
    MaxSummaries = 10
    MaxCells = 0
    Left = 570
    Top = 142
  end
  object DecisionSource1: TDecisionSource
    DecisionCube = DecisionCube1
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 568
    Top = 172
    DimensionCount = 2
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      1
      0
      1
      0
      0
      1
      1
      1
      1
      0)
  end
  object DecisionQuery1: TDecisionQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT FECHA_PAGO, RAZON_SOCIAL, SUM( COSTO )'
      'FROM VW_SERV_EDIF'
      'GROUP BY FECHA_PAGO, RAZON_SOCIAL')
    Left = 538
    Top = 142
  end
end
