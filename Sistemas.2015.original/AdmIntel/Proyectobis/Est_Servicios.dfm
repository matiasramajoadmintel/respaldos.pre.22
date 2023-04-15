object frmEstServicios: TfrmEstServicios
  Left = 248
  Top = 373
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
  object Panel1: TPanel
    Left = 0
    Top = 427
    Width = 689
    Height = 30
    Align = alBottom
    TabOrder = 0
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 689
    Height = 427
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Tabla'
      object DecisionGrid1: TDecisionGrid
        Left = 0
        Top = 0
        Width = 681
        Height = 399
        DefaultColWidth = 200
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
            DisplayName = 'Fecha de pago'
            FieldName = 'FECHA_PAGO'
            Color = clNone
            Format = 'MMMM, YYYY'
            Alignment = taLeftJustify
            Subtotals = False
          end
          item
            DisplayName = 'Proveedor'
            FieldName = 'RAZON_SOCIAL'
            Color = clNone
            Alignment = taLeftJustify
            Subtotals = False
          end
          item
            DisplayName = 'Importe total'
            FieldName = 'SUM'
            Color = clNone
            Format = '#,0.00'
            Alignment = taRightJustify
            Subtotals = True
          end>
        Totals = True
        ShowCubeEditor = False
        Align = alClient
        Color = clBtnFace
        Ctl3D = True
        DefaultDrawing = False
        GridLineWidth = 1
        GridLineColor = clWindowText
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Gr'#225'fico'
      ImageIndex = 1
      object DecisionGraph1: TDecisionGraph
        Left = 0
        Top = 0
        Width = 681
        Height = 399
        DecisionSource = DecisionSource1
        Title.Text.Strings = (
          'TDecisionGraph')
        View3D = False
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
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
    end
  end
  object DecisionCube1: TDecisionCube
    DataSet = Query1
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
        ValueCount = 2
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
        ValueCount = 19
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
      'WHERE  IDPAGO IS NOT NULL '
      'GROUP BY FECHA_PAGO, RAZON_SOCIAL')
    Left = 474
    Top = 50
  end
  object Query1: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT FECHA_PAGO, RAZON_SOCIAL, SUM( COSTO )'
      'FROM VW_SERV_EDIF'
      'WHERE  IDPAGO IS NOT NULL '
      'GROUP BY FECHA_PAGO, RAZON_SOCIAL')
    Left = 538
    Top = 142
    object Query1FECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fecha de pago'
      FieldName = 'FECHA_PAGO'
      Origin = 'ADB.VW_SERV_EDIF.FECHA_PAGO'
    end
    object Query1RAZON_SOCIAL: TStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.VW_SERV_EDIF.RAZON_SOCIAL'
      Size = 45
    end
    object Query1SUM: TFloatField
      DisplayLabel = 'Importe total'
      FieldName = 'SUM'
      Origin = 'ADB.VW_SERV_EDIF.COSTO'
    end
  end
end
